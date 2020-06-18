
        ORG     0000H
        ORL     P1,#11111111B
        CLR     SM0
        CLR     SM1
LOOP:   CLR     TI
        MOV     SBUF,P1
WAIT:   JNB     TI,WAIT
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
