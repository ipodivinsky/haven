include ../Makefile.conf

all: read write

FLAGS=$(CFLAGS) $(LIBPCAP_LIBS)

read: read.c
	$(CC) $< $(FLAGS) -o $@

write: write.c
	$(CC) $< $(FLAGS) -o $@

.PHONY: clean
clean:
	rm -rf *.o read write
