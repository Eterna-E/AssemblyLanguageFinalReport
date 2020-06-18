
        ORG     0000H
        AJMP    MAIN
; ==============================
        ORG     0023H
        JNB     RI,NON
        CLR     RI
        MOV     P1,SBUF
        AJMP    OK
 NON:   CLR     TI
 OK:    RETI
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

LOOP:   JNB     P3.2,TRANS
        JNB     P3.3,TRANS
        JNB     P3.4,TRANS
        JNB     P3.5,TRANS
        AJMP    LOOP
;

TRANS:  MOV     SBUF,P3
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
