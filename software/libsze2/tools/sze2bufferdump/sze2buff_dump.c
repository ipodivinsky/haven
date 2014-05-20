/**
 * sze2buff_dump.c: tool for dumping sze2 buffers
 * Copyright (C) 2009 CESNET
 * Author(s): Jakub Bezak <xbezak00@liberouter.org>
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
 *
 */


#include <stdio.h>
#include <unistd.h>

#include <commlbr.h>

#include "../../libsze2.h"
#include "../../private.h"

#define ARGUMENTS "hrtd:i:Dv:V"

#define VERSION "0.1"

extern int verbose;

enum err_codes {
	EARG = 0,
	ECHANNELNO = 1,
	EARGRT,
	EARGNORT,
	EARGNOI,
	ESZEOPEN
};

static int sze_spaces [] = {
	SZE2_SPACE_RX_0,
	SZE2_SPACE_RX_1,
	SZE2_SPACE_TX_0,
	SZE2_SPACE_TX_1
};


void print_version();
void print_help();
void print_error(int );


int main(int argc, char **argv) {

	/* needed for szedata_dump_spaces() */
	debug = 2;

	/* SZE2 structures */
	struct szedata *sze = NULL;
	char *sze_dev = "/dev/szedataII0";

	int opt, itemp;
	int rx_set = 0, tx_set = 0, i_set = 0;
	int channel_no = 0;
	int space_index = 0;

	while ((opt = getopt(argc, argv, ARGUMENTS)) >= 0) {
		switch (opt) {
			case 'r':
				VERBOSE(CL_VERBOSE_ADVANCED, "DUMPING CHANNEL RX 0\n");
				rx_set = 1;
				break;
			case 't':
				VERBOSE(CL_VERBOSE_ADVANCED, "DUMPING CHANNEL TX 0\n");
				tx_set = 1;
				space_index = 2;
				break;
			case 'd':
				sze_dev = optarg;
				break;
			case 'i':
				itemp = atoi(optarg);
				if (itemp < 0 || itemp > 1) {
					print_error(ECHANNELNO);
				}

				channel_no = itemp;
				i_set = 1;

				VERBOSE(CL_VERBOSE_ADVANCED, "CHANNEL NUMBER %d", channel_no);
				break;
			case 'v':
				verbose = atoi(optarg);
				break;
			case 'V':
				print_version();
				break;
			case '?':
			case 'h':
				print_help();
				break;
		}
	}

	argc -= optind;
	argv += optind;

	/* missing arguments */
	if (argc == 1) {
		print_error(EARG);
	}

	if(rx_set == 1 && tx_set == 1) {
		print_error(EARGRT);
	}

	if(rx_set == 0 && tx_set == 0) {
		print_error(EARGNORT);
	}


	if(i_set == 0) {
		print_error(EARGNOI);
	}
 
	/* initialize SZE2 */
	sze = szedata_open(sze_dev);
	if (sze == NULL)
		print_error(ESZEOPEN);

	space_index += channel_no;
	VERBOSE(CL_VERBOSE_BASIC, "DUMPING channel %d", space_index)

	szedata_dump_spaces(sze, stdout, sze_spaces[space_index]);
 
	VERBOSE(CL_VERBOSE_BASIC, "DUMPING END\n");
	szedata_close(sze);

	return 0;
}

/**
 * \brief print program version
 *
 * \return	   none
 */
void print_version(void)
{
	printf("%s version: %s\n", getprogname(), VERSION);
	exit(0);
}

/**
 * \brief print program help
 *
 * \return	   none
 */
void print_help() {
	printf("Options:\n");
	printf("-h\tprints this help\n");
	printf("-v\tset verbose level\n");
	printf("-V\tprint version\n");
	printf("-r\tdumps channel RX\n");
	printf("-t\tdumps channel TX\n");
	printf("-d path\tdevice path\n");
	printf("-i n\tchannel number\n\n");
	printf("Usage:\n");
	printf("./sze2buff_dump -r -i 0\n");
	printf("./sze2buff_dump -t -i 1\n\n");
	exit(0);
}

/**
 * \brief print error
 *
 * \return	   none
 */
void print_error(int err_code) {
	static const char * err_msgs[] = {
		"Missing arguments. Use -h for help.",
		"Wrong channel number.",
		"Cannot combine -r and -t options.",
		"Missing channel (-r or -t).",
		"Missing channel number (-i 0 or -i 1).",
		"szedata_open() failed"
	};

	VERBOSE(CL_VERBOSE_OFF, "%s", err_msgs[err_code]);
	exit(1);
}
