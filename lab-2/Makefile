CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -pthread -static -ggdb3

objects = atomic.o mutex.o

default: atomic

.PHONY: default clean .FORCE
.FORCE:

atomic: $(objects)
	$(CC) $(CFLAGS) -o$@ $^

atomic.o: atomic.c
mutex.o: mutex.s .FORCE

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) atomic

qemu: atomic
	qemu-arm ./atomic

gdb: atomic
	qemu-arm -g 1234 ./atomic &
	cgdb -d arm-none-eabi-gdb