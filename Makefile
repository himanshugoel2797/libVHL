# Copyright (C) 2015 VHL Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

TARGET := libvhl_stub.a

COMPILE := arm-none-eabi-gcc -specs=psp2.specs

ENTRIES := $(addsuffix .o,$(addprefix VHL_,3 4))
OBJS	:= VHL_head.o VHL_NIDS.o $(ENTRIES)

all: $(TARGET)

$(TARGET): $(OBJS)
	ar rvs $@ $^

VHL_head.o: VHL.S
	$(COMPILE) -DHEAD -c $< -o $@

VHL_NIDS.o: VHL.S
	$(COMPILE) -DNIDS -c $< -o $@

$(ENTRIES): VHL.S
	$(COMPILE) -DFUNC=$(subst VHL_,0x,$*) $< -c -o $@

install: $(TARGET)
	@cp $(TARGET) $(PSP2SDK)/lib
	@cp vhl.h $(PSP2SDK)/include
	@echo "Installed!"

clean:
	@rm -rf $(OBJS) $(TARGET)
