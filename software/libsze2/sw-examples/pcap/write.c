/*!
 * \file write.c
 * \brief Sends 10 packets through pcap interface
 * \author Andrej Hank <xhanka00@liberouter.org>
 * \date 2009
 * $Id: write.c 13779 2010-05-19 12:47:04Z v-teq $ 
 */
#include <stdlib.h>
#include <stdio.h>

#include <pcap.h>

int main(int argc, char **argv)
{
	pcap_t *pcap_handle = NULL;	/* pcap interface handle */
	struct pcap_pkthdr header;	/* pcap packet header */
	char *pcap_interface = "sze0:0";/* pcap interface string - combo card 0, port 0 */
	char errbuf[PCAP_ERRBUF_SIZE];	/* pcap error string */
	int written;
	int packet_cnt = 0;

	/* test ICMP echo request packet with content GeorgeGeorge... */
	const unsigned char test_packet[] = {
		0x00,0x18,0xF3,0x80,0xFF,0x3B,0x00,0x1C,0x2E,0x5B,
		0xC4,0x00,0x08,0x00,0x45,0x00,0x00,0x54,0x00,0x00,
		0x40,0x00,0x36,0x01,0x2C,0xB3,0x93,0xFB,0x15,0xC9,
		0x93,0xE5,0xDA,0x4C,0x08,0x00,0xC5,0xC0,0xAF,0x2C,
		0x00,0x00,0x08,0xA5,0xF0,0x47,0x90,0x3C,0x08,0x00,
		0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,
		0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,
		0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65,
		0x6F,0x72,0x67,0x65,0x47,0x65,0x6F,0x72,0x67,0x65,
		0x47,0x65,0x6F,0x72,0x67,0x65,0x47,0x65
	};

	/* initialize PCAP */
	pcap_handle = pcap_open_live(pcap_interface, 1000, 1, 0, errbuf);
	if (pcap_handle == NULL) {
		err(1, "Can't initialize pcap - %s", errbuf);
	}

	/* send 10 packets */
	while (packet_cnt < 10) {

		/* send one packet */
		written = pcap_inject(pcap_handle, test_packet, sizeof(test_packet));

		/* check if all bytes sent successfully */
		if (written == sizeof(test_packet)) 
			packet_cnt++;

	}

	/* deinitialize PCAP */
	pcap_close(pcap_handle);
	return 0;
}
