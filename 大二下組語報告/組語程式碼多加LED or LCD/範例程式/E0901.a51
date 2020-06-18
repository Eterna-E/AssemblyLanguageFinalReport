        ORG     0000H
LOOP:   MOV     P1,#00000000B
        ACALL   DELAY
        MOV     P1,#11111111B
        ACALL   DELAY
        AJMP    LOOP
;
DELAY:  MOV     R6,#250
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        RET
;
        END


