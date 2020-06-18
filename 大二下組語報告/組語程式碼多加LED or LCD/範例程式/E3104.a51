
        ORG     0000H
        MOV     A,#11111000B
;
LOOP:   MOV     R1,#200
FOR:    RL      A
        MOV     P1,A
        ACALL   DELAY
        DJNZ    R1,FOR
;
        ACALL   HOLD
;
        MOV     R1,#200
REV:    RR      A
        MOV     P1,A
        ACALL   DELAY
        DJNZ    R1,REV
;
        ACALL   HOLD
;
        AJMP    LOOP
;
HOLD:   MOV     R5,#200
DL1:    ACALL   DELAY
        DJNZ    R5,DL1
        RET
;
DELAY:  MOV     R6,#25
DL2:    MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL2
        RET
;
        END

