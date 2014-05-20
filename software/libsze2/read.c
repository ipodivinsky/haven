/*!
 * \file read.c
 * \brief Read functions
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

#include <commlbr.h>
#include <unistd.h>
#include <arpa/inet.h>

#include <err.h>
#include <errno.h>

#include "libsze2.h"
#include "private.h"

/*! Ident identification */
__RCSID("$Id$");

/*!
 * \brief Try to lock space for RX in context (means read_next function).
 *
 * \param sze Handle
 *
 * \return
 * 	Locked bytes
 */
static INLINE unsigned int szedata_ct_rx_lock(struct szedata *sze)
{
	MSG(CL_VERBOSE_LIBRARY, "%s trying to lock something", __func__);
	sze->ct_rx_lck_orig = sze->ct_rx_lck = szedata_rx_lock_data(sze, ~0U);

	if (sze->ct_rx_lck == NULL) { /* nothing to lock */
		MSG(CL_VERBOSE_LIBRARY, "%s nothing locked", __func__);
		return 0;
	}

	sze->ct_rx_cur_ptr = sze->ct_rx_lck->start;
	sze->ct_rx_rem_bytes = sze->ct_rx_lck->len;

	MSG(CL_VERBOSE_LIBRARY, "%s locked %d", __func__, sze->ct_rx_rem_bytes);

	return sze->ct_rx_rem_bytes;
}

static INLINE void szedata_ct_rx_unlock(struct szedata *sze)
{
	MSG(CL_VERBOSE_LIBRARY, "%s freeing locked space", __func__);
	szedata_rx_unlock_data(sze, sze->ct_rx_lck_orig);
	sze->ct_rx_lck_orig = NULL;
	sze->ct_rx_lck = NULL;
}

/*!
 * \brief Get header pointer.
 *
 * Get header from szedata2 packet. If packet split, copy it into rx merge buffer, else just point into locked space.
 * Handle ct_rx_cur_ptr, ct_rx_rem_bytes and ct_rx_lck are adjusted.
 *
 * \param sze Handle
 * \param is_split Return parameter - is header split and stored in merge buffer ?
 *
 * \return
 * 	Header pointer
 */
static u_char *szedata_ct_rx_get_header(struct szedata *sze, bool *is_split)
{
	u_char *header_ptr;

	if (sze->ct_rx_rem_bytes < SZE_PACKET_HEADER_SIZE) { /* cut in header - copy parts of header to merge buffer */
		*is_split = true;

		MSG(CL_VERBOSE_LIBRARY, "%s cut in header - remaining_bytes %d",
				__func__, sze->ct_rx_rem_bytes);
		if (sze->ct_rx_lck->next == NULL) {
			szedata_dump_spaces(sze, stdout, SZE2_SPACE_RX_0);
			errx(4, "Missing next lock!");
		}

		/* copy first part of header */
		memcpy(sze->ct_rx_buffer, sze->ct_rx_cur_ptr,
				sze->ct_rx_rem_bytes);

		/* copy second part of header */
		sze->ct_rx_lck = sze->ct_rx_lck->next;
		sze->ct_rx_cur_ptr = sze->ct_rx_lck->start;
		memcpy(sze->ct_rx_buffer + sze->ct_rx_rem_bytes,
				sze->ct_rx_cur_ptr,
				SZE_PACKET_HEADER_SIZE - sze->ct_rx_rem_bytes);

		sze->ct_rx_cur_ptr += SZE_PACKET_HEADER_SIZE -
			sze->ct_rx_rem_bytes;
		sze->ct_rx_rem_bytes = sze->ct_rx_lck->len -
			SZE_PACKET_HEADER_SIZE + sze->ct_rx_rem_bytes;

		header_ptr = sze->ct_rx_buffer;
	} else { /* not cut */
		*is_split = false;

		header_ptr = sze->ct_rx_cur_ptr;
		sze->ct_rx_cur_ptr += SZE_PACKET_HEADER_SIZE;
		sze->ct_rx_rem_bytes -= SZE_PACKET_HEADER_SIZE;
	}

	return header_ptr;
}

