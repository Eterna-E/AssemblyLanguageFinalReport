
        ORG     0000H
        ORL     P1,#11111111B
        ORL     P3,#11111111B
TEST:   JNB     P3.2,SOL        ;P3.2=0 ?
        JNB     P3.1,LAL        ;P3.1=0 ?
        JNB     P3.0,SIL        ;P3.0=0 ?
        JNB     P1.7,DO         ;P1.7=0 ?
        JNB     P1.6,RE         ;P1.6=0 ?
        JNB     P1.5,MI         ;P1.5=0 ?
        JNB     P1.4,FA         ;P1.4=0 ?
        JNB     P1.3,SO         ;P1.3=0 ?
        JNB     P1.2,LA         ;P1.2=0 ?
        JNB     P1.1,SI         ;P1.1=0 ?
        JNB     P1.0,DOH        ;P1.0=0 ?
        AJMP    TEST
;
SOL:    MOV     R6,#170
        AJMP    OUTPUT
LAL:    MOV     R6,#150
        AJMP    OUTPUT
SIL:    MOV     R6,#134
        AJMP    OUTPUT
DO:     MOV     R6,#126
        AJMP    OUTPUT
RE:     MOV     R6,#113
        AJMP    OUTPUT
MI:     MOV     R6,#100
        AJMP    OUTPUT
FA:     MOV     R6,#95
        AJMP    OUTPUT
SO:     MOV     R6,#85
        AJMP    OUTPUT
LA:     MOV     R6,#75
        AJMP    OUTPUT
SI:     MOV     R6,#67
        AJMP    OUTPUT
DOH:    MOV     R6,#63
;
OUTPUT: CLR     P3.7
        ACALL   DELAY
        SETB    P3.7
        ACALL   DELAY
        AJMP    TEST
;
DELAY:  MOV     B,R6
DL:     MOV     R7,#6
        DJNZ    R7,$
        DJNZ    R6,DL
        MOV     R6,B
        RET
;
        END

