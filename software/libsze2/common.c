/*!
 * \file common.c
 * \brief Common functions
 * \author Jiri Slaby <jirislaby@gmail.com>
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

#include <assert.h>
#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <poll.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>

#include <commlbr.h>

#include "libsze2.h"
#include "private.h"

/*! Ident identification */
__RCSID("$Id$");

#define __unused__ __attribute__((unused))

/* add strings to identification of important macro status by ident */
/* general debug options */
#ifdef DEBUG
static const char _rcsid_flag_debug[] = "$flag: DEBUG=YES $";
#else
static const char _rcsid_flag_debug[] = "$flag: DEBUG=NO $";
#endif

/* ring buffer debug - suitable for HW guys */
#ifdef RING_BUFF_DEBUG
static const char _rcsid_flag_ring_buff_debug[] = "$flag: RING_BUFF_DEBUG=YES $";
#else
static const char _rcsid_flag_ring_buff_debug[] = "$flag: RING_BUFF_DEBUG=NO $";
#endif

static long PAGE_SIZE;

int SZE2_RX_POLL_TIMEOUT=50; /**< RX poll timeout */
int SZE2_TX_POLL_TIMEOUT=25; /**< TX poll timeout */

#if 1 /* to be removed after some time */
int SZE2_RX_POLL_CNT; /**< RX poll packets cnt in Bytes */
int SZE2_TX_POLL_CNT; /**< TX poll packets cnt in Bytes */
#endif

/*!
 * \brief Set poll variables according to environment variables equivalents.
 *
 * \return
 * 	- 0 - OK
 * 	- -1 - error
 */
static int szedata_check_env_vars(void)
{
	char *env_var = NULL;

	env_var = getenv("SZE2_RX_POLL_TIMEOUT");
	if (env_var) {
		SZE2_RX_POLL_TIMEOUT = atoi(env_var);
		if (SZE2_RX_POLL_TIMEOUT < SZE2_RX_POLL_TIMEOUT_MIN ||
				SZE2_RX_POLL_TIMEOUT > SZE2_RX_POLL_TIMEOUT_MAX) {
			warnx("SZE2_RX_POLL_TIMEOUT environment variable wrong "
					"value: %d", SZE2_RX_POLL_TIMEOUT);
			return -1;
		}
		MSG(CL_VERBOSE_LIBRARY, "SZE2_RX_POLL_TIMEOUT set to %d\n",
				SZE2_RX_POLL_TIMEOUT);
	}
	env_var = getenv("SZE2_TX_POLL_TIMEOUT");
	if (env_var) {
		SZE2_TX_POLL_TIMEOUT = atoi(env_var);
		if (SZE2_TX_POLL_TIMEOUT < SZE2_TX_POLL_TIMEOUT_MIN ||
				SZE2_TX_POLL_TIMEOUT > SZE2_TX_POLL_TIMEOUT_MAX) {
			warnx("SZE2_TX_POLL_TIMEOUT environment variable wrong "
					"value: %d", SZE2_TX_POLL_TIMEOUT);
			return -1;
		}
		MSG(CL_VERBOSE_LIBRARY, "SZE2_TX_POLL_TIMEOUT set to %d\n",
				SZE2_TX_POLL_TIMEOUT);
	}

#if 1 /* to be removed after some time */
	env_var = getenv("SZE2_RX_POLL_CNT");
	if (env_var)
		warnx("SZE2_RX_POLL_CNT is ignored now");

	env_var = getenv("SZE2_TX_POLL_CNT");
	if (env_var)
		warnx("SZE2_TX_POLL_CNT is ignored now");
#endif

	return 0;
}

static void szedata_free_buffers(struct szedata *sze)
{
	free(sze->ct_tx_cur_ptr);
	free(sze->ct_tx_rem_bytes);
	free(sze->ct_tx_written_bytes);
	free(sze->ct_tx_lck_orig);
	free(sze->ct_tx_lck);
	free(sze->ct_tx_buffer);
	free(sze->ct_rx_buffer);
	free(sze->rx_asize);
	free(sze->tx_asize);
}

