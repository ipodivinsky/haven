/*!
 * \file read_parse.c
 * \brief Reads first 10 packets from sze2 interface, parses source and destination IP and prints them
 * \author Matus Holec <xholec00@stud.fit.vutbr.cz>
 * \date 2009
 * $Id: read_parse.c 14723 2010-07-28 22:45:24Z slaby $ 
 */
#include <stdlib.h>
#include <stdio.h>
#include <libsze2.h>


/*! offset for ether type in ethernet header according to standard */
#define ETHER_TYPE_OFFSET 12

/*! first byte indicating IPv4 ether type*/
#define FIRST_BYTE_IPv4_ETHER_TYPE 0x08
/*! second byte indicating IPv4 ether type*/
#define SECOND_BYTE_IPv4_ETHER_TYPE 0x00

/*! IPv4 address byte count */
#define IPv4_ADDRESS_BYTE_COUNT 4

/*! offset for source IP in packet (+ length of ethernet header) */
#define OFFSET_SOURCE_IPv4 26

/*! offset for destination IP in packet */
#define OFFSET_DESTINATION_IPv4 30

/*!
 * \brief Checks ethernet type in ethernet frame
 * \param data Packet data containing both athernet and eventual ip header
 * \return 0 if ether type is IPv4 -1 otherwise
 */
int
check_ether_type(unsigned char *data)
{
	/* ether type consists of two bytes, its offset in ethernet frame according to standard is 12 */
	if((*(data + ETHER_TYPE_OFFSET) == FIRST_BYTE_IPv4_ETHER_TYPE) &&
	  (*(data + ETHER_TYPE_OFFSET + 1) == SECOND_BYTE_IPv4_ETHER_TYPE))
		return 0;
	else
		return -1;
}


/*!
 * \brief Checks ethernet type in ethernet frame
 * \param data Packet data containing IPv4 header
 * \param ip_address Read ip address from IPv4 header
 * \param offset Offset for ip address according to standard in IPv4 header
 * \return 0
 */
get_ip_address(unsigned char *data, u_int8_t *ip_address,int offset)
{
	int i,j;
	for(i = offset, j = 0; i < offset + IPv4_ADDRESS_BYTE_COUNT ; i++, j++){
		ip_address[j] = data[i];
	}
	return 0;
}


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
	u_int8_t ip_address[IPv4_ADDRESS_BYTE_COUNT];
	unsigned int packet_cnt = 0;
	int i;

	/* read */
	while(packet_cnt < 10) {
		if((packet = szedata_read_next(sze, &packet_len)) != NULL) {
			packet_cnt++;
			segsize = szedata_decode_packet(packet, &data, &hw_data, &data_len, &hw_data_len);
			if(check_ether_type(data) != 0){
				/* ethernet type is not IPv4 */ 
				printf("packet %06u: not an IPv4 packet.\n", packet_cnt);
				continue;
			}
			else{
				/* IPv4 packet */
				printf("packet %06u: IPv4 packet\n", packet_cnt);
				/* gets ip address by given offset */
				get_ip_address(data,ip_address,OFFSET_SOURCE_IPv4);
				printf("packet %06u: Source IP address -> ",packet_cnt);
				for(i = 0; i < IPv4_ADDRESS_BYTE_COUNT - 1; i++){
					printf("%d.",ip_address[i]);
				}
				printf("%d\n",ip_address[i]);
				
				get_ip_address(data,ip_address,OFFSET_DESTINATION_IPv4);
				printf("packet %06u: Destination IP address -> ",packet_cnt);
				for(i = 0; i < IPv4_ADDRESS_BYTE_COUNT - 1; i++){
					printf("%d.",ip_address[i]);
				}
				printf("%d\n",ip_address[i]);
			}
			printf("\n");
		} else {
			printf("nothing to read\n");
		}
	}

	/* close szedata */
	szedata_close(sze);
	return 0;
}	
