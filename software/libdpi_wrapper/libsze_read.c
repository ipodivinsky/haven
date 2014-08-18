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
#include <unistd.h>
#include <time.h>

#define BYTE_SIZE 4
#define REG_FILE argv[1]
#define PAM_FILE argv[2]

int main(int argc, char **argv) {
   unsigned int size;
   unsigned char* outData;

   FILE *file;
   file = fopen(PAM_FILE, "w");
   if (file == NULL)
   {
      fprintf(stderr, "Nelze otevrit soubor: %s\n", PAM_FILE);
      return 1;
   }
   fclose(file);
   
   file = fopen(REG_FILE, "w");
   if (file == NULL)
   {
      fprintf(stderr, "Nelze otevrit soubor: %s\n", PAM_FILE);
      return 1;
   }
   fclose(file);

   
   if (c_openDMAChannel())
				printf("neotevre DMA channel");
      
   while (1)
   {
      c_receiveData(&size,&outData);
      if (size != 0)
      {

         //char buff[100];
         //time_t now = time (0);
         //strftime (buff, 100, "%Y-%m-%d %H:%M:%S.000", localtime (&now));
         //printf ("%s\n", buff);

         //printf("Received data, size: %dB\n", size);
         
         int full_bytes = size/BYTE_SIZE;
         int rest_bits = size % BYTE_SIZE;
         
         int j = 0;
         
         if (*(outData) == 2)
         {
            file = fopen(REG_FILE, "a");
         }
         else if (*(outData) == 3)
         {
            file = fopen(PAM_FILE, "a");
         }
         
         
         
         for( j = 0; j < full_bytes; j++)
         {
            int i;
            if (j > 1)
            {
               if (*(outData) == 2)
               {
                  for(i = ((j+1) * BYTE_SIZE - 1); i >= j * BYTE_SIZE; i--)
                  {
                     fprintf(file,"%02x", *(outData + i));
                  }
                  fprintf(file,"\n");
                  
               }
               else if (*(outData) == 3)
               {
                  for(i = ((j+1) * BYTE_SIZE - 1); i >= j * BYTE_SIZE; i--)
                     fprintf(file,"%02x",*(outData + i));
                  fprintf(file,"\n");
               }
               
               
            }
         }
         
            int i;
            for(i = size-1; i >= (full_bytes * BYTE_SIZE); i--)
               fprintf(file,"%02x", *(outData + i));
         
         fclose(file);
      }
      else
      {
         //printf("Nothing to read\n");
      }
			
			//sleep(1);
   }

	return 0;
}
