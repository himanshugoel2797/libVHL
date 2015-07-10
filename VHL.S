@ Copyright (C) 2015 VHL Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, VHL, 0001, 1, 0

PSP2_IMPORT_FUNC VHL, 0001, F00, 0x00000003, vhl_GetIntSetting
PSP2_IMPORT_FUNC VHL, 0001, F00, 0x00000004, vhl_SetIntSetting