/*!
 * \brief Decode segsize and hwsize from szedata2 packet header.
 *
 * Ensures proper endianity.
 *
 * \param header_ptr Header pointer
 * \param seg_size Return parameter - segment size
 * \param hw_size Return parameter - hw size
 *
 * TODO - from utils.h
 */
static INLINE void szedata_decode_header(struct szedata2_packet *header_ptr,
		u_int16_t *seg_size, u_int16_t *hw_size)
{
	*seg_size = le16_to_cpu(header_ptr->seg_size);
	*hw_size = le16_to_cpu(header_ptr->hw_size);
}

/*!
 * \brief Get data pointer.
 *
 * If packet split, copy it into rx merge buffer, else just point into locked
 * space.
 * Handle ct_rx_cur_ptr, ct_rx_rem_bytes and ct_rx_lck are adjusted.
 *
 * \param sze Handle
 * \param is_split Return parameter - is packet split
 *
 * \return Pointer to body (data)
 */
static u_char *szedata_ct_rx_get_body(struct szedata *sze, bool *is_split,
		u_int16_t seg_size)
{
	u_char *data_ptr = NULL;

	if (sze->ct_rx_rem_bytes >=
			(u_int16_t)(seg_size - SZE_PACKET_HEADER_SIZE)) { /* no cut */
		/* one packet ready - go to another */
		*is_split = false;
		data_ptr = sze->ct_rx_cur_ptr;
		sze->ct_rx_cur_ptr += CL_ALIGN(seg_size, 8) -
			SZE_PACKET_HEADER_SIZE;
		sze->ct_rx_rem_bytes -= CL_ALIGN(seg_size, 8) -
			SZE_PACKET_HEADER_SIZE;
	} else { /* cut in data */
		*is_split = true;
		if (sze->ct_rx_lck->next == NULL) {
			szedata_dump_spaces(sze, stdout, SZE2_SPACE_RX_0);
			errx(6, "Need \"next\" lock, but it is missing: %u",
					sze->ct_rx_rem_bytes);
		}

		/* copy first part of data */
		memcpy(sze->ct_rx_buffer + SZE_PACKET_HEADER_SIZE,
				sze->ct_rx_cur_ptr, sze->ct_rx_rem_bytes);

		/* MOVE to next lock */
		sze->ct_rx_lck = sze->ct_rx_lck->next;
		MSG(CL_VERBOSE_LIBRARY, "%s moved to next lock, here %d locked",
				__func__, sze->ct_rx_lck->len);
		sze->ct_rx_cur_ptr = sze->ct_rx_lck->start;

		/* copy second part of data */
		memcpy(sze->ct_rx_buffer + SZE_PACKET_HEADER_SIZE +
				sze->ct_rx_rem_bytes, sze->ct_rx_cur_ptr,
				(seg_size - SZE_PACKET_HEADER_SIZE) -
				sze->ct_rx_rem_bytes);

		data_ptr = sze->ct_rx_buffer + SZE_PACKET_HEADER_SIZE;
		sze->ct_rx_cur_ptr += CL_ALIGN(seg_size, 8) -
			SZE_PACKET_HEADER_SIZE - sze->ct_rx_rem_bytes;
		sze->ct_rx_rem_bytes = sze->ct_rx_lck->len -
			(CL_ALIGN(seg_size, 8) - SZE_PACKET_HEADER_SIZE -
			 sze->ct_rx_rem_bytes);
	}

	return data_ptr;
}

/*!
 * \brief  Read one sze packet from sze interface.
 *
 * \param sze Handler
 * \param len Return parameter - length of packet
 *
 * \return
 * 	- NULL - nothing to read
 * 	- else - sze packet data - must be processed until next call of this function
 *
 * If none packets locked by sze - lock some and fill sze->ct_rx* holding
 * information about this "context" (current lock, position in locked space,
 * read bytes...). Jump to another packet after each call until no packet
 * left. Data of each packet for sure survive to another call of this function
 * and must be processed until this call because this call can unlock them.
 * If packet is split in two parts - it is copied to merge buffer
 * (sze->ct_rx_buffer) otherwise direct pointer into szedata2 driver buffer is
 * returned (this avoids copying).  Open lock is unlocked during
 * szedata_close().
 *
 *
 * Legend:
 *  - header means segsize and hwsize
 *  - body means all other
 */
