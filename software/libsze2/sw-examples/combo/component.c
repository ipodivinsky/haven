/*!
 * \file component.c
 * \brief Demonstrates how to perform RW operation within combo card space 
 * \author Andrej Hank <xhanka00@liberouter.org>
 * \date 2009
 *
 * For demonstartion input buffer (ibuf) component is used. This is very simple
 * example based on component functions from libcombo library. To see advanced
 * using of libcombo library functions it is recommended to see liberouter ctl
 * tools and components/ files of libcombo library.
 *
 * $Id: component.c 15791 2010-09-27 12:32:40Z krejci $ 
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <libgen.h>

#include <combosix.h>

/*! Component Base Address */
#define MY_IBUF_BASE_ADDR		0x1000
/*! Component Size */
#define MY_IBUF_SIZE			0x0100
/*! Component Enable Register */
#define MY_IBUF_EN			0x0020
/*! Total Received Frames Counter (TRFC) */
#define MY_IBUF_CNT_PACKETS		0x0000 
/*! Correct Frames Counter (CFC) */
#define MY_IBUF_CNT_RECV		0x0004
/*! Discarded Frames Counter (DFC) */
#define MY_IBUF_CNT_RECVERR		0x0008
/*! Counter of frames discarded due to buffer overflow */
#define MY_IBUF_CNT_OVERFLOW		0x000C

int main(int argc, char *argv[]) {
	char *file = CS_PATH_DEV(0);	/* default device - /dev/combosix/0 */
	cs_device_t *dev;		/* device handle */
	cs_space_t *ibuf_space;		/* component space handle */
	int ret;			/* functions' return value */

	/*! All received frames */
	uint32_t	cnt_packets;	
	/*! Correct frames */
	uint32_t	cnt_recv;	
	/*! Discarded frames */
	uint32_t	cnt_error;	
	/*! Discarded frames due to buffer overflow */
	uint32_t	cnt_overflow;	

	/* attach device */
	if ((ret = cs_attach_noex(&dev, file)) != 0) {
		fprintf(stderr, "%s: cs_attach_noex failed (%s).",
			 basename(strdup(argv[0])), strerror(ret));
		exit(1);
	}

	/* map component space */
	if ((ret = cs_space_map(dev, &ibuf_space, CS_SPACE_FPGA, MY_IBUF_SIZE, MY_IBUF_BASE_ADDR, 0)) != 0) {
		fprintf(stderr, "%s: cs_space_map failed to map component (%s).",
			 basename(strdup(argv[0])), strerror(ret));
		exit(1);
	}

	/* enable ibuf component (just to demonstate write operation) */
	cs_space_write_4(dev, ibuf_space, MY_IBUF_EN, 1);

	/* read counter registers (just to demonstrate read operation) */
	cnt_packets = cs_space_read_4(dev, ibuf_space, MY_IBUF_CNT_PACKETS);
	cnt_recv = cs_space_read_4(dev, ibuf_space, MY_IBUF_CNT_RECV);
	cnt_error = cs_space_read_4(dev, ibuf_space, MY_IBUF_CNT_RECVERR);
	cnt_overflow = cs_space_read_4(dev, ibuf_space, MY_IBUF_CNT_OVERFLOW);

	/* print these counter registers to stdout (just to demonstrate read operation) */
	printf("%08x\n", cnt_packets);
	printf("%08x\n", cnt_recv);
	printf("%08x\n", cnt_error);
	printf("%08x\n", cnt_overflow);

	/* unmap component space */
	cs_space_unmap(dev, &ibuf_space);

	/* close device */
	cs_detach(&dev);
	return 0;
}
