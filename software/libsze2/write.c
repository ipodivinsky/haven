/*!
 * \file write.c
 * \brief Write functions
 * \author Andrej Hank <xhanka00@liberouter.org>
 * \date 2008
 */
/*
 * Copyright (C) 2008 CESNET
 *
 * LICENSE TERMS
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name of the Company nor the names of its contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * ALTERNATIVELY, provided that this notice is retained in full, this
 * product may be distributed under the terms of the GNU General Public
 * License (GPL) version 2 or later, in which case the provisions
 * of the GPL apply INSTEAD OF those given above.
 *
 * This software is provided ``as is'', and any express or implied
 * warranties, including, but not limited to, the implied warranties of
 * merchantability and fitness for a particular purpose are disclaimed.
 * In no event shall the company or contributors be liable for any
 * direct, indirect, incidental, special, exemplary, or consequential
 * damages (including, but not limited to, procurement of substitute
 * goods or services; loss of use, data, or profits; or business
 * interruption) however caused and on any theory of liability, whether
 * in contract, strict liability, or tort (including negligence or
 * otherwise) arising in any way out of the use of this software, even
 * if advised of the possibility of such damage.
 *
 * $Id$
 *
 */

#include <err.h>
#include <assert.h>
#include <errno.h>

#include <commlbr.h>

#include "libsze2.h"
#include "private.h"

#ifdef TX_BURST_DEBUG
static u_int32_t dbg_txb_bytes = 0;
#endif

/*! bytes to lock for burt write operation */
#define SZE2_BURST_WRITE_DEFAULT_SIZE (1024*1024)

u_int SZE2_BURST_WRITE_SIZE = SZE2_BURST_WRITE_DEFAULT_SIZE;

/*! ident identification */
__RCSID("$Id$");

/** where is packet cut */
enum sze_packet_cut {
	NO_CUT,
	CUT_HEADER,
	CUT_HWDATA,
	CUT_HEADER_ALIGN,
	CUT_SWDATA,
	CUT_ZEROS,
};

/* local function prototypes */
static void szedata_write_parted_prepared(unsigned int first_size,
		unsigned char *first_part, unsigned char *second_part,
		unsigned int data_len, const unsigned char *data);

static void szedata_write_parted(uint32_t first_size, u_char *first_part, u_char *second_part, uint32_t total_len, uint32_t sw_data_len, uint32_t hw_data_len, uint32_t sw_data_offset, uint32_t zeros_offset, uint32_t zeros_cnt, u_char *hw_data, u_char *sw_data, uint16_t segsize, uint16_t hwsize);

static void szedata_compute_header(unsigned int hw_data_len, unsigned int sw_data_len, u_int16_t *hw_size, u_int16_t *seg_size, unsigned int *total_len, unsigned int *sw_data_offset, unsigned int *zeros_offset, unsigned int *zeros_len);

/*!
 * \brief Try once send one sze packet through sze interface.
 *
 * \param sze
 * \param data Data to write - prepared sze packet(s) - one packet or whole
 * block of szedata2 packets each after another properly aligned
 * \param data_len Data length
 * \param interface to write - direct number
 *
 * \return
 * 	- 0 - success
 * 	- 1 - try again later - can't lock enough memory
 * 	- -1 - szedata_tx_unlock_data error
 * 	- -2 - data len not aligned to 8
 *
 *
 * Lock necessary space to write data, if driver offers enough available space
 * write and send prepared szedata2 packet(s), else try again later. One
 * szedata packet can be prepared by szedata_prepare_packet() function.
 * Each packet is sent separately therefore this function can be slow and
 * won't provide sufficient performance. However if sending blocks of packets,
 * function performance can be best possible.
 */