static void szedata_free_mappings(struct szedata *sze)
{
	unsigned int a;

	for (a = 0; a < SZE2_MMIO_MAX; a++)
		if (sze->space[a] != MAP_FAILED)
			munmap(sze->space[a], sze->info->sizes[a]);
	if (sze->info != MAP_FAILED)
		munmap(sze->info, PAGE_SIZE);
	if (sze->write_size != MAP_FAILED)
		munmap(sze->write_size, PAGE_SIZE);
}

static int szedata_get_area_sizes(struct szedata *sze, unsigned int rx_ifaces,
		unsigned int tx_ifaces)
{
	unsigned int a, dir;

	for (dir = 0; dir < 2; dir++) {
		__u32 *dest = dir ? sze->tx_asize : sze->rx_asize;
		unsigned int space = dir ? SZE2_MMIO_TX : SZE2_MMIO_RX;
		unsigned int ifaces = dir ? tx_ifaces : rx_ifaces;
		for (a = 0; a < ifaces; a++) {
			struct sze2_areasize asize = { { {
				.space = space,
				.area = a,
			} } };

			if (ioctl(sze->fd, SZE2_IOC_AREASIZE, &asize)) {
				warn("ioctl SZE2_IOC_AREASIZE");
				return errno;
			}
			dest[a] = asize.size;
		}
	}

	return 0;
}

/**
 * open szedata device node
 *
 * Also remaps also all available spaces and does necessary initialization.
 *
 * @param node string describing which node to open
 * @return NULL on failure, otherwise pointer to a structure, which is passed
 *	to another functions as primary parameter
 */
struct szedata *szedata_open(const char *node)
{
	struct szedata *sze;
	unsigned int a, cnt, rx_ifaces, tx_ifaces;
	int res;

	PAGE_SIZE = sysconf(_SC_PAGE_SIZE);
	if (PAGE_SIZE <= 0) {
		warnx("sysconf(_SC_PAGE_SIZE) failed");
		return NULL;
	}

	sze = malloc(sizeof(*sze));
	if (sze == NULL)
		return NULL;
	memset(sze, 0, sizeof(*sze));
	sze->info = MAP_FAILED;
	sze->write_size = MAP_FAILED;
	for (a = 0, cnt = 0; a < SZE2_MMIO_MAX; a++){
		sze->space[a] = MAP_FAILED;
	}

	sze->fd = open(node, O_RDWR);
	if (sze->fd < 0) {
		if(verbose > CL_VERBOSE_OFF){
			warn("open '%s'", node);
		}
		goto err;
	}

	sze->info = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, sze->fd, 0);
	if (sze->info == MAP_FAILED) {
		warn("mmap info failed");
		goto err_close;
	}

	if ((sze->info->magic & 0xffffff00) != 0xde4d0200) {
		warnx("not a szedata2 device or corrupted memory");
		goto err_unmap;
	}

	sze->write_size = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE,
			MAP_SHARED, sze->fd, PAGE_SIZE);
	if (sze->write_size == MAP_FAILED) {
		warn("mmap write_size failed");
		goto err_unmap;
	}

	for (a = 0, cnt = 0; a < SZE2_MMIO_MAX; a++) {
		sze->space[a] = mmap(NULL, sze->info->sizes[a], PROT_READ |
				(a == SZE2_MMIO_TX ? PROT_WRITE : 0),
				MAP_SHARED, sze->fd, sze->info->offsets[a]);
		if (sze->space[a] != MAP_FAILED) {
			cnt++;
		}
	}
	if (!cnt) {
		warnx("mmap spaces failed");
		goto err_unmap;
	}

	rx_ifaces = szedata_ifaces_available(sze, SZE2_DIR_RX);
	tx_ifaces = szedata_ifaces_available(sze, SZE2_DIR_TX);

	sze->rx_asize = calloc(rx_ifaces, sizeof(__u32));
	sze->tx_asize = calloc(tx_ifaces, sizeof(__u32));

	/* initialize context variables */
	sze->ct_tx_lck_orig = calloc(tx_ifaces, sizeof(struct szedata_lock *));
	sze->ct_tx_lck = calloc(tx_ifaces, sizeof(struct szedata_lock *));
	sze->ct_tx_rem_bytes = calloc(tx_ifaces, sizeof(unsigned int));
	sze->ct_tx_written_bytes = calloc(tx_ifaces, sizeof(unsigned int));
	sze->ct_tx_cur_ptr = calloc(tx_ifaces, sizeof(unsigned char *));

	sze->ct_rx_buffer = malloc(SZE2_MAX_FRAME_SIZE);
	sze->ct_tx_buffer = malloc(SZE2_MAX_FRAME_SIZE);

	/* c89 says: calloc returns valid pointer or NULL when nmemb == 0 */
	if (rx_ifaces && (!sze->rx_asize))
		goto err_free;

	if (tx_ifaces && (!sze->tx_asize || !sze->ct_tx_lck_orig ||
			!sze->ct_tx_lck || !sze->ct_tx_rem_bytes ||
			!sze->ct_tx_written_bytes || !sze->ct_tx_cur_ptr))
		goto err_free;

	if (!sze->ct_rx_buffer || !sze->ct_tx_buffer)
		goto err_free;

	if (szedata_check_env_vars()) {
		warnx("Environment variables check failed");
		goto err_free;
	}

	res = szedata_get_area_sizes(sze, rx_ifaces, tx_ifaces);
	if (res)
		goto err_free;

	return sze;
