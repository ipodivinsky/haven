CC		= gcc
CFLAGS		= -g -O2

# libs
LIBCOMBO_CFLAGS		= -I/usr/local/liberouter/include/
LIBCOMBO_LIBS		= -L/usr/local/liberouter/lib/ -lcombo -lcommlbr -ldbus-1
LIBSZE2_CFLAGS		= -I/usr/local/liberouter/include/
LIBSZE2_LIBS		= -L/usr/local/liberouter/lib/ -lsze2 -lcommlbr -ldbus-1
LIBPCAP_LIBS		= -lpcap $(LIBSZE2_LIBS)


FLAGS=$(CFLAGS) $(LIBSZE2_CFLAGS) $(LIBSZE2_LIBS)

all: libsze_read libsze_write libsze_write_program
   
libsze_wrapper.o: libsze_wrapper.c libsze_wrapper.h
	$(CC) $(CFLAGS) -c libsze_wrapper.c -o libsze_wrapper.o 
   
libsze_read.o: libsze_read.c libsze_wrapper.h
	$(CC) $(CFLAGS) -c libsze_read.c -o libsze_read.o
   
libsze_read: libsze_wrapper.o libsze_read.o
	$(CC) $(FLAGS) libsze_wrapper.o libsze_read.o -o libsze_read
   
libsze_write.o: libsze_write.c libsze_wrapper.h
	$(CC) $(CFLAGS) -c libsze_write.c -o libsze_write.o
   
libsze_write: libsze_wrapper.o libsze_write.o
	$(CC) $(FLAGS) libsze_wrapper.o libsze_write.o -o libsze_write
   
libsze_write_program.o: libsze_write_program.c libsze_wrapper.h
	$(CC) $(CFLAGS) -c libsze_write_program.c -o libsze_write_program.o
   
libsze_write_program: libsze_wrapper.o libsze_write_program.o
	$(CC) $(FLAGS) libsze_wrapper.o libsze_write_program.o -o libsze_write_program
   
.PHONY: clean
clean:
	rm -rf *.o libsze_wrapper
