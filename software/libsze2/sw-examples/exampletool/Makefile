include ../Makefile.conf

FLAGS=$(CFLAGS) $(LIBCOMBO_CFLAGS) $(LIBCOMBO_LIBS)

all: exampletool

exampletool: exampletool.c
	$(CC) $< $(FLAGS) -o $@

.PHONY: clean
clean:
	rm -rf *.o exampletool
