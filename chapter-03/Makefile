OUTFILE = test04
TESTCODE = test04
ASMFILE = returnval

CC = gcc
ASFLAGS +=  -m64  -masm=intel 
CFLAGS +=  -fno-asynchronous-unwind-tables -g -std=c11  
DIAGNOSTIC += -Wall -Wextra -Wpedantic -Waggregate-return -Wwrite-strings -Wfloat-equal -Wvla  -g3
OPTIMIZATION += -O1

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

$(OUTFILE) : $(TESTCODE).o  $(ASMFILE).o
	$(CC)  $(ASFLAGS)  $(DIAGNOSTIC) $(OPTIMIZATION)  -o $(OUTFILE)     $(TESTCODE).o  $(ASMFILE).o

$(ASMFILE).o : $(ASMFILE).s
	$(CC)  $(ASFLAGS)  $(DIAGNOSTIC) $(OPTIMIZATION) -c  -o $(ASMFILE).o  $(ASMFILE).s

$(TESTCODE).o : $(TESTCODE).c
	$(CC)  $(CFLAGS)  $(ASFLAGS)  $(OPTIMIZATION)  $(DIAGNOSTIC)  -c    -o $(TESTCODE).o   $(TESTCODE).c  

returnval: returnval.s
returnval-c: returnval-c.c
returnval-almost: returnval-almost.s
returnval02: returnval02.s

