/*
 * Copyright (C) 2007 CESNET
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
 * License (GPL), in which case the provisions of the GPL apply INSTEAD
 * OF those given above.
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
 * $Id: exampletool.c 14125 2010-06-22 17:02:31Z krejci $
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <combosix.h>


/* Base address of an EXPERIMENT module */
#define BASE_ADDR_LB_ENDPOINT 0x11000
/* Offset addresses within the EXPERIMENT module */
#define ADDR_REG_BASE 0x800	        /* 0x11800 */
#define ADDR_REG_EXPERIMENT_0 0x800	/* 0x11800 */
#define ADDR_REG_EXPERIMENT_1 0x804	/* 0x11804 */
#define ADDR_REG_EXPERIMENT_2 0x808	/* 0x11808 */

int
main(int argc, char *argv[])
{

	cs_device_t *dev;
	char *file = CS_PATH_DEV(0);	/* default path to device */
	cs_space_t *hwexperiment;	/* address space of EXPERIMENT module */

	u_int32_t reg_value[3];
	u_int32_t ramb_value;
	u_int32_t i;
	u_int32_t value2write = 0xAAAACCCC;

	/* Attach device */
	if (cs_attach_noex(&dev, file) != 0) {
		printf("cs_attach_noex failed\n");
		return -1;
	}

	/* Map address space of EXPERIMENT module */
	if (cs_space_map(dev, &hwexperiment, CS_SPACE_FPGA, CS_MAP_ALL, BASE_ADDR_LB_ENDPOINT, 0) != 0) {
		cs_detach(&dev);
		printf("cs_space_map failed to map component at address 0x%lX.", BASE_ADDR_LB_ENDPOINT);
		return -1;
	}

	/* Access EXPERIMENT module */
	/* Read and print values from reg_experiment0, reg_experiment1, reg_experiment2 */
	reg_value[0] = cs_space_read_4(dev, hwexperiment, ADDR_REG_EXPERIMENT_0);
	reg_value[1] = cs_space_read_4(dev, hwexperiment, ADDR_REG_EXPERIMENT_1);
	reg_value[2] = cs_space_read_4(dev, hwexperiment, ADDR_REG_EXPERIMENT_2);
	printf("Read from address: %X, got: %X\n", ADDR_REG_EXPERIMENT_0, reg_value[0]);
	printf("Read from address: %X, got: %X\n", ADDR_REG_EXPERIMENT_1, reg_value[1]);
	printf("Read from address: %X, got: %X\n", ADDR_REG_EXPERIMENT_2, reg_value[2]);

	/* Fill out first four words of RAMB18SDP */
	value2write = 0xAAAACCCC;
	for (i = 0; i < 3; i++) {
		printf("Write to address: %X, value: %X\n", ADDR_REG_BASE + (i * 4), value2write);
		cs_space_write_4(dev, hwexperiment, ADDR_REG_BASE + (i * 4), value2write);
	}

	/* Read first five values of RAMB18SDP */
	for (i = 0; i < 3; i++) {
		ramb_value = cs_space_read_4(dev, hwexperiment, ADDR_REG_BASE + (i * 4));
		printf("Read from address %X, got: %X\n", ADDR_REG_BASE + (i * 4), ramb_value);
	}

	/* Release allocated structures */
	cs_design_free(dev);
	cs_detach(&dev);

	return 0;

}
