
        ORG     0000H
OFF:    ORL     P1,#11111111B
        ORL     P3,#11111111B
TEST1:  ACALL   DELAY
        JB      P3.7,TEST1
        CPL     P1.0
TEST2:  ACALL   DELAY
        JNB     P3.7,TEST2
        AJMP    TEST1
;
DELAY:  MOV     R6,#100
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        RET
;
        END

