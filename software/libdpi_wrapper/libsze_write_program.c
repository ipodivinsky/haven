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
#include "libdpi_wrapper_pkg.h"  

#define HEADER_SIZE 8
#define PACKET_SIZE 16
#define DATA_SIZE 8
#define INST_SIZE 4

int main(int argc, char **argv) {
   
   int r = 0;
   //send program for two times - debugging purposses
   for (r = 0; r<1; r++)
   {
   FILE *program;
   program = fopen(argv[1], "r");
   if (program == NULL)
   {
      fprintf(stderr, "Nelze otevrit soubor: %s\n", argv[1]);
      return 1;
   }
   
   int i = 0;
   int j;
   int byte_size = 8;
   
   //===============================================
   //start packet
   //===============================================
   if (c_openDMAChannel())
      printf("neotevre DMA channel");
      
   c_sendStart();
   
   
   unsigned char packet[PACKET_SIZE];
   //===============================================
   //preparing one packet = reading two instructions
   //===============================================
   unsigned char read = 0;
   int scan = 0;
   int addr = 0;
   scan = fscanf(program,"%x",&addr);
   //addr = read;
   //printf("addr:%x ",addr);
   while (scan > 0)
   {    
      
      for (i=0; i<4; i++)
      {
         scan = fscanf(program,"%02x",&read);
         if (scan > 0)
         {
            //printf("addr: %i, data: %02x\n", addr+i, read);
            c_write(read, addr+i);
         }
         else
            break;
      }
      scan = fscanf(program,"%x",&addr);
        }
   
   
   c_sendAllData();
      
     //===============================================
   //stop packet
   //===============================================
      c_sendStop();
      if (c_closeDMAChannel())
         printf("nezavre DMA channel");
   
      fclose(program);
   }
	return 0;
}