err_free:
	szedata_free_buffers(sze);
err_unmap:
	szedata_free_mappings(sze);
err_close:
	close(sze->fd);
err:
	free(sze);
	return NULL;
}

/**
 * subscribe interfaces to read from or write to
 *
 * This is usually called after szedata_open to select which interfaces
 * we want to use and how long (for how many bytes) wait if there is no
 * data available and poll is invoked. Both per both rx and tx.
 *
 * The masks returned in rx and tx must not be the same as requested.
 * Some interface might fail to subscribe.
 *
 * It is suitable to subscribe only interfaces physically available for used
 * design e.g. flowmon with only 1 RX interface - rx = 0x1 tx=0x00, e.g. NIC
 * with 4 RX and 4 TX interfaces - rx = 0xf tx=0xf.
 *
 * @param sze structure returned by szedata_open
 * @param rx bitmap of interfaces to subscribe for rx (filled back)
 * @param tx bitmap of interfaces to subscribe for tx (filled back)
 * @param res1 unused now
 * @param res2 unused now
 * @return 0 -- success, nonzero -- failure
 */
int szedata_subscribe3(struct szedata *sze, __u32 *rx, __u32 *tx)
{
	struct sze2_subscribe_area sub;
	unsigned int a, b;
	__u32 oldrx, oldtx;

	sub.areas[SZE2_MMIO_RX] = *rx;
	sub.areas[SZE2_MMIO_TX] = *tx;

	assert(sze != NULL);
	assert(*rx != 0 || *tx != 0);

	oldrx = sze->info->areas[SZE2_MMIO_RX];
	oldtx = sze->info->areas[SZE2_MMIO_TX];

	if (ioctl(sze->fd, SZE2_IOC_SUBSCRIBE_AREA, &sub)) {
		/* warn("ioctl SZE2_IOC_SUBSCRIBE_AREA"); */
		return errno;
	}

	*rx = oldrx ^ sze->info->areas[SZE2_MMIO_RX];
	*tx = oldtx ^ sze->info->areas[SZE2_MMIO_TX];

	if (!*rx && !*tx && verbose > CL_VERBOSE_OFF) {
		/* warnx("nothing has been subscribed"); */
		return -EINVAL;
	}

	/*
	 * send demand-paging mad for all spaces :)
	 * As this is per-page, we might jump by PAGE_SIZE steps.
	 */
	/*
	 * TODO OPT: walk only area_size'd space of areas with bits set in
	 * *rx and *tx, i.e. the newly subscribed space: s/all/subscribed/ above
	 */
	for (a = 0; a < SZE2_MMIO_MAX; a++) {
		volatile char *ptr = sze->space[a];
		for (b = 0; b < sze->info->sizes[a]; b += PAGE_SIZE)
			(void)ptr[b];
	}

	return 0;
}

int szedata_subscribe(struct szedata *sze, __u32 *rx, __u32 *tx,
		__u32 __unused__ res1, __u32 __unused__ res2)
{
	return szedata_subscribe3(sze, rx, tx);
}

