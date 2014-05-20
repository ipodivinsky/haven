/*!
 * \file read.c
 * \brief Reads first 10 packets from pcap interface and prints them
 * \author Andrej Hank <xhanka00@liberouter.org>
 * \date 2009
 * $Id: read.c 13801 2010-05-21 07:34:39Z krejci $ 
 */
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#include <pcap.h>

int main(int argc, char **argv)
{
	pcap_t *pcap_handle = NULL;	/* pcap interface handle */
	struct pcap_pkthdr header;	/* pcap packet header */
	char *pcap_interface = "sze0";	/* pcap interface string - combo card 0 */
	char errbuf[PCAP_ERRBUF_SIZE];	/* pcap error string */
	const u_char *data;		/* data pointer */
	int i, j;

	/* initialize PCAP */
	pcap_handle = pcap_open_live(pcap_interface, 1000, 1, 0, errbuf);
	if (pcap_handle == NULL) {
		err(1, "Can't initialize pcap - %s", errbuf);
	}

	/* read 10 packets */
	for (i = 0; i < 10; i++) {
		
		/* read one packet
		 * - this function is blocking until packet arrives
		 *   (could be infinite timeout)
		 */
		data = pcap_next(pcap_handle, &header);
		
		/* print the packet information */
		printf("Timestamp: %s%.6ld us, packet size: %.5d B, captured: %.5d B\n",
			ctime(&(header.ts.tv_sec)), header.ts.tv_usec, header.len, header.caplen);

		/* print the packet data */
		for (j = 0; j < header.caplen; j++) {
			printf("0x%02x ", *(data + j));
			if (j % 10 == 9)
				printf("\n");
		}
		printf("\n");
		
	}

	/* deinitialize PCAP */
	pcap_close(pcap_handle);
	return 0;
}
