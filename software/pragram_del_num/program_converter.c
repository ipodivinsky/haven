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
#define input "zerolen-2.c.xexe.txt"
#define output "zerolen-2.c.xexe.txt.hw"


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
   
   int i = 0;
   
   //fprintf(outputFile,"#\n00000000\n00000000\n");
   
   while (fscanf(inputFile, "%9s", line) != EOF)
   {  
      if (i == 2)
      {
         i = 0;
         //fprintf(outputFile,"#\n00000000\n00000000\n");
      }
      fscanf(inputFile, "%8s", line);
      //printf("%s\n",line);
      i++;
      

      fprintf(outputFile,"%s\n",line);
   }
   
   return EXIT_SUCCESS;
}    

