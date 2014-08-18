CC		= gcc
CFLAGS		= -g -O2


all: program_converter

program_converter: program_converter.c
	$(CC) $(CFLAGS) program_converter.c -o program_converter

   
.PHONY: clean
clean:
	rm -rf *.o program_converter