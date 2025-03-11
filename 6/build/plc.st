PROGRAM program0
  VAR
    Reset : BOOL := false;
  END_VAR
  VAR
    Cnt AT %QW0.1 : INT := 0;
    Cnt2 AT %QW0.2 : INT := 0;
  END_VAR
  VAR_EXTERNAL CONSTANT
    ResetCounterValue2 : INT;
  END_VAR
  VAR_OUTPUT
    Out : INT;
    Out2 : INT;
  END_VAR
  VAR_EXTERNAL CONSTANT
    ResetCounterValue : INT;
  END_VAR

  IF Reset THEN
    Cnt := ResetCounterValue;
    Cnt2 := ResetCounterValue2;
  ELSE
    Cnt := Cnt + 1;
    Cnt2 := Cnt2;
    
  END_IF;
  Out := Cnt;
  Out2 := Cnt2;
END_PROGRAM


CONFIGURATION config
  VAR_GLOBAL CONSTANT
    ResetCounterValue : INT := 17;
    ResetCounterValue2 : INT := 17;
  END_VAR

  RESOURCE resource1 ON PLC
    TASK task0(INTERVAL := T#100ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
