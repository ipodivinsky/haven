/*!
 * \file read.c
 * \brief Reads first 10 packets from sze2 interface and prints them
 * \author Andrej Hank <xhanka00@liberouter.org>
 * \date 2009
 * $Id: read.c 14723 2010-07-28 22:45:24Z slaby $ 
 */
#include <stdlib.h>
#include <stdio.h>

#include <libsze2.h>

#define PART_SIZE 8
#define PART_NUM  2

int main(int argc, char **argv) {

	struct szedata *sze = NULL;
	char *sze_dev = "/dev/szedataII0";
	unsigned int rx = 0xFF, tx = 0x00;

	int ret;

	/* initialize szedata2 */
	/* get sze device handle */
	sze = szedata_open(sze_dev);
	if (sze == NULL)
		err("szedata_open failed");

	/* set 5s timeout for szedata_read_next */
	SZE2_RX_POLL_TIMEOUT = 5000;

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

	unsigned char *packet;
	unsigned int packet_len;
	unsigned char *data, *hw_data;
	unsigned int data_len, hw_data_len;
	unsigned int segsize;
	
	unsigned int packet_cnt = 0;
	int i;

	/* read */
	while(1){//packet_cnt < 10) {
		if((packet = szedata_read_next(sze, &packet_len)) != NULL) {
			packet_cnt++;
			segsize = szedata_decode_packet(packet, &data, &hw_data, &data_len, &hw_data_len);

			/*printf("packet %06u hw data %04u B: ", packet_cnt, hw_data_len);
			for(i = 0; i < hw_data_len; i++)
				printf("0x%02x ", *(hw_data + i));
			printf("\npacket %06u data %04u B: ", packet_cnt, data_len);
			for(i = 0; i < data_len; i++)
				printf("0x%02x ", *(data + i));*/
			
			//write natural received data			
			for(i = 0; i < data_len; i++)
				printf("%02x ", *(data + i));
			printf("\n");

			for(i = PART_SIZE-1; i >= 0 ; i--)
				printf("%02x ", *(data + i));
			
			printf("  ");
			
			for(i = data_len-1; i >= PART_SIZE ; i--)
				printf("%02x ", *(data + i));
			printf("\n");
			printf("\n");
		} else {
			printf("nothing to read\n");
		}
	}

	/* close szedata */
	szedata_close(sze);
	return 0;
}	
