
        ORG     0000H
START:  ORL     P1,#11111111B
        ORL     P3,#11111111B
TEST1:  JB      P3.6,$
ON:     CLR     P1.0
        MOV     R3,#100
D10S:   ACALL   DELAY
        JNB     P3.7,OFF
        DJNZ    R3,D10S
        CLR     P1.1
TEST2:  JB      P3.7,$
OFF:    SETB    P1.1
        MOV     R3,#50
D5S:    ACALL   DELAY
        JNB     P3.6,ON
        DJNZ    R3,D5S
        AJMP    START
;
DELAY:  MOV     R6,#250
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        RET
;
        END
