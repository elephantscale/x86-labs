CC=gcc
ASFLAGS += -W
CFLAGS += -O1 -g -masm=intel -fno-asynchronous-unwind-tables

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

fibtest: fibtest.c fastfib.s uint64_array_to_string.c
