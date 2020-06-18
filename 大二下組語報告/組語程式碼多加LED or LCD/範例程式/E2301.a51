        ORG     0000H
        AJMP    MAIN
;
        ORG     000BH
        MOV     TH0,#3CH
        MOV     TL0,#0B0H
        DJNZ    R4,CONT
        MOV     R4,#20
        ADD     A,#01
        DA      A
        MOV     P1,A
CONT:   RETI
;
MAIN:   MOV     A,#00
        MOV     P1,A
        MOV     R4,#20
        MOV     TMOD,#00000001B
        MOV     TH0,#3CH
        MOV     TL0,#0B0H
        SETB    EA
        SETB    ET0
;
        ACALL   DELAY
        JNB     P3.7,$
        ACALL   DELAY
;
        JB      P3.7,$
        SETB    TR0
        ACALL   DELAY
        JNB     P3.7,$
        ACALL   DELAY
;
        JB      P3.7,$
        CLR     TR0
        ACALL   DELAY
        JNB     P3.7,$
        ACALL   DELAY
;
        JB      P3.7,$
        AJMP    MAIN
;
DELAY:  MOV     R6,#100
DL:     MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL
        RET
;
        END

