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
#include <unistd.h>
#include <time.h>

int main(int argc, char **argv) {
   unsigned int size;
   unsigned char* outData;
   
   if (c_openDMAChannel())
				printf("neotevre DMA channel");
      
   while (1)
   {
			
      //printf("START\n");
      c_receiveData(&size,&outData);
      if (size != 0)
      {

    char buff[100];
    time_t now = time (0);
    strftime (buff, 100, "%Y-%m-%d %H:%M:%S.000", localtime (&now));
    printf ("%s\n", buff);

         printf("Received data, size: %dB\n", size);
         int i;
         for(i = 7; i >= 0 ; i--)
            printf("%02x ", *(outData + i));
			
         printf("  ");
			
         for(i = size-1; i >= 8 ; i--)
            printf("%02x ", *(outData + i));
            
         printf("\n");
         printf("END\n");
         printf("\n");  
      }
      else
      {
         //printf("Nothing to read\n");
      }
			
			//sleep(1);
   }

	return 0;
}
