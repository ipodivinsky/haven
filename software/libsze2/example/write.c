/*!
 * \file write.c
 * \brief Sends 10 packets through sze2 interface, each packet immediately or in
 * more packets in burst mode
 * \author Andrej Hank <xhanka00@liberouter.org>
 * \date 2009
 * $Id: write.c 14723 2010-07-28 22:45:24Z slaby $ 
 */
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include <libsze2.h>

int main(int argc, char **argv) {

	struct szedata *sze = NULL;
	char *sze_dev = "/dev/szedataII0";
	unsigned int rx = 0x00, tx = 0x01;
	bool BURST_MODE = false; /* you can switch to burst mode */

	int ret, poll_ret;

	/* initialize szedata2 */
	/* get sze device handle */
	sze = szedata_open(sze_dev);
	if (sze == NULL)
		err("szedata_open failed");

	/* set 5s timeout for szedata_try_write_next */
	SZE2_RX_POLL_TIMEOUT = 5000000;

	printf("subscribing: RX interface mask-0x%02hx; TX interface mask-0x%02hx\n", rx, tx);
	printf("poll timeouts: RX %ums; TX %ums\n", SZE2_RX_POLL_TIMEOUT, SZE2_TX_POLL_TIMEOUT);

	/* subscribe wanted interfaces and set poll byte conuts */
	ret = szedata_subscribe3(sze, &rx, &tx);
	if (ret)
		abort();
	printf("subscribed: RX 0x%02hx; TX 0x%02hx\n\n", rx, tx);

	/* start */
	ret = szedata_start(sze);
	if (ret)
		abort();
	/* szedata2 initialized */
	
	unsigned int packet_cnt = 0;
	int i;

	/* send on interface 0 - sze0:0 in PCAP naming convention */
	unsigned short interface = 0; 

	/* poll flags */
	short events;

	/* test ICMP echo request packet with content GeorgeGeorge... */
	unsigned char test_packet[] = { 0x00,0x18,0xF3,0x80,0xFF,0x3B,0x00,0x1C,0x2E,0x5B,0xC4,0x00,0x08,0x00,0x45,0x00,0x00,0x54,0x00,0x00,0x40,0x00,0x36,0x01,0x2C,0xB3,0x93,0xFB,0x15,0xC9,0x93,0xE5,0xDA,0x4C,0x08,0x00,0xC5,0xC0,0xAF,0x2C,0x00,0x00,0x08,0xA5,0xF0,0x47,0x90,0x3C,0x08,0x00,0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65 };

	/* send */
	while(packet_cnt < 10) {
		if(BURST_MODE) /* send packets in burst - burst mode has better performance */
			ret = szedata_burst_write_next(sze, NULL, 0, test_packet, sizeof(test_packet), interface);
		else /* immediately send one packet */
			ret = szedata_prepare_and_try_write_next(sze, NULL, 0, test_packet, sizeof(test_packet), interface);

		if(ret == 0) { /* successfully sent */
			packet_cnt++;
		} else if(ret == 1) { /* try again later - poll for subscribed bytes count */
			events = SZEDATA_POLLTX;
			poll_ret = szedata_poll(sze, &events, SZE2_TX_POLL_TIMEOUT);
			if(poll_ret < 0) {
				fprintf(stderr, "Poll error\n");
				break;
			}
		} else { /* error */
			err("szedata_prepare_and_try_write_next error");
			break;
		}
	}
	if(BURST_MODE) /* flush burst buffer */
		szedata_burst_write_flush(sze, interface);

	/* close szedata */
	szedata_close(sze);
	return 0;
}	
