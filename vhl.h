#ifndef _VHL_SDK_H_
#define _VHL_SDK_H_


typedef enum{
  VARIABLE_EXIT_MASK = 1,
  VARIABLE_SUSPEND_MASK = 2
} INT_VARIABLE_OPTIONS;


int vhl_loadHomebrew(const char *path, int slot);
int vhl_startHomebrew(int slot);

int vhl_getIntSetting(INT_VARIABLE_OPTIONS option);
int vhl_setIntSetting(INT_VARIABLE_OPTIONS option, int value);

#endif