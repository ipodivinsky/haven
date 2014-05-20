/*!
 * \file private.h
 * \brief Private macros and structures - not available for user
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

#ifndef _LIBSZE2_PRIVATE_H_
#define _LIBSZE2_PRIVATE_H_

#include <szedata2.h>
#include <endian.h>
#include <stdint.h>

/*! szedata2_packet header length == 4 bytes == 2B segment size + 2B hw size */
#define SZE_PACKET_HEADER_SIZE 4

/** @defgroup common_spaces Driver's buffer spaces
 *
 * For selecting memory space and its dumping
 *
 * @{
 */

#define SZE2_SPACES_ALL 15
#define SZE2_SPACE_RX_0	1
#define SZE2_SPACE_RX_1	2
#define SZE2_SPACE_TX_0	4
#define SZE2_SPACE_TX_1	8

/** @} */

struct szedata_lock;
struct sze2_instance_info;

/*! main hanle structure */
struct szedata {
	int fd;
	struct sze2_instance_info *info;
	uint32_t *write_size;
	void *space[SZE2_MMIO_MAX];
	struct szedata_lock lock[2][2];

	__u32 *rx_asize, *tx_asize;

	/* szedata_read_next variables - to keep context (ct) */
	/* rx */
	const struct szedata_lock 	*ct_rx_lck_orig;	/**< initial sze lock ptr */
	const struct szedata_lock 	*ct_rx_lck;		/**< current sze lock ptr (initial or next) */
	unsigned int 			ct_rx_rem_bytes;	/**< remaining bytes (not read) within current lock */
	unsigned char 			*ct_rx_cur_ptr;		/**< current pointer to locked memory */
	unsigned char 			*ct_rx_buffer;		/**< allocated buffer to store RX packet if it was split into 2 buffers */
	int (* ct_rx_filter)(u_int16_t hwdata_len, u_char *hwdata); /**< registered function to provide filtering based on hwdata */
	/* tx */
	unsigned char 			*ct_tx_buffer;		/**< buffer for tx - packet is prepared here (in future for burst write) */
	const struct szedata_lock 	**ct_tx_lck_orig;	/**< initial sze TX lock ptrs - number according to TX interfaces */
	const struct szedata_lock 	**ct_tx_lck;		/**< current sze TX lock ptrs - number according to TX interfaces */
	unsigned int 			*ct_tx_written_bytes;	/**< already written bytes in both locks */
	unsigned int 			*ct_tx_rem_bytes;	/**< remaining bytes (not written) within current lock */
	unsigned char 			**ct_tx_cur_ptr;	/**< current pointers to locked memory */
};

#if defined(_LITTLE_ENDIAN) || (defined(__BYTE_ORDER) && defined(__LITTLE_ENDIAN) && (__BYTE_ORDER == __LITTLE_ENDIAN))
  #define le16_to_cpu(X) ((uint16_t)X)
  #define cpu_to_le16(X) ((uint16_t)X)
#elif defined(_BIG_ENDIAN) || (defined(__BYTE_ORDER) && defined(__BIG_ENDIAN) && (__BYTE_ORDER == __BIG_ENDIAN))
  #define le16_to_cpu(X) ((uint16_t)((((uint16_t)(X) & 0xff00) >> 8) | \
		                      (((uint16_t)(X) & 0x00ff) << 8)))
  #define cpu_to_le16(X) le16_to_cpu(X)
#else
  #error "Endian not specified !"
#endif

#include <stdio.h>
void szedata_dump_spaces(struct szedata *sze, FILE *out, unsigned int spaces);

int szedata_burst_write_flush_all(struct szedata *sze);

#endif
