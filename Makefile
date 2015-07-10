# Copyright (C) 2015 VHL Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

TARGET := libvhl_stub.a

CC      = arm-none-eabi-gcc

ENTRIES := $(addsuffix .o,$(addprefix VHL_,1 2 3 4))
OBJS	:= VHL_head.o VHL_NIDS.o $(ENTRIES)

all: $(TARGET)

$(TARGET): $(OBJS)
	ar rvs $@ $^

VHL_head.o: VHL.S
	$(CC) -DHEAD -c $< -o $@

VHL_NIDS.o: VHL.S
	$(CC) -DNIDS -c $< -o $@

$(ENTRIES): VHL.S
	$(CC) -DFUNC=$(subst VHL_,0x,$*) $< -c -o $@

clean:
	@rm -rf $(OBJS) $(TARGET)
