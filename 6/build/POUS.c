void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_VAR(data__->RESET,__BOOL_LITERAL(FALSE),retain)
  __INIT_LOCATED(INT,__QW0_1,data__->CNT,retain)
  __INIT_LOCATED_VALUE(data__->CNT,0)
  __INIT_LOCATED(INT,__QW0_2,data__->CNT2,retain)
  __INIT_LOCATED_VALUE(data__->CNT2,0)
  __INIT_EXTERNAL(INT,RESETCOUNTERVALUE2,data__->RESETCOUNTERVALUE2,retain)
  __INIT_VAR(data__->OUT,0,retain)
  __INIT_VAR(data__->OUT2,0,retain)
  __INIT_EXTERNAL(INT,RESETCOUNTERVALUE,data__->RESETCOUNTERVALUE,retain)
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  if (__GET_VAR(data__->RESET,)) {
    __SET_LOCATED(data__->,CNT,,__GET_EXTERNAL(data__->RESETCOUNTERVALUE,));
    __SET_LOCATED(data__->,CNT2,,__GET_EXTERNAL(data__->RESETCOUNTERVALUE2,));
  } else {
    __SET_LOCATED(data__->,CNT,,(__GET_LOCATED(data__->CNT,) + 1));
    __SET_LOCATED(data__->,CNT2,,__GET_LOCATED(data__->CNT2,));
  };
  __SET_VAR(data__->,OUT,,__GET_LOCATED(data__->CNT,));
  __SET_VAR(data__->,OUT2,,__GET_LOCATED(data__->CNT2,));

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





