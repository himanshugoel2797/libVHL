PREFIX  = $(DEVKITARM)/bin/arm-none-eabi
CC      = $(PREFIX)-gcc

all: VHL

VHL:
	$(CC) -DHEAD -c VHL.S -o VHL_HEAD.o
	$(CC) -DNIDS -c VHL.S -o VHL_NIDS.o
	$(CC) -DFUNC=0x00000001 -c VHL.S -o VHL_1.o
	$(CC) -DFUNC=0x00000002 -c VHL.S -o VHL_2.o
	$(CC) -DFUNC=0x00000003 -c VHL.S -o VHL_3.o
	$(CC) -DFUNC=0x00000004 -c VHL.S -o VHL_4.o
	ar rvs libVHL.a VHL_HEAD.o VHL_NIDS.o VHL_1.o VHL_2.o VHL_3.o VHL_4.o

clean:
	@rm -rf *.o *.a
