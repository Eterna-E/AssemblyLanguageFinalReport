
        ORG     0000H
        MOV     TMOD,#00100000B
        MOV     TH1,#230
        MOV     TL1,#230
        SETB    TR1
;
        MOV     SCON,#01110000B
LOOP:   CLR     RI
        CLR     TI
        MOV     SBUF,P1
WAIT1:  JNB     TI,WAIT1
;
WAIT2:  JNB     RI,WAIT2
;
        MOV     A,SBUF
        JNB     ACC.0,CASE0
        JNB     ACC.1,CASE1
        JNB     ACC.2,CASE2
        JNB     ACC.3,CASE3
        AJMP    LOOP
;
CASE0:  MOV     P1,#00111111B
        AJMP    LOOP
CASE1:  MOV     P1,#11001111B
        AJMP    LOOP
CASE2:  MOV     P1,#00001111B
        AJMP    LOOP
CASE3:  MOV     P1,#11111111B
        AJMP    LOOP
;
        END



