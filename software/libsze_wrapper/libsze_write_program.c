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

#define HEADER_SIZE 8
#define PACKET_SIZE 16
#define DATA_SIZE 8
#define INST_SIZE 4

int main(int argc, char **argv) {
   FILE *program;;
   program = fopen("input_program_hex", "r");
   
   int r = 0;
   //send program for two times - debugging purposses
   for (r = 0; r<2; r++)
   {
   
   int i = 0;
   int j;
   int byte_size = 8;
   //===============================================
   //start packet
   //===============================================
   //packet inicialization
   unsigned char start_header[HEADER_SIZE];
   for(i = 0; i < HEADER_SIZE; i++)
   {
      start_header[i] = 0;
   } 
   //header
   start_header[4] = 1;
   /*
   //print packet
   for(j = 0; j < HEADER_SIZE; j += byte_size)
   {
      for (i = byte_size + j -1; i >= 0 + j; i--) 
         printf("%02x ", *(start_header + i));
      printf("  ");
   }
   printf("\n");
   */
   //send start header
   if (c_openDMAChannel())
      printf("neotevre DMA channel");
      
   if (!c_sendData(start_header, sizeof(start_header)))
      printf("odeslano\n");
   else
      printf("nelze odeslat");
      
   if (c_closeDMAChannel())
      printf("nezavre DMA channel");
      
   //===================================================
   
   unsigned char packet[PACKET_SIZE];
   //===============================================
   //preparing one packet = reading two instructions
   //===============================================
   unsigned char read = 0;
   int scan = 0;
   scan = fscanf(program,"%02x",&read);
   while (scan > 0)
   {     
      //packet inicialization
      for(i = 0; i < PACKET_SIZE; i++)
      {
         packet[i] = 0;
      }
      
      //header
      packet[4] = 0;//2;
      
      //read first instruction
      for(i = DATA_SIZE; i < DATA_SIZE + INST_SIZE; i++)
      {
         packet[i] = read;
         scan = fscanf(program,"%02x",&read);
      }
      
      //read second instruction
      if (scan > 0)
      {
         for(i = DATA_SIZE + INST_SIZE; i < PACKET_SIZE; i++)
         {
            packet[i] = read;
            scan = fscanf(program,"%02x",&read);
         }
      }
      
      //reverse data part of packet per instructions
      unsigned char temp;
      int end;
      for(j = DATA_SIZE; j < PACKET_SIZE; j += INST_SIZE)
      {
         end = INST_SIZE-1 + j;
         for (i = 0 + j; i < INST_SIZE/2 + j; i++) 
         {
            temp = packet[i];
            packet[i] = packet[end];
            packet[end] = temp;
       
            end--;
        }
      }
      /*
      //print packet
      for(j = 0; j < PACKET_SIZE; j += byte_size)
      {
         for (i = byte_size + j -1; i >= 0 + j; i--) 
            printf("%02x ", *(packet + i));
         printf("  ");
      }
      printf("\n");
      */
      //send packet
      if (c_openDMAChannel())
         printf("neotevre DMA channel");
         
      if (!c_sendData(packet, sizeof(packet)))
         ;
         //printf("odeslano\n");
      else
         printf("nelze odeslat");
         
      if (c_closeDMAChannel())
         printf("nezavre DMA channel");
   }
      
   //===============================================
   
   //===============================================
   //stop packet
   //===============================================
   //packet inicialization
   unsigned char stop_header[HEADER_SIZE];
   for(i = 0; i < HEADER_SIZE; i++)
   {
      stop_header[i] = 0;
   } 
   //header
   stop_header[4] = 4;
   /*
   //print packet
   for(j = 0; j < HEADER_SIZE; j += byte_size)
   {
      for (i = byte_size + j -1; i >= 0 + j; i--) 
         printf("%02x ", *(stop_header + i));
      printf("  ");
   }
   printf("\n");
   */
   //send stop header
   if (c_openDMAChannel())
      printf("neotevre DMA channel");
      
   if (!c_sendData(stop_header, sizeof(stop_header)))
      printf("odeslano\n");
   else
      printf("nelze odeslat");
      
   if (c_closeDMAChannel())
      printf("nezavre DMA channel");
   
   }
   
   //==================================================

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
