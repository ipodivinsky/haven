/* *****************************************************************************
 * Project Name: Hardware - Software Framework for Functional Verification 
 * File Name:    C Wrapper
 * Description: 
 * Author:       Marcela Simkova <xsimko03@stud.fit.vutbr.cz> 
 * Date:         3.5.2011 
 * ************************************************************************** */
 
int c_openDMAChannel();
int c_closeDMAChannel();
void c_sendStart();
void c_sendStop();
int c_sendData(unsigned char* data, unsigned int pktSize);
void c_write(unsigned char data, int addr);
void c_sendAllData();
int c_receiveData(unsigned int* size,unsigned char** outData);
