
        ORG     0000H
        MOV     TMOD,#00100000B
        MOV     TH1,#230
        MOV     TL1,#230
        SETB    TR1
; =============================
        MOV     SCON,#01110000B

LOOP:   CLR     RI
        JNB     RI,$
; =============================
        MOV     A,SBUF
        CJNE    A,#'0',NEXT1
        AJMP    ALLOFF
NEXT1:  CJNE    A,#'1',NEXT2
        AJMP    LOAD1
NEXT2:  CJNE    A,#'2',NEXT3
        AJMP    LOAD2
NEXT3:  CJNE    A,#'3',NEXT4
        AJMP    LOAD3
NEXT4:  CJNE    A,#'4',DONT
        AJMP    LOAD4
DONT:   AJMP    LOOP
; ===========================
ALLOFF: MOV     P1,#11111111B
        AJMP    SENDALL
;
LOAD1:  CPL     P1.0
        JNB     P1.0,ON1
        AJMP    SENDOFF
ON1:    AJMP    SENDON
;
LOAD2:  CPL     P1.1
        JNB     P1.1,ON2
        AJMP    SENDOFF
ON2:    AJMP    SENDON
;
LOAD3:  CPL     P1.2
        JNB     P1.2,ON3
        AJMP    SENDOFF
ON3:    AJMP    SENDON
;
LOAD4:  CPL     P1.3
        JNB     P1.3,ON4
        AJMP    SENDOFF
ON4:    AJMP    SENDON
; ======================
;
SENDALL:
        CLR     TI
        MOV     SBUF,#'2'
        JNB     TI,$
        AJMP    LOOP
;
SENDON:
        CLR     TI
        MOV     SBUF,#'1'
        JNB     TI,$
        AJMP    LOOP
;
SENDOFF:
        CLR     TI
        MOV     SBUF,#'0'
        JNB     TI,$
        AJMP    LOOP
;
        END




