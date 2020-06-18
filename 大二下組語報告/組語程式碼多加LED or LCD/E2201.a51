
        ORG     0000H
        CLR     A
LOOP:   CLR		P1.0
	  MOV     A,#00000110B
	  CPL	A
	  MOV     P0,A
        ;JNB     P2.0,$
        ACALL   DELAY
        ;JB      P2.0,$
        ACALL   DELAY
        ;ADD     A,#00000001B
        ;DA      A
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