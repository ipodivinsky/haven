/* *****************************************************************************
 * Project Name: Hardware - Software Framework for Functional Verification 
 * File Name:    C Wrapper
 * Description: 
 * Author:       Marcela Simkova <xsimko03@stud.fit.vutbr.cz> 
 * Date:         3.5.2011 
 * ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <err.h>
#include <libsze2.h>
#include "libsze_wrapper.h"  

int main(int argc, char **argv) {
   int packet_size;
   
   if (argc == 2)
      packet_size = (int) strtol(argv[1], (char **)NULL, 10);
   else
   {
      printf("ERROR: Missing packet size\n");
      return EXIT_FAILURE;
   }
   //printf("packet_size: %d\n",packet_size);
   
   unsigned char packet[packet_size];
   
   int i = 0; 
   //for(i = packet_size-1; i >= 0; i--)
   for(i = 0; i < packet_size; i++)
   {
      scanf("%02x",&packet[i]);
   }
   
   //reverse input packet per bytes
   int byte_size = 8;
   unsigned char temp;
   int end;
   int j;
   for(j = 0; j < packet_size; j += byte_size)
   {
      end = byte_size-1 + j;
      for (i = 0 + j; i < byte_size/2 + j; i++) 
      {
         temp = packet[i];
         packet[i] = packet[end];
         packet[end] = temp;
    
         end--;
     }
   }
 
   //print packet
   for(j = 0; j < packet_size; j += byte_size)
   {
      for (i = byte_size + j -1; i >= 0 + j; i--) 
         printf("%02x ", *(packet + i));
      printf("  ");
   }
   printf("\n");
   
   if (c_openDMAChannel())
      printf("neotevre DMA channel");
      
   if (!c_sendData(packet, sizeof(packet)))
      printf("odeslano\n");
   else
      printf("nelze odeslat");
      
   if (c_closeDMAChannel())
      printf("nezavre DMA channel");
  
  /*
   unsigned char start_packet[] = { 0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00};
   
   unsigned char data_packet[] =  { 0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00, 
                                    0x88,0x00,0x00,0x02,0x00,0x00,0x00,0x88};
                                    
   unsigned char data_packet2[] = { 0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00, 
                                    0x99,0x00,0x00,0x03,0x00,0xAA,0x00,0x11};
   
   
   unsigned char stop_packet[] =  { 0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00};
   

   if (!c_sendData(start_packet, sizeof(start_packet)))
      printf("odeslano start\n");
     
   if (!c_sendData(data_packet, sizeof(data_packet)))
      printf("odeslano data\n");

   if (!c_sendData(data_packet2, sizeof(data_packet2)))
      printf("odeslano data\n");
      
   if (!c_sendData(data_packet2, sizeof(data_packet2)))
      printf("odeslano data\n");
      
   if (!c_sendData(data_packet2, sizeof(data_packet2)))
      printf("odeslano data\n");
      
   if (!c_sendData(stop_packet, sizeof(stop_packet)))
      printf("odeslano stop\n");
    
   //if (!c_sendData(data_packet))
      //printf("odeslano data\n");
*/
	return 0;
}
