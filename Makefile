# Copyright (C) 2015 VHL Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
