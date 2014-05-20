include ../Makefile.conf

FLAGS=$(CFLAGS) $(LIBCOMBO_CFLAGS) $(LIBCOMBO_LIBS)

all: component

component: component.c
	$(CC) $< $(FLAGS) -o $@

.PHONY: clean
clean:
	rm -rf *.o component
