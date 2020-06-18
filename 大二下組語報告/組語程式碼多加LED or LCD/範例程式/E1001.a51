
        ORG     0000H
        MOV     R1,#00000000B
        MOV     R2,#01010101B
        MOV     R3,#00001111B
        MOV     R4,#11110000B
;
TEST:   ORL     P3,#0FFH
        JNB     P3.7,CASE1
        JNB     P3.6,CASE2
        JNB     P3.5,CASE3
        JNB     P3.4,CASE4
        AJMP    TEST
;
CASE1:  MOV     A,R1
        MOV     P1,A
        XRL     A,#11111111B
        MOV     R1,A
        ACALL   DELAY
        AJMP    TEST

CASE2:  MOV     A,R2
        MOV     P1,A
        XRL     A,#10101010B
        MOV     R2,A
        ACALL   DELAY
        AJMP    TEST

CASE3:  MOV     A,R3
        MOV     P1,A
        XRL     A,#11110000B
        MOV     R3,A
        ACALL   DELAY
        AJMP    TEST

CASE4:  MOV     A,R4
        MOV     P1,A
        XRL     A,#00001111B
        MOV     R4,A
        ACALL   DELAY
        AJMP    TEST
;
DELAY:  MOV     R5,#2
DL1:    MOV     R6,#250
DL2:    MOV     R7,#200
DL3:    DJNZ    R7,DL3
        DJNZ    R6,DL2
        DJNZ    R5,DL1
        RET
;
        END

