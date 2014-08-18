CC		= gcc
CFLAGS		= -g -O2

# libs
LIBCOMBO_CFLAGS		= -I/usr/local/liberouter/include/
LIBCOMBO_LIBS		= -L/usr/local/liberouter/lib/ -lcombo -lcommlbr -ldbus-1
LIBSZE2_CFLAGS		= -I/usr/local/liberouter/include/
LIBSZE2_LIBS		= -L/usr/local/liberouter/lib/ -lsze2 -lcommlbr -ldbus-1
LIBPCAP_LIBS		= -lpcap $(LIBSZE2_LIBS)


FLAGS=$(CFLAGS) $(LIBSZE2_CFLAGS) $(LIBSZE2_LIBS)

all: libsze_read libsze_write_program
   
libdpi_wrapper_pkg.o: libdpi_wrapper_pkg.c libdpi_wrapper_pkg.h
	$(CC) $(CFLAGS) -c libdpi_wrapper_pkg.c -o libdpi_wrapper_pkg.o 
   
libsze_read.o: libsze_read.c libdpi_wrapper_pkg.h
	$(CC) $(CFLAGS) -c libsze_read.c -o libsze_read.o
   
libsze_read: libdpi_wrapper_pkg.o libsze_read.o
	$(CC) $(FLAGS) libdpi_wrapper_pkg.o libsze_read.o -o libsze_read
   
libsze_write_program.o: libsze_write_program.c libdpi_wrapper_pkg.h
	$(CC) $(CFLAGS) -c libsze_write_program.c -o libsze_write_program.o
   
libsze_write_program: libdpi_wrapper_pkg.o libsze_write_program.o
	$(CC) $(FLAGS) libdpi_wrapper_pkg.o libsze_write_program.o -o libsze_write_program
   
.PHONY: clean
clean:
	rm -rf *.o libdpi_wrapper_pkg
