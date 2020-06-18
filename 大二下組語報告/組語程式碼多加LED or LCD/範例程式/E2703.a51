        ORG     0000H
START:  MOV     R6,#126
        MOV     R5,#193
        ACALL   SOUND
        MOV     R6,#95
        MOV     R5,#255
        ACALL   SOUND
        AJMP    START
;
SOUND:  CLR     P3.7
        ACALL   DELAY
        SETB    P3.7
        ACALL   DELAY
        DJNZ    R5,SOUND
        RET
DELAY:  MOV     B,R6
DL:     MOV     R7,#6
        DJNZ    R7,$
        DJNZ    R6,DL
        MOV     R6,B
        RET
;
        END
