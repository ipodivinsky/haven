/* *****************************************************************************
 * Project Name: Hardware - Software Framework for Functional Verification 
 * File Name:    C Wrapper
 * Description: 
 * Author:       Marcela Simkova <xsimko03@stud.fit.vutbr.cz> 
 * Date:         3.5.2011 
 * ************************************************************************** */
 
int c_openDMAChannel();
int c_closeDMAChannel();
int c_sendData(unsigned char* data, unsigned int pktSize);
int c_receiveData(unsigned int* size,unsigned char** outData);