/**
 * start subscribed interfaces
 *
 * Might be called multiple times, always after *successful* subscribe of some
 * areas. Otherwise it will fail.
 *
 * @param sze pointer returned by sze open function
 * @return zero on success, otherwise errno
 */
int szedata_start(struct szedata *sze)
{
	if (ioctl(sze->fd, SZE2_IOC_START)) {
		if (verbose > CL_VERBOSE_OFF) {
			warn("ioctl SZE2_IOC_START");
		}
		return errno;
	}

	return 0;
}

/**
 * return number of available interfaces
 *
 * @param sze structure returned by szedata_open
 * @param flow direction (SZE2_DIR_RX/SZE2_DIR_TX/SZE2_DIR_ALL)
 * @return number of interfaces
 */
int szedata_ifaces_available(struct szedata *sze, enum sze2_dir direction)
{
	if (direction != SZE2_DIR_ALL)
		return sze->info->areas_available[direction];

	return sze->info->areas_available[SZE2_DIR_RX] +
		sze->info->areas_available[SZE2_DIR_TX];
}

/**
 * Wait for hardware to be ready
 *
 * @param sze pointer obtained from szedata open
 * @param events pointer to events to which wait to and where to return to
 * 	which of them is ready
 * @param timeout how long to wait in ms. Negative means forever.
 * @return negative on error, zero on timeout, positive when OK
 */
int szedata_poll(struct szedata *sze, short *events, int timeout)
{
	struct pollfd pfd = {
		.fd = sze->fd,
		.events = *events,
	};
	int ret;

	ret = poll(&pfd, 1, timeout);
	if (ret <= 0) {
		if (ret < 0) {
			MSG(CL_VERBOSE_LIBRARY, "poll failed");
			ret = -errno;
		}
		goto err;
	}
	if (pfd.revents & POLLERR) {
		warnx("poll error");
		ret = -1;
		goto err;
	}

	*events = pfd.revents & (SZEDATA_POLLRX | SZEDATA_POLLTX);

	return 1;
err:
	return ret;
}

static void szedata_adesc_to_lock(struct szedata *sze, unsigned int space,
		unsigned int area)
{
	struct szedata_lock *l = sze->lock[space];
	struct sze2_adesc *adesc;

	while (1) {
		adesc = &sze->info->adesc[area][space];
		l->start = sze->space[space] + adesc->offset;
		l->len = adesc->size;
		l->area = area;
		if (!(adesc->flags & SZE2_ADESC_FRAG))
			break;
		area = SZE2_ADESC_NEXT(adesc->flags);
		l->next = l + 1;
		l++;
	}
	l->next = NULL;
}

/**
 * gives back some data, which are ready
 *
 * If there is no data, NULL is returned. Also if there is internal wrap of
 * ringbuffer (userspace should haven't known about the implementation), it is
 * possible, then 2 structures are returned instead of only one. In that case
 * user should read lock->size from lock->start as usually and then continue
 * with lock->next unless next is NULL. It means ever check lock->next.
 *
 * @param sze pointer to structure from szedata open function
 * @param areas bitmap of areas where to data request from
 * @return NULL on error or no data ready, otherwise pointer to lock structure
 */
const struct szedata_lock *szedata_rx_lock_data(struct szedata *sze,
		__u32 areas)
{
	struct sze2_adesc *adesc;
	__u32 a = areas;

	if (ioctl(sze->fd, SZE2_IOC_RXLOCKDATA, &a)) {
		warn("ioctl SZE2_IOC_RXLOCKDATA");
		return NULL;
	}

	adesc = &sze->info->adesc[a][SZE2_MMIO_RX];
	if (!adesc->size)
		return NULL;

	szedata_adesc_to_lock(sze, SZE2_MMIO_RX, a);

	return sze->lock[SZE2_MMIO_RX];
}

/**
 * unlock data which was obtained by rx lock function before
 *
 * @param sze pointer to szedata open retval
 * @param lock the same as returned by rx lock
 * @return 0 on success, otherwise errno
 */
int szedata_rx_unlock_data(struct szedata *sze,
		const struct szedata_lock __unused__ *lock)
{

	if (ioctl(sze->fd, SZE2_IOC_RXUNLOCKDATA)) {
		warn("ioctl SZE2_IOC_RXUNLOCKDATA");
		return errno;
	}

	/* not that much to do, we might do some @param lock processing here
	 * in the future */

	return 0;
}

