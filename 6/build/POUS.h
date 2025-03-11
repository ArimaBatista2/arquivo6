#include "beremiz.h"
#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

// PROGRAM PROGRAM0
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(INT,OUT)
  __DECLARE_VAR(INT,OUT2)

  // PROGRAM private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,RESET)
  __DECLARE_LOCATED(INT,CNT)
  __DECLARE_LOCATED(INT,CNT2)
  __DECLARE_EXTERNAL(INT,RESETCOUNTERVALUE2)
  __DECLARE_EXTERNAL(INT,RESETCOUNTERVALUE)

} PROGRAM0;

void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain);
// Code part
void PROGRAM0_body__(PROGRAM0 *data__);
#endif //__POUS_H
