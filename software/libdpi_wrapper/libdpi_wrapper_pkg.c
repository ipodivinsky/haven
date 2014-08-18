/* *****************************************************************************
 * Project Name: Hardware - Software Framework for Functional Verification 
 * File Name:    C Wrapper
 * Description: 
 * Author:       Marcela Simkova <isimkova@fit.vutbr.cz> 
 * Date:         11.7.2014 
 * ************************************************************************** */


#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <err.h>
#include <libsze2.h>
#include "libdpi_wrapper_pkg.h"

//-----------------------------------------------------------------------------
//- GLOBAL VARIABLES
//-----------------------------------------------------------------------------
static struct szedata *sze = NULL;

static unsigned char program_memory[524288];  

//-----------------------------------------------------------------------------
//- USER Functions
//-----------------------------------------------------------------------------

/*
 *  Open DMA Channel for data transport. 
 */ 
int c_openDMAChannel(){
  char *sze_dev       = "/dev/szedataII0";	  // path to hw device 
  unsigned int rx     = SZE2_ALL_INTERFACES;
  unsigned int tx     = SZE2_ALL_INTERFACES;
  bool ret;
  
	// check if sze is not already initialized
	if (sze != NULL)
		return EXIT_FAILURE;

  // create sze 
  sze = szedata_open(sze_dev);
  if (sze == NULL)
    return EXIT_FAILURE;
		
	ret = szedata_subscribe3(sze, &rx, &tx);
	
	if (ret){
    szedata_close(sze); 
    sze = NULL;
    return EXIT_FAILURE; 
  }
  
  else { 
    ret = szedata_start(sze);
	  if (ret){
      szedata_close(sze); 
      sze = NULL;
      return EXIT_FAILURE; 
    }   
  }
  
  int i;
  
  for (i=0; i<524288; i++)
     program_memory[i] = 0;
  
  return EXIT_SUCCESS;
}    

/*
 *  Close DMA Channel after data transport. 
 */    
int c_closeDMAChannel(){
	if (sze == NULL)
		return EXIT_FAILURE;

  szedata_close(sze);
  sze = NULL;
  return EXIT_SUCCESS;
}

/*
 *  Send start packet through DMA Channel. 
 */
void c_sendStart(){
  int packet_size = 16;
  
  unsigned char packet[packet_size];
  
  int i; 
  
  for(i = 0; i < packet_size; i++){
    packet[i] = 0;
  }
  
  // signature of start packet
  packet[4] = 1;
  
  if (!c_sendData(packet, sizeof(packet)))
      printf("Start packet sent!\n");
   else
      printf("Start packet not sent!\n");
}

/*
 *  Send stop packet through DMA Channel. 
 */
void c_sendStop(){
  int packet_size = 16;
  
  unsigned char packet[packet_size];
  
  int i; 
  
  for(i = 0; i < packet_size; i++){
    packet[i] = 0;
  }
  
  // signature of start packet
  packet[4] = 4;
  
  if (!c_sendData(packet, sizeof(packet)))
      printf("Stop packet sent!\n");
   else
      printf("Stop packet not sent!\n");
}

/*
 *  Data transport through DMA Channel - transaction is sent to hardware. 
 */
int c_sendData(unsigned char* data, unsigned int pktSize){
  unsigned char *test_data;                     // sze test data
  unsigned int len;
  int ret;
  unsigned short ifc  = 0;
  /*
  //print packet
  int i,j;
      for(j = 0; j < pktSize; j += 8)
      {
         for (i = 8 + j -1; i >= 0 + j; i--) 
            printf("%02x ", *(data + i));
         printf("  ");
      }
      printf("\n");
   */      
   // prepare packet for transfer to hardware    
   test_data = szedata_prepare_packet(sze, NULL, 0, data, pktSize, &len);  

   // szewrite - send data to hardware
   ret = szedata_try_write_next(sze, test_data, len, ifc);
	if (ret){
		return EXIT_FAILURE;
	}
  return EXIT_SUCCESS;
}  

/*
 *  Writa instructions to program memory.
 */
void c_write(unsigned char data, int addr){
  program_memory[addr] = data;
}

/*
 *  Send application to HW. 
 */
void c_sendAllData(){
printf("send all data\n");
  int packet_size = 16;
  
  unsigned char packet[packet_size];
  
  int i, j; 
  
  for(i = 0; i < 8; i++){
    packet[i] = 0;
  }
  
  for (i=0; i<524288; ) {
    for (j=8; j<16; j++){
      packet[j] = program_memory[i];
      i++;
    }  
    
    if (!c_sendData(packet, sizeof(packet)))
    {}
      //printf("Data packet sent!\n");
    else
      printf("Data packet not sent!\n");
  }
}

/*
 *  Data transport through DMA Channel - transaction is received from hardware.
 */
/*
 *  Data transport through DMA Channel - transaction is received from hardware.
 */
int c_receiveData(unsigned int* size,unsigned char** outData){ 
   unsigned char *packet;
	unsigned int packet_len;
   unsigned char *data, *hw_data;
	unsigned int data_len, hw_data_len;
   unsigned int segsize;
   
   packet = szedata_read_next(sze, &packet_len);

   if(packet) 
   {
      segsize = szedata_decode_packet(packet, &data, &hw_data, &data_len, &hw_data_len);
      *outData = data;
      *size = data_len; 

		//write natural received data	
      /*int i;         
		for(i = 0; i < data_len; i++)
			printf("%02x ", *(data + i));
		printf("\n");
      */
	} 
   else 
   {
      //printf("nothing to read\n");
      *size = 0;
	}

  return EXIT_SUCCESS;
} 