/**
 * lock some space for writing
 *
 * Driver or library might make the size smaller than requested.
 * Count with this! Also the space might be divided into two logical spaces,
 * check comment in rx lock and fill unless lock->next is NULL.
 *
 * @param sze return value of szedata's open function
 * @param size how much space is demanded
 * @param area in which area are we interested (not bitmap, direct number)
 * @return NULL on no space was locked, otherwise lock structure
 */
const struct szedata_lock *szedata_tx_lock_data(struct szedata *sze, __u32 size,
		__u8 area)
{
	struct sze2_tx_lock tx = { .size = size, .area = area };

	if (ioctl(sze->fd, SZE2_IOC_TXLOCKDATA, &tx)) {
		if (errno != EBUSY)
			warn("ioctl SZE2_IOC_TXLOCKDATA");
		return NULL;
	}

	if (!sze->info->adesc[area][SZE2_MMIO_TX].size)
		return NULL;

	szedata_adesc_to_lock(sze, SZE2_MMIO_TX, area);

	return sze->lock[SZE2_MMIO_TX];
}

/**
 * tell the hardware to process written data
 *
 * Size passed here might be smaller than the requested (or the returned one
 * from tx lock), it means, that the user has written data of only that size
 * in real. This is correct approach and 0 is even correct, it means returned
 * buffer is too small for me.
 *
 * @param sze this is what szedata open returns
 * @param lock pointer obtained from tx lock
 * @param size really written count
 * @return 0 on success, errno on failure
 */
int szedata_tx_unlock_data(struct szedata *sze, const struct szedata_lock *lock,
		__u32 size)
{
	struct sze2_tx_unlock tx = { .size = size, .area = lock->area };

	if (ioctl(sze->fd, SZE2_IOC_TXUNLOCKDATA, &tx)) {
		warn("ioctl SZE2_IOC_TXUNLOCKDATA");
		return errno;
	}

	/* ditto (as in rx unlock) */

	return 0;
}

int szedata_get_area_size(struct szedata *sze, __u8 space, __u8 area,
		__u32 *size)
{
	if (space == SZE2_MMIO_RX)
		*size = sze->rx_asize[area];
	else
		*size = sze->tx_asize[area];
	return 0;
}

/**
 * cleanup everything
 *
 * Stop hardware if no other is using it. Cleanup userspace (unmap all spaces
 * and free memory).
 *
 * @param sze pointer which returned szedata open
 */
void szedata_close(struct szedata *sze)
{
	MSG(CL_VERBOSE_LIBRARY, "%s started", __func__);
	/* unlock RX locked */
	if(sze->ct_rx_lck_orig != NULL) {
		MSG(CL_VERBOSE_LIBRARY, "unlocking sze->ct_rx_lck_orig");
		szedata_rx_unlock_data(sze, sze->ct_rx_lck_orig);
	}

	/* flush burst buffers */
	szedata_burst_write_flush_all(sze);

	if (ioctl(sze->fd, SZE2_IOC_STOP))
		warn("ioctl SZE2_IOC_STOP");

	szedata_free_buffers(sze);
	szedata_free_mappings(sze);

	close(sze->fd);

	free(sze);
}

/**
 * return currently opened filedescriptor (some apps may use their own poll)
 *
 * @param sze pointer returned by szedata_open()
 * @return file descriptor on success, -1 on failure (if sze == NULL)
 *
 * Don't use this unless you really know what are you doing.
 * Some crud like pcap needs this.
 */
int szedata_fd(struct szedata *sze)
{
	return sze ? sze->fd : -1;
}


/*!
 * \brief Get length of hw_data and data from sze packet header, get pointers to
 * hw_data and data within contents
 *
 * \param contents Sze packet - acquired by szedata_read_next
 * \param *data Return parameter - will point to data
 * \param *hw_data Return parameter - will pint to hw_data
 * \param data_len Return parameter - length of data
 * \param hw_data_len Return parameter - length of hw_data
 *
 * \return
 * 	segsize - whole packet length without zeros
 */
