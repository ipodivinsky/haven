/* *****************************************************************************
 * Project Name: Hardware - Software Framework for Functional Verification 
 * File Name:    C Wrapper
 * Description: 
 * Author:       Marcela Simkova <xsimko03@stud.fit.vutbr.cz> 
 * Date:         3.5.2011 
 * ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#define BYTE_LENGHT 8
#define LINE_SIZE 4
#define input "input"
#define output "input_hex"


int main(int argc, char *argv[])
{  
   char line[LINE_SIZE*BYTE_LENGHT];
   int line_int[LINE_SIZE];
   
   FILE *inputFile;
   inputFile = fopen(input,"r");
   if (inputFile == NULL)
      fprintf(stderr, "Cannot open file");
      
   FILE *outputFile;
   outputFile = fopen(output,"w");
   if (outputFile == NULL)
      fprintf(stderr, "Cannot open file");
   
   
   while (fscanf(inputFile, "%32s", line) != EOF)
   {
      printf("%s\n",line);
      
      char temp;
      int i = 0;
      int j = 0;
      int z = 1;
      
      for(i = LINE_SIZE-1; i >= 0 ; i--)
      {
         line_int[i] = 0;
         z = 1;
         for(j = 0; j< BYTE_LENGHT; j++)
         {
            line_int[i] += (line[(i * BYTE_LENGHT) + j] - '0') * z;
            z = z * 2;
            //temp = line[(i * BYTE_LENGHT) + j];
            //line[(i * BYTE_LENGHT) + j] = line[(i * BYTE_LENGHT) + (BYTE_LENGHT-1 - j)];
            //line[(i * BYTE_LENGHT) + (BYTE_LENGHT-1 - j)] = temp;
         }
         fprintf(outputFile,"%02x",line_int[i]);
      }
      fprintf(outputFile,"\n");
   }
   
   return EXIT_SUCCESS;
}    

