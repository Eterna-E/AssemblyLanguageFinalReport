
        ORG     0000H
OFF:    ORL     P1,#11111111B
        ORL     P3,#11111111B

TEST1:  JNB     P3.7,OFF
        JNB     P3.6,MCY
        AJMP    TEST1

MCY:    CLR     P1.0
        MOV     R3,#100
DLY:    ACALL   DELAY
        JNB     P3.7,OFF
        DJNZ    R3,DLY
MCD:    SETB    P1.0
        ACALL   DELAY
        CLR     P1.1
TEST2:  JNB     P3.7,OFF
        AJMP    TEST2
;
DELAY:  MOV     R6,#250
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        RET
;
        END

