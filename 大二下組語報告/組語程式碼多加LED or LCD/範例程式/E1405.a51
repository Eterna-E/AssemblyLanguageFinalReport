
        ORG     0000H
        AJMP    MAIN
; ==============================
        ORG     0023H
        JNB     RI,NON
        CLR     RI
RECEV:  MOV     A,SBUF
        JNB     ACC.2,CASE5
        JNB     ACC.3,CASE6
        JNB     ACC.4,CASE7
        JNB     ACC.5,CASE8
        AJMP    OK

CASE5:  CLR     P1.0
        MOV     SBUF,P1
        AJMP    OK

CASE6:  SETB    P1.0
        MOV     SBUF,P1
        AJMP    OK

CASE7:  CLR     P1.1
        MOV     SBUF,P1
        AJMP    OK

CASE8:  SETB    P1.1
        MOV     SBUF,P1
        AJMP    OK

NON:    CLR     TI
OK:     RETI
; =============================

MAIN:   MOV     TMOD,#00100000B
        MOV     TH1,#230
        MOV     TL1,#230
        SETB    TR1
;
        MOV     SCON,#01110000B
        CLR     RI
        CLR     TI
        SETB    ES
        SETB    EA

LOOP:   JNB     P3.2,CASE1
        JNB     P3.3,CASE2
        JNB     P3.4,CASE3
        JNB     P3.5,CASE4
        AJMP    LOOP
;
CASE1:  CLR     P1.0
        AJMP    TRANS
CASE2:  SETB    P1.0
        AJMP    TRANS
CASE3:  CLR     P1.1
        AJMP    TRANS
CASE4:  SETB    P1.1
 
;
TRANS:  MOV     SBUF,P1
;
WAIT:   CALL    DELAY
        MOV     A,P3
        CJNE    A,#11111111B,WAIT
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