int szedata_try_write_next(struct szedata *sze, const unsigned char *data, unsigned int data_len, unsigned short iface) {
	const struct szedata_lock *lck;
	unsigned int available_size;
	int ret;

	/* check if data_len aligned to 8 ? */
	if (CL_ALIGN(data_len, 8) != data_len) {
		warnx("%s - data_len is not aligned to 8", __func__);
		return -2;
	}

	MSG(CL_VERBOSE_BASIC, "%s tx_locking sze %p, data_len %d, interface %d", __func__, sze, data_len, iface);
	sze->ct_tx_lck_orig[iface] = szedata_tx_lock_data(sze, data_len, iface); /* lock space for packet */
	lck = sze->ct_tx_lck_orig[iface];

	if (lck == NULL) {
		MSG(CL_VERBOSE_BASIC, "%s nothing locked", __func__);
		return 1;
	}

	available_size = lck->len; /* how many have we locked ? */
	if (lck->next)
		available_size += lck->next->len; /* add space from next */

#ifdef TX_BURST_DEBUG
	dbg_txb_bytes+= available_size;
	MSG(CL_VERBOSE_ADVANCED, "%s - bytes locked so far: %d", __func__, dbg_txb_bytes);
#endif

	if (available_size < data_len) { /* space is too small */
		szedata_tx_unlock_data(sze, sze->ct_tx_lck_orig[iface], 0);
		sze->ct_tx_lck_orig[iface] = NULL;
		MSG(CL_VERBOSE_BASIC, "%s not enough space locked", __func__);
		return 1;
	}

	/* write all needed to szedata provided space */
	if(lck->next)
		szedata_write_parted_prepared(lck->len, lck->start, lck->next->start, data_len, data);
	else {
		szedata_write_parted_prepared(lck->len, lck->start, NULL, data_len, data);
	}


	ret = szedata_tx_unlock_data(sze, sze->ct_tx_lck_orig[iface], data_len);
	if(ret != 0) {
		MSG(CL_VERBOSE_BASIC, "%s tx_unlock_data error", __func__);
		return -1;
	}
	sze->ct_tx_lck_orig[iface] = NULL;

	/* all ok */
	return 0;
}

/**
 * \brief Write data into two buffers according to first_size
 *
 * \param first_size How many bytes will be written into first space
 * \param data_len Lenght of data
 * \param first_part First buffer(lock) to write to
 * \param second_part Second buffer(lock) to write to
 * \param data Content (sze packet) to write
 */
static void szedata_write_parted_prepared(unsigned int first_size,
		unsigned char *first_part, unsigned char *second_part,
		unsigned int data_len, const unsigned char *data)
{
	if (!first_part)
		errx(10, "%s - nowhere to write", __func__);

	if (first_size < data_len) { /* cut into two parts */
		if (!second_part)
			errx(9, "%s - space too small", __func__);

		/* write first part */
		MSG(CL_VERBOSE_LIBRARY, "Writing to first size %d", first_size);
		memcpy(first_part, data, first_size);
		/* write second part */
		MSG(CL_VERBOSE_LIBRARY, "Writing to second size %d",
				data_len - first_size);
		memcpy(second_part, data + first_size, data_len - first_size);
	} else { /* all in first part */
		MSG(CL_VERBOSE_LIBRARY, "Writing to first size %d", data_len);
		memcpy(first_part, data, data_len);
	}
}

/*!
 * \brief Prepare and try to send one packet consisting of hw and sw data.
 *
 * \param sze Handle
 * \param hw_data Hw data
 * \param hw_data_len Hw data len
 * \param sw_data Sw data
 * \param sw_data_len Sw data len
 * \param interface TX interface number
 *
 * \return
 * 	- 0 - success
 * 	- 1 - try again later - can't lock enough memory
 * 	- -1 - szedata_tx_unlock_data error
 *
 * Whole packet is prepared right in szedata TX buffer == zero copy.
 * Performance should be better if sending each one packet after another than
 * szedata_prepare_packet and szedata_try_write_next.
 */
