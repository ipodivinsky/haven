include ../Makefile.conf

FLAGS=$(CFLAGS) $(LIBSZE2_CFLAGS) $(LIBSZE2_LIBS)

all: read write read_parse

read: read.c
	$(CC) $(FLAGS) $< -o $@

write: write.c
	$(CC) $(FLAGS) $< -o $@

read_parse: read_parse.c
	$(CC) $(FLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf *.o read write
