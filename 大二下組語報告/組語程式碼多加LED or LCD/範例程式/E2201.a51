
        ORG     0000H
        CLR     A
LOOP:   MOV     P1,A
        JNB     P3.7,$
        ACALL   DELAY
        JB      P3.7,$
        ACALL   DELAY
        ADD     A,#01
        DA      A
        AJMP    LOOP

;
DELAY:  MOV     R6,#100
DL:     MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL
        RET
;
        END