unsigned char *szedata_read_next(struct szedata *sze, unsigned int *len)
{
	u_int16_t seg_size;
	u_int16_t hw_size;
	unsigned char *orig_ptr = NULL;	/* beginning of current packet */
	unsigned char *data_ptr = NULL;	/* position of data */
	struct szedata2_packet *header_ptr = NULL;
	short events = SZEDATA_POLLRX;
	bool split_packet_header_copied = false;	/* is header already copied into sze->ct_rx_buffer ? */
	bool split_packet_data_copied = false;		/* is body already copied into sze->ct_rx_buffer ? */
	int filter_pass;
	unsigned int locked_bytes;
	int ret;

	MSG(CL_VERBOSE_LIBRARY, "%s started", __func__);

	if (!len) {
		warnx("%s : len is NULL but it is return parameter !",
				__func__);
		return NULL;
	}

	do {
		/* unlock old data ? - in the beginnig because we need to keep
		 * packet locked until next call of read_next */
		if (sze->ct_rx_lck != NULL && !sze->ct_rx_rem_bytes &&
				sze->ct_rx_lck->next == NULL) {
			szedata_ct_rx_unlock(sze);
		}

		/* nothing to read - lock seomething */
		if (!sze->ct_rx_rem_bytes && sze->ct_rx_lck_orig == NULL) {
			//TODO - add adaptible poll
			//try to lock something
			locked_bytes = szedata_ct_rx_lock(sze);
			//if not locked something, try to poll and than lock
			if (!locked_bytes) {
				events = SZEDATA_POLLRX;
				ret = szedata_poll(sze, &events, SZE2_RX_POLL_TIMEOUT);
				if (ret < 0){
					if (errno == EINTR) {
						MSG(CL_VERBOSE_LIBRARY, "Poll interrupted");
						return NULL;
					} else {
						errx(1, "Poll failure");
					}
				}

				if (ret && !(events & SZEDATA_POLLRX)) {
					warnx("Poll error");
					return NULL;
				}

				locked_bytes = szedata_ct_rx_lock(sze);

				if (!locked_bytes) {
					*len = 0;
					return NULL;
				}
			}
		}

		/* save start of current packet */
		orig_ptr = sze->ct_rx_cur_ptr;

		/* process header */
		header_ptr = (struct szedata2_packet *)szedata_ct_rx_get_header(sze, &split_packet_header_copied);
		szedata_decode_header(header_ptr, &seg_size, &hw_size);

		/* checks if packet all right */
		if (!seg_size) {
			szedata_dump_spaces(sze, stdout, SZE2_SPACE_RX_0);
			errx(5, "Zero segsize");
		}

		/* check seg_size and hwsize */
		if (hw_size > seg_size - SZE_PACKET_HEADER_SIZE) {
			szedata_dump_spaces(sze, stdout, SZE2_SPACE_RX_0);
			errx(10, "Hwsize bigger than expected. Segsize: %d, hwsize: %d", seg_size, hw_size);
		}

		data_ptr = szedata_ct_rx_get_body(sze,
				&split_packet_data_copied, seg_size);

		if (sze->ct_rx_filter != NULL) {
			filter_pass = sze->ct_rx_filter(hw_size, data_ptr);
			if (!filter_pass) { /* packet passed by filter - return it */
				MSG(CL_VERBOSE_LIBRARY, "%s : Packet passed filter", __func__);
				break;
			} else {
				MSG(CL_VERBOSE_LIBRARY, "%s : Packet rejected by filter", __func__);
			}
		} else
			break;
	} while(1);

	*len = seg_size;

	/* if split, copy all needed to merge buffer */
	if (split_packet_data_copied || split_packet_header_copied) {
		if (split_packet_header_copied){ /* copy body to merge buffer */
			memcpy(sze->ct_rx_buffer + SZE_PACKET_HEADER_SIZE,
					data_ptr,
					seg_size - SZE_PACKET_HEADER_SIZE);
		}
		if (split_packet_data_copied){ /* copy header to merge buffer */
			memcpy(sze->ct_rx_buffer, header_ptr, SZE_PACKET_HEADER_SIZE);
		}
		return sze->ct_rx_buffer;
	} else { /* whole packet in one buffer */
		return (unsigned char *)orig_ptr;
	}
}