unsigned int szedata_decode_packet(unsigned char *contents,
		unsigned char **data, unsigned char **hw_data,
		unsigned int *data_len, unsigned int *hw_data_len)
{
	struct szedata2_packet *sze_pkt_ptr = (void *)contents;	/* pointer to sze packet structure */
	unsigned int data_offset;
	unsigned int seg_size;

	/* get values from sze packet header */
	seg_size = le16_to_cpu(sze_pkt_ptr->seg_size);
	*hw_data_len = le16_to_cpu(sze_pkt_ptr->hw_size);
	data_offset = CL_ALIGN(SZE_PACKET_HEADER_SIZE + *hw_data_len, 8);
	*data_len = seg_size - data_offset;

	MSG(CL_VERBOSE_LIBRARY, "%s : sw data len      : %u", __func__,
			*data_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : hw data len      : %u", __func__,
			*hw_data_len);
	MSG(CL_VERBOSE_LIBRARY, "%s : segsize	  : 0x%04x", __func__,
			seg_size);

	*data = contents + data_offset;
	*hw_data = contents + SZE_PACKET_HEADER_SIZE;

	return seg_size;
}

/*!
 * \brief Print sze packet from buffer
 *
 * \param content Buffer with packet
 * \param print_options Print options bitmap - SZE2_PRINT_OPTION_ALL, SZE2_PRINT_OPTION_SW, SZE2_PRINT_OPTION_HW
 *
 * Offset is printed in two values - first offset in szedata packet, second
 * offset in current part - header, hw_data, sw_data.
 * Combine print options SZEDATA_PRINT by logical or |.
 */
void szedata_print_packet(unsigned char *content, unsigned short print_options) {
	unsigned int data_len, hw_data_len;
	unsigned char *data, *hw_data;
	unsigned int i, i_end;
	int print_hw = 0, print_sw = 0, print_all = 0, print_crc = 0;

	szedata_decode_packet(content, &data, &hw_data, &data_len,
			&hw_data_len);

	if (print_options & SZE2_PRINT_OPTION_ALL) {
		print_all = 1;
		print_sw = 1;
		print_hw = 1;
	} else if (print_options & SZE2_PRINT_OPTION_SW) {
		print_sw = 1;
	} else if (print_options & SZE2_PRINT_OPTION_HW) {
		print_hw = 1;
	}
	if (print_options & SZE2_PRINT_OPTION_CRC)
		print_crc = 1;

	/* print segsize and hwsize */
	if (print_all) {
		for (i = 0; i < SZE_PACKET_HEADER_SIZE; i++) {
			if (!(i % CL_DUMP_CHARS_PER_LINE))
				printf("\nhdr : %04x | %04x :  ", 0, i);
			else if (!(i % CL_DUMP_CHARS_PER_WORD))
				printf("   ");
			printf("%02x ", content[i]);
		}
	}
	if (print_hw) {
		for (i = 0; i < hw_data_len; i++) {
			if (!(i % CL_DUMP_CHARS_PER_LINE))
				printf("\nhw  : %04x | %04x :  ",
						SZE_PACKET_HEADER_SIZE, i);
			else if (!(i % CL_DUMP_CHARS_PER_WORD))
				printf("   ");
			printf("%02x ", hw_data[i]);
		}
	}
	if (print_sw) {
		if (print_crc)
			i_end = data_len - CL_ETHERNET_CRC32_SIZE;
		else
			i_end = data_len;

		for (i = 0; i < i_end; i++) {
			if (!(i % CL_DUMP_CHARS_PER_LINE))
				printf("\nsw  : %04x | %04x :  ", i +
					CL_ALIGN(hw_data_len +
						SZE_PACKET_HEADER_SIZE, 8), i);
			else if (!(i % CL_DUMP_CHARS_PER_WORD))
				printf("   ");
			printf("%02x ", data[i]);
		}
		printf("\n");
	}
	if (print_crc) {
		printf("crc : %04x | %04x :  %02x %02x %02x %02x\n",
				CL_ALIGN(SZE_PACKET_HEADER_SIZE + hw_data_len, 8) +
				data_len - CL_ETHERNET_CRC32_SIZE,
				0,
				data[data_len - CL_ETHERNET_CRC32_SIZE],
				data[data_len - CL_ETHERNET_CRC32_SIZE + 1],
				data[data_len - CL_ETHERNET_CRC32_SIZE + 2],
				data[data_len - CL_ETHERNET_CRC32_SIZE + 3]);
	}
	fflush(stdout);
}