int szedata_prepare_and_try_write_next(struct szedata *sze, unsigned char *hw_data, unsigned int hw_data_len, unsigned char *sw_data, unsigned int sw_data_len, unsigned short iface) {
	uint16_t hw_size, seg_size;
	unsigned int total_len, sw_data_offset, zeros_offset, zeros_len;
	const struct szedata_lock *lck;
	unsigned int available_size;
	int ret;

	MSG(CL_VERBOSE_LIBRARY, "%s : sw data len      : %u", __func__, sw_data_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : hw data len      : %u", __func__, hw_data_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : interface        : %u", __func__, iface);

	/* comnpute packet info */
	szedata_compute_header(hw_data_len, sw_data_len, &hw_size, &seg_size, &total_len, &sw_data_offset, &zeros_offset, &zeros_len);

	MSG(CL_VERBOSE_LIBRARY, "%s : total len        : %u", __func__, total_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : sw data offset   : %u", __func__, sw_data_offset);
	MSG(CL_VERBOSE_LIBRARY, "%s : zeros len        : %u", __func__, zeros_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : zeros offset     : %u", __func__, zeros_offset);
	MSG(CL_VERBOSE_LIBRARY, "%s : segsize          : 0x%04x", __func__, seg_size);
	MSG(CL_VERBOSE_LIBRARY, "%s : hwsize           : 0x%04x", __func__, hw_size);

	/* lock space for packet */
	sze->ct_tx_lck_orig[iface] = szedata_tx_lock_data(sze, total_len,
			iface);
	lck = sze->ct_tx_lck_orig[iface];

	if (sze->ct_tx_lck_orig[iface] == NULL) {
		MSG(CL_VERBOSE_BASIC, "%s nothing locked", __func__);
		return 1;
	}

	available_size = lck->len; /* how many have we locked ? */
	if (lck->next)
		available_size += lck->next->len;

#ifdef TX_BURST_DEBUG
	dbg_txb_bytes += available_size;
	MSG(CL_VERBOSE_ADVANCED, "%s - bytes locked so far: %d", __func__,
			dbg_txb_bytes);
#endif

	if (available_size < total_len) { /* space is too small */
		szedata_tx_unlock_data(sze, sze->ct_tx_lck_orig[iface], 0);
		sze->ct_tx_lck_orig[iface] = NULL;
		MSG(CL_VERBOSE_BASIC, "%s not enough space locked", __func__);
		return 1;
	}

	/* write all needed to szedata provided space */
	if (lck->next) {
		szedata_write_parted(lck->len, lck->start, lck->next->start,
				total_len, sw_data_len, hw_data_len,
				sw_data_offset, zeros_offset, zeros_len,
				hw_data, sw_data, seg_size, hw_size);
	} else {
		szedata_write_parted(lck->len, lck->start, NULL, total_len,
				sw_data_len, hw_data_len, sw_data_offset,
				zeros_offset, zeros_len, hw_data, sw_data,
				seg_size, hw_size);
	}

	ret = szedata_tx_unlock_data(sze, sze->ct_tx_lck_orig[iface],
			total_len);
	if (ret) {
		MSG(CL_VERBOSE_BASIC, "%s tx_unlock_data error", __func__);
		return -1;
	}
	sze->ct_tx_lck_orig[iface] = NULL;

	/* all ok */
	return 0;
}

/*!
 * \brief Prepare segment size, hw size (in correct endianity), important offsets and counts needed to crate and send szedata packet.
 *
 * \param hw_data_len Lenght of hw data
 * \param sw_data_len Lenght of sw data
 * \param hw_size Return parameter - hw size
 * \param seg_size Return parameter - segment size
 * \param total_len Return paremeter - total lenght of szedata packet
 * \param sw_data_offset Return parameter - offset of sw data
 * \param zeros_offset Return parameter - offset of trailing zeros
 * \param zeros_len Return parameter - number of trailing zeros
 */
static void szedata_compute_header(unsigned int hw_data_len,
		unsigned int sw_data_len, u_int16_t *hw_size,
		u_int16_t *seg_size, unsigned int *total_len,
		unsigned int *sw_data_offset, unsigned int *zeros_offset,
		unsigned int *zeros_len)
{
	*sw_data_offset = CL_ALIGN(SZE_PACKET_HEADER_SIZE + hw_data_len, 8);
	*zeros_len = CL_ALIGN(sw_data_len, 8) - sw_data_len;
	*zeros_offset = *sw_data_offset + sw_data_len;
	*total_len = *zeros_offset + *zeros_len;
	*seg_size = cpu_to_le16((u_int16_t)(*total_len - *zeros_len));
	*hw_size = cpu_to_le16((u_int16_t)hw_data_len);
}

/*!
 * \brief Write header, hardware data, software data and trailing zeros aligned
 * directly into szedata2 buffer which can be devided into two spaces.
 *
 * \param first_size Size of first space
 * \param first_part Pointer to first space
 * \param second_part Pointer to second space
 * \param total_len Total size of szedata packet
 * \param sw_data_len Size of software data
 * \param hw_data_len Size of hardware data
 * \param sw_data_offset Software data offset
 * \param zeros_offset Offset of trailing zeros
 * \param zeros_cnt Number of trailing zeros
 * \param hw_data Pointer to hw data
 * \param sw_data Pointer to sw data
 * \param seg_size Precomputed segment size
 * \param hw_size Precoputed hw size
 *
 * Segment size and hw size will be just copied, correct endianity must be
 * ensured in advance.
 */
static void szedata_write_parted(uint32_t first_size, u_char *first_part,
		u_char *second_part, uint32_t total_len,
		uint32_t sw_data_len, uint32_t hw_data_len,
		uint32_t sw_data_offset, uint32_t zeros_offset,
		uint32_t zeros_cnt, u_char *hw_data, u_char *sw_data,
		uint16_t segsize, uint16_t hwsize)
{
	uint8_t seg0, seg1, hw0, hw1;
	enum sze_packet_cut cut;

	seg0 = segsize & 0xFF;
	seg1 = (segsize & 0xFF00) >> 8;
	hw0 = hwsize & 0xFF;
	hw1 = (hwsize & 0xFF00) >> 8;

	MSG(CL_VERBOSE_LIBRARY, "%s : first part size  : %8u", __func__, first_size);
	MSG(CL_VERBOSE_LIBRARY, "%s : second part size : %8u", __func__, total_len - first_size);
	MSG(CL_VERBOSE_LIBRARY, "%s : total len        : %u", __func__, total_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : sw data len      : %u", __func__, sw_data_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : hw data len      : %u", __func__, hw_data_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : sw data offset   : %u", __func__, sw_data_offset);
	MSG(CL_VERBOSE_LIBRARY, "%s : zeros len        : %u", __func__, zeros_cnt);
	MSG(CL_VERBOSE_LIBRARY, "%s : zeros offset     : %u", __func__, zeros_offset);
	MSG(CL_VERBOSE_LIBRARY, "%s : segsize          : 0x%04x", __func__, segsize);
	MSG(CL_VERBOSE_LIBRARY, "%s : hwsize           : 0x%04x", __func__, hwsize);

	/* where is packet cut ? */
	if (first_size >= total_len) { /* first_size >= segsize - all in first part */
		MSG(CL_VERBOSE_LIBRARY, "%s - no cut", __func__);
		cut = NO_CUT;
	} else if (first_size > (sw_data_offset + sw_data_len)) { /* cut in zeros */
		MSG(CL_VERBOSE_LIBRARY, "%s - cut in zeros", __func__);
		cut = CUT_ZEROS;
	} else if (first_size > (sw_data_offset)) { /* cut in sw data */
		MSG(CL_VERBOSE_LIBRARY, "%s - cut in sw data", __func__);
		cut = CUT_SWDATA;
	} else if (first_size > SZE_PACKET_HEADER_SIZE + hw_data_len) { /* cut in hw data align */
		MSG(CL_VERBOSE_LIBRARY, "%s - cut in header align", __func__);
		cut = CUT_HEADER_ALIGN;
	} else if (first_size > SZE_PACKET_HEADER_SIZE) { /* cut in hw data */
		MSG(CL_VERBOSE_LIBRARY, "%s - cut in hw data", __func__);
		cut = CUT_HWDATA;
	} else { /* cut in header */
		MSG(CL_VERBOSE_LIBRARY, "%s - cut in header", __func__);
		cut = CUT_HEADER;
	}

	/* write whole parts - to first space */
	switch (cut) {
	case NO_CUT:
		/* whole zeros */
		memset(first_part + sw_data_offset + sw_data_len, 0, zeros_cnt);
	case CUT_ZEROS:
		/* whole sw_data */
		memcpy(first_part + sw_data_offset, sw_data, sw_data_len);
	case CUT_SWDATA:
	case CUT_HEADER_ALIGN:
		/* whole hw_data */
		memcpy(first_part + SZE_PACKET_HEADER_SIZE, hw_data,
				hw_data_len);
	case CUT_HWDATA:
		/* whole header */
		*(uint16_t *)first_part = segsize;
		*(uint16_t *)(first_part + 2) = hwsize;
	case CUT_HEADER:
		break;
	default:
		errx(20, "%s error", __func__);
	}

	/* write cut part - to first and second space */
	switch (cut) {
	case NO_CUT:
		break;
	case CUT_ZEROS:
		/* first space */
		memset(first_part + zeros_offset, 0, first_size - zeros_offset);
		/* second space */
		memset(second_part, 0, total_len - first_size);
		break;
	case CUT_SWDATA:
		/* first space */
		memcpy(first_part + sw_data_offset, sw_data,
				first_size - sw_data_offset);
		/* second space */
		memcpy(second_part, sw_data + first_size - sw_data_offset,
				sw_data_len - (first_size - sw_data_offset));
		break;
	case CUT_HEADER_ALIGN:
		break;
	case CUT_HWDATA:
		/* first space */
		memcpy(first_part + SZE_PACKET_HEADER_SIZE, hw_data,
				first_size - SZE_PACKET_HEADER_SIZE);
		/* second space */
		memcpy(second_part,
			hw_data + (first_size - SZE_PACKET_HEADER_SIZE),
			hw_data_len - (first_size - SZE_PACKET_HEADER_SIZE));
		break;
	case CUT_HEADER:
		/* first space */
		switch (first_size) {
		case 4:
			*(u_char *)(first_part + 3) = hw1;
		case 3:
			*(u_char *)(first_part + 2) = hw0;
		case 2:
			*(u_char *)(first_part + 1) = seg1;
		case 1:
			*(u_char *)first_part = seg0;
		case 0:
			break;
		}
		/* second space */
		switch (first_size) {
		case 0:
			*(u_char *)(second_part) = seg0;
		case 1:
			*(u_char *)(second_part + 1 - first_size) = seg1;
		case 2:
			*(u_char *)(second_part + 2 - first_size) = hw0;
		case 3:
			*(u_char *)(second_part + 3 - first_size) = hw1;
		case 4:
			break;
		}
		break;
	default:
		errx(20, "%s error", __func__);
	}

	/* write whole parts - to second space */
	switch (cut) {
	case CUT_HEADER:
		/* whole hw_data */
		memcpy(second_part + (SZE_PACKET_HEADER_SIZE - first_size),
				hw_data, hw_data_len);
	case CUT_HWDATA:
	case CUT_HEADER_ALIGN:
		/* whole sw_data */
		memcpy(second_part + (sw_data_offset - first_size), sw_data,
				sw_data_len);
	case CUT_SWDATA:
		/* whole zeros */
		memset(second_part + zeros_offset - first_size, 0, zeros_cnt);
	case CUT_ZEROS:
	case NO_CUT:
		break;
	default:
		errx(20, "%s error", __func__);
	}
}

/*!
 * \brief Create szedata2 packet and store it into pre-allocated space in
 * sze->ct_tx_buffer
 *
 * \param sze Handler
 * \param hw_data Hw data pointer
 * \param hw_data_len Length of hw data
 * \param data Data ptr
 * \param data_len Data length
 * \param len Return parameter - length of created packet
 *
 * \return
 * 	- sze->ct_tx_buffer - packet prepared
 * 	- NULL - error
 */
unsigned char *szedata_prepare_packet(struct szedata *sze,
		const unsigned char *hw_data, unsigned int hw_data_len,
		const unsigned char *sw_data, unsigned int sw_data_len,
		unsigned int *len)
{
	unsigned int sw_data_offset = CL_ALIGN(SZE_PACKET_HEADER_SIZE +
			hw_data_len, 8);
	unsigned int zeros_cnt = CL_ALIGN(sw_data_len, 8) - sw_data_len;
	unsigned int total_len = sw_data_offset + sw_data_len + zeros_cnt;
	u_int16_t seg_size, hw_size;

	if (total_len > SZE2_MAX_FRAME_SIZE) {
		*len = 0;
		warnx("%s Packet too long: %d B", __func__, total_len);
		return NULL;
	}

	/* write segsize and hwsize */
	seg_size = cpu_to_le16((u_int16_t)(total_len - zeros_cnt));
	hw_size = cpu_to_le16((u_int16_t)hw_data_len);

	*(u_int16_t*)(sze->ct_tx_buffer) = seg_size;
	*(((u_int16_t*)sze->ct_tx_buffer) + 1) = hw_size;

	/* copy hw data */
	memcpy(sze->ct_tx_buffer + SZE_PACKET_HEADER_SIZE, hw_data, hw_data_len);

	/* copy sw data */
	memcpy(sze->ct_tx_buffer + sw_data_offset, sw_data, sw_data_len);

	/* write zeros */
	memset(sze->ct_tx_buffer + sw_data_offset + sw_data_len, 0, zeros_cnt);

	*len = total_len;
	return sze->ct_tx_buffer;
}

/*!
 * \brief Burst write one packet.
 *
 * \param sze Handle
 * \param hw_data
 * \param hw_data_len
 * \param sw_data
 * \param sw_data_len
 * \param iface Interface to send on
 *
 * \return
 * 	- 0 - OK
 * 	- 1 - try again later - can't lock enough memory
 * 	- -1 - szedata_tx_unlock_data error
 *
 * Space of size SZE2_BURST_WRITE_SIZE is locked if necessary, this "context"
 * information (written bytes, remaining bytes, current lock...) is stored in
 * sze->ct_tx variables.
 *
 * Szedata2 packet is prepared and stored directly in szedata2 driver's buffer.
 * Packets are stored one after another until buffer (locked space) is full, then prepared
 * packets are sent at once.
 *
 * You can explicitly flush buffer, send all prepared and not yet sent packets,
 * by szedata_burst_write_flush functions. Flush is performed also during
 * szedata_close function.
 *
 * Size of buffer - requested space to lock - can be set by external variable
 * SZE2_BURST_WRITE_SIZE. Bigger buffer can bring better throughput, but if
 * buffer size is too big, It might happen that driver can't provide so big
 * space and won't provide any space at all - application will end in
 * neverending loop.
 */
int szedata_burst_write_next(struct szedata *sze,
		unsigned char *hw_data, unsigned int hw_data_len,
		unsigned char *sw_data, unsigned int sw_data_len,
		unsigned short iface)
{
	const struct szedata_lock **lck_orig = &(sze->ct_tx_lck_orig[iface]);
	const struct szedata_lock **lck = &(sze->ct_tx_lck[iface]);
	unsigned int total_len, sw_data_offset, zeros_offset, zeros_len;
	uint16_t hw_size, seg_size;
	u_int *written = &(sze->ct_tx_written_bytes[iface]);
	u_int *rem = &(sze->ct_tx_rem_bytes[iface]);
	u_char **cur_ptr = &(sze->ct_tx_cur_ptr[iface]);
	bool unlock_old = false;
	bool lock_new = false;
	int ret;

	MSG(CL_VERBOSE_LIBRARY, "%s : sw data len      : %u", __func__, sw_data_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : hw data len      : %u", __func__, hw_data_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : interface        : %u", __func__, iface);

	/* comnpute packet info */
	szedata_compute_header(hw_data_len, sw_data_len, &hw_size, &seg_size,
			&total_len, &sw_data_offset, &zeros_offset, &zeros_len);

	MSG(CL_VERBOSE_LIBRARY, "%s : total len        : %u", __func__, total_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : sw data offset   : %u", __func__, sw_data_offset);
	MSG(CL_VERBOSE_LIBRARY, "%s : zeros len        : %u", __func__, zeros_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : zeros offset     : %u", __func__, zeros_offset);
	MSG(CL_VERBOSE_LIBRARY, "%s : segsize          : 0x%04x", __func__, seg_size);
	MSG(CL_VERBOSE_LIBRARY, "%s : hwsize           : 0x%04x", __func__, hw_size);

	assert(total_len <= SZE2_BURST_WRITE_SIZE);

	/* current lck full */
	if (*rem < total_len) {
		MSG(CL_VERBOSE_LIBRARY, "%s : not enough data in current lck", __func__);
		if (*lck) {
			if ((*lck)->next) {
				if (*rem + (*lck)->next->len >= total_len) { /* fits into second */
					MSG(CL_VERBOSE_LIBRARY, "%s : but with lck->next enough", __func__);
					unlock_old = false;
				} else { /* don't have enough */
					MSG(CL_VERBOSE_LIBRARY, "%s : unlock old and lock new", __func__);
					unlock_old = true;
				}
			} else {
				MSG(CL_VERBOSE_LIBRARY, "%s : unlock old and lock new", __func__);
				unlock_old = true;
			}
		} else {
			MSG(CL_VERBOSE_LIBRARY, "%s : don't unlock old, but lock new", __func__);
			unlock_old = false;
			lock_new = true;
		}
	}

	if (unlock_old) {
		MSG(CL_VERBOSE_LIBRARY, "%s : unlocking", __func__);
		if (*lck_orig) {
			ret = szedata_tx_unlock_data(sze, *lck_orig, *written);

			if(ret != 0) {
				MSG(CL_VERBOSE_BASIC, "%s tx_unlock_data error", __func__);
				return -1;
			}
			lock_new = true;
			*lck = *lck_orig = NULL;
			*rem = 0;
			*written = 0;
			*cur_ptr = NULL;
		}
	}

	if (lock_new) {
		MSG(CL_VERBOSE_LIBRARY, "%s : locking", __func__);
		*lck = *lck_orig = szedata_tx_lock_data(sze,
				SZE2_BURST_WRITE_SIZE, iface);

		if (*lck_orig == NULL) {
			MSG(CL_VERBOSE_BASIC, "%s nothing locked", __func__);
			errno = EAGAIN;
			return 1;
		}

		*rem = (*lck_orig)->len;
		*written = 0;
		*cur_ptr = (*lck_orig)->start;
	}

	/* got finally enough ? */
	if (*rem < total_len) {
		if ((*lck)->next) {
			if (*rem + (*lck)->next->len < total_len) {
				errno = EAGAIN;
				return 1;
			}
		} else {
			errno = EAGAIN;
			return 1;
		}
	}

	MSG(CL_VERBOSE_LIBRARY, "%s : writing - rem: %u, rem_next: %u, need: %u",
		__func__, *rem, (*lck)->next ? (*lck)->next->len : 0, total_len);

	/* got enough space now */
	szedata_write_parted(*rem > total_len ? total_len : *rem,
		*cur_ptr, (*lck)->next ? (*lck)->next->start : NULL, total_len,
		sw_data_len, hw_data_len, sw_data_offset, zeros_offset,
		zeros_len, hw_data, sw_data, seg_size, hw_size);

	/* adjust current ptr, lck, written bytes, remaining bytes */
	if (*rem < total_len) { /* written into second */
		*lck = (*lck)->next;
		*written += total_len;
		*cur_ptr = (*lck)->start + (total_len - *rem);
		*rem = (*lck)->len - (total_len - *rem);
	} else {
		*written += total_len;
		*cur_ptr += total_len;
		*rem -= total_len;
	}
	sze->write_size[iface] += total_len;

	/* all ok */
	return 0;
}

/*!
 * \brief Explicitly flush buffer of burst write operation.
 *
 * \param sze Handle
 * \param iface Number of interface
 *
 * \return
 * 	- 0 - OK
 * 	- -1 - error
 */
static int szedata_burst_write_flush(struct szedata *sze, unsigned short iface)
{
	int ret = 0;

	if (sze->ct_tx_lck_orig[iface]) {
		MSG(CL_VERBOSE_LIBRARY, "unlocking sze->ct_tx_lck_orig[%d] - %u",
				iface, sze->ct_tx_written_bytes[iface]);
		ret = szedata_tx_unlock_data(sze, sze->ct_tx_lck_orig[iface],
				sze->ct_tx_written_bytes[iface]);

		if (ret != 0) {
			MSG(CL_VERBOSE_BASIC, "%s tx_unlock_data error", __func__);
			return -1;
		}
		sze->ct_tx_written_bytes[iface] = 0;
		sze->ct_tx_rem_bytes[iface] = 0;
		sze->ct_tx_cur_ptr[iface] = NULL;
		sze->ct_tx_lck_orig[iface] = NULL;
		sze->ct_tx_lck[iface] = NULL;
	}

	return 0;
}

/*!
 * \brief Flush all buffers of burst write operations.
 *
 * \param sze Handle
 *
 * \return
 * 	- 0 - OK
 * 	- else - failed
 */
int szedata_burst_write_flush_all(struct szedata *sze)
{
	unsigned int i;
	int ret = 0;

	for (i = 0; i < sze->info->areas_available[SZE2_MMIO_TX]; i++)
		ret += szedata_burst_write_flush(sze, i);

	return ret;
}

