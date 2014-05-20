/*!
 * \file libsze2.h
 * \brief Szedata2 library
 * \author Jiri Slaby <jirislaby@gmail.com>
 * \author Andrej Hank <xhanka00@liberouter.org>
 * \date 2008
 */
/*
 * Copyright (C) 2008-2010 CESNET
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

#ifndef _LIBSZE2_H_
#define _LIBSZE2_H_

#include <poll.h>
#include <linux/types.h>
#include <sys/types.h>


/** @defgroup common Common macros, structures, functions
 *
 * @{
 */

/*! all interfaces which can be subscribed - not all of them may be available */
#define SZE2_ALL_INTERFACES 0xFFFFFFFF

/*! maximum expected frame size - make it bigger up to 24k - won't cause problems in future */
#define SZE2_MAX_FRAME_SIZE (24 * 1024)

/** @defgroup common_print_options Print options
 *
 * @{
 */

/*! print_options parameter of szedata_print_packet - print hw data */
#define SZE2_PRINT_OPTION_HW  1
/*! print_options parameter of szedata_print_packet - print sw data */
#define SZE2_PRINT_OPTION_SW  2
/*! print_options parameter of szedata_print_packet - print whole sze packet */
#define SZE2_PRINT_OPTION_ALL 4
/*! print_options parameter of szedata_print_packet - print CRC */
#define SZE2_PRINT_OPTION_CRC 8

/** @} */

#define SZEDATA_POLLRX	POLLIN	/**< wait for rx */
#define SZEDATA_POLLTX	POLLOUT	/**< wait for tx */

/* @{ Poll variables
 *  * These variables can be set by enviroment variables with same names
 *   */
extern int SZE2_RX_POLL_TIMEOUT; /**< RX poll timeout */
extern int SZE2_TX_POLL_TIMEOUT; /**< TX poll timeout */

/* @{ Poll variables limits - TODO */
#define SZE2_RX_POLL_TIMEOUT_MIN -1
#define SZE2_RX_POLL_TIMEOUT_MAX 120000
#define SZE2_TX_POLL_TIMEOUT_MIN -1
#define SZE2_TX_POLL_TIMEOUT_MAX 120000
/* @} */
/* @} */

/* Possible flow directions */
enum sze2_dir {
	SZE2_DIR_RX = 0,
	SZE2_DIR_TX = 1,
	SZE2_DIR_ALL
};

struct szedata;

/**
 * szedata_lock - structure returned from rx/tx lock
 */
struct szedata_lock {
	void *start;		/**< start pointer of the region */
	__u32 len;		/**< lenght of the region */
	__u8 area;		/**< which area this lock belongs to */
	const struct szedata_lock *next;	/**< next region */
};

/**
 * szedata2_packet - data format of locked area
 *
 * Data are aligned to 8-byte boundary after header and hw data.
 * Sizes in header are in little endian (this sucks, don't blame me :)).
 */
struct szedata2_packet {
	__u16	seg_size;	/**< size of whole packet (header incl.) */
	__u16	hw_size;	/**< size of hw data (optional) */
	__u8	data[0];	/**< data themselves */
} __attribute((packed));

extern u_int SZE2_BURST_WRITE_SIZE;

/** @defgroup common_high_level High level functions
 *
 * @{
 */

extern struct szedata *szedata_open(const char *node);
extern int szedata_subscribe3(struct szedata *sze, __u32 *rx, __u32 *tx);
extern int __attribute__((deprecated))
szedata_subscribe(struct szedata *sze, __u32 *rx, __u32 *tx,
		__u32 __attribute__((unused)) res1,
		__u32 __attribute__((unused)) res2);

extern int szedata_start(struct szedata *sze);
extern void szedata_close(struct szedata *sze);

extern void szedata_print_packet(unsigned char *content,
		unsigned short print_options);
extern unsigned int szedata_decode_packet(unsigned char *contents,
		unsigned char **data, unsigned char **hw_data,
		unsigned int *data_len, unsigned int *hw_data_len);

extern int szedata_ifaces_available(struct szedata *sze, enum sze2_dir);

/** @} */

/** @defgroup common_low_level Low level functions
 *
 * @{
 */
extern int szedata_poll(struct szedata *sze, short *events, int timeout);
extern const struct szedata_lock *szedata_rx_lock_data(struct szedata *sze,
		__u32 areas);
extern int szedata_rx_unlock_data(struct szedata *sze,
		const struct szedata_lock *lock);
extern const struct szedata_lock *szedata_tx_lock_data(struct szedata *sze,
		__u32 size, __u8 area);
extern int szedata_tx_unlock_data(struct szedata *sze,
		const struct szedata_lock *lock, __u32 size);
extern int szedata_get_area_size(struct szedata *sze, __u8 space, __u8 area,
		__u32 *size);

extern int szedata_fd(struct szedata *sze);
/** @} */

/** @defgroup common_filter Filterring according to hwdata
 *
 * @{
 */
extern int szedata_set_filter(struct szedata *sze,
		int (*f)(u_int16_t hwdata_len, u_char *hwdata));
/** @} */

/** @defgroup common_debug Debug functions
 *
 * @{
 */
extern struct szedata *szedata_open_dummy(void);
extern void szedata_close_dummy(struct szedata *sze);
/** @} */

/** @defgroup read Read functions
 * @{
 */

extern unsigned char *szedata_read_next(struct szedata *sze, unsigned int *len);

/** @} */

/** @defgroup write Write functions
 *
 * If user wants to send data, szedata2 packet must be created from sw and hw
 * data. Packet is created in preallocated space in sze handle (ct_tx_buffer).
 * For this purpose serve szedata_prepare_packet/_with_crc functions. Then
 * prepared packet should be written into driver's buffer by
 * szedata_try_write_next. These two steps are be faster and wrapped in one
 * function - szedata_prepare_and_try_write_next which creates szedata2 packet
 * directly into driver's buffer - zero copy.
 * @{
 */

extern int szedata_prepare_and_try_write_next(struct szedata *sze,
		unsigned char *hw_data, unsigned int hw_data_len,
		unsigned char *sw_data, unsigned int sw_data_len,
		unsigned short interface);

extern int szedata_burst_write_next(struct szedata *sze,
		unsigned char *hw_data, unsigned int hw_data_len,
		unsigned char *sw_data, unsigned int sw_data_len,
		unsigned short interface);

extern unsigned char *szedata_prepare_packet(struct szedata *sze,
		const unsigned char *hw_data, unsigned int hw_data_len,
		const unsigned char *sw_data, unsigned int sw_data_len,
		unsigned int *len);

extern int szedata_try_write_next(struct szedata *sze,
		const unsigned char *data, unsigned int data_len,
		unsigned short interface);

/** @} */

/** @} */
#endif