/**
 * \brief Dump mmapped spaces into file - for debugging purposes
 * \param sze Handle
 * \param out Open file to write
 * \param spaces Spaces to dump
 */
void szedata_dump_spaces(struct szedata *sze, FILE *out, unsigned int spaces)
{
	unsigned int i, size = 0, offset = 0;

	/* works only if debug is set to 2 */
	if (debug != 2)
		return;

	fflush(out);

	/* get whole allocated memory size */
	for (i = 0; i < SZE2_MMIO_MAX; i++)
		size += sze->info->sizes[i];

	for (i = 0; i < size; i++) {
		if (!(i % (size/4))) {
			if(!((1 << (i / (size/4))) & spaces)) {
				i += (size/4 - 1);
				continue;
			}

			offset = 0;
			/* TODO check if spaces in this order */
			printf("\n\n%s %d\n", i < size/2 ? "RX" : "TX",
					!!((i / (size / 4)) % 2));
		}

		if (!(offset % CL_DUMP_CHARS_PER_LINE))
			fprintf(out, "\n%04x :  ", offset);
		else if (!(offset % CL_DUMP_CHARS_PER_WORD))
			fprintf(out, "   ");
		fprintf(out, "%02x ", *((unsigned char *)(sze->space[i/(int)(sze->info->sizes[0])]) + offset));
		offset++;
	}
	fprintf(out, "\n\n");
#ifdef RING_BUFF_DEBUG
	// TODO 2 * PAGE_SIZE probably legacy when testing on 2 page buffer size
	// TODO space[x] probably needs to specify
	// TODO move somewhere else ?
	fprintf(out, "Error occured probably at offset %04lx\n",
		(unsigned long)(((void *)sze->ct_rx_cur_ptr - sze->space[0]) %
				(2 * PAGE_SIZE) - SZE_PACKET_HEADER_SIZE));
#endif
}

/*!
 * \brief Debug function for working with szedata structure offline - without
 * device
 *
 * \return
 * 	szedata structure (buffers allocated)
 *
 * 	TODO hide from user
 */
struct szedata *szedata_open_dummy(void)
{
	struct szedata *sze;

	sze = malloc(sizeof(*sze));
	if (sze == NULL)
		return NULL;
	memset(sze, 0, sizeof(*sze));

	sze->ct_rx_buffer = malloc(SZE2_MAX_FRAME_SIZE);
	sze->ct_tx_buffer = malloc(SZE2_MAX_FRAME_SIZE);
	if (!sze->ct_rx_buffer || !sze->ct_tx_buffer)
		goto err;

	return sze;
err:
	free(sze->ct_rx_buffer);
	free(sze->ct_tx_buffer);
	free(sze);
	return NULL;
}

/*!
 * \brief Debug function, offline working without szedata device, free buffers
 *
 * \param sze Struct to free
 */
void szedata_close_dummy(struct szedata *sze)
{
	free(sze->ct_rx_buffer);
	free(sze->ct_tx_buffer);
	free(sze);
}

/*!
 * \brief Register own filter function.
 *
 * This function will be called in every szedata_read_next - if f function
 * returns 0 - packet will be passed; if f function return other, packet will be
 * skipped (returned NULL).
 *
 * \param sze
 * \param f
 *
 * \return
 * 	- 0 - if registered correctly
 * 	- -1 - otherwise
 *
 *
 *  NOTE: hwdata_len and SZE_PACKET_HEADER_SIZE are allways alligned to 8 (see
 *  szedata packet data format). So if you expect 8B long hwdata, 4 + 8 = 12
 *  (not aligned) + 4 = 16 (aligned), hwdata_len will be set to 12.
 */
int szedata_set_filter(struct szedata *sze,
		int (*f)(u_int16_t hwdata_len, u_char *hwdata))
{
	if (f != NULL) {
		sze->ct_rx_filter = f;
		return 0;
	}
	return -1;
}

