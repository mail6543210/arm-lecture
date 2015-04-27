CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -ggdb3
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o

default: fibseq

.FORCE:
.PHONY: default clean qemu .FORCE

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s .FORCE
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
qemu: fibseq
	@yes 5 | $(call QEMU_CMD)
	@sleep 1
	@yes 6 | $(call QEMU_CMD)
	@sleep 1
	@yes 7 | $(call QEMU_CMD)
	@sleep 1

gdb: fibseq
	echo 5 | qemu-arm -L /usr/arm-linux-gnueabihf -g 1234 ./fibseq &
	cgdb -d arm-none-eabi-gdb