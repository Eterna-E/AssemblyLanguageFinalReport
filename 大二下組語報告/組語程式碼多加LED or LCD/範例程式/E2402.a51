
        ORG     0000H
START:  MOV     R2,#50
LOOP1:  MOV     DPTR,#TABLE
        ACALL   SCAN1
        DJNZ    R2,LOOP1
        MOV     R2,#50
LOOP2:  MOV     DPTR,#BLANK
        ACALL   SCAN1
        DJNZ    R2,LOOP2
        AJMP    START
;
SCAN1:  MOV     R5,#11101111B
        MOV     R4,#05
        MOV     R0,#00
LOOP:   MOV     A,R0
        MOVC    A,@A+DPTR
        MOV     P1,A
        INC     R0
        MOV     P3,R5
        ACALL   DELAY
        ORL     P3,#11111111B
        MOV     A,R5
        RR      A
        MOV     R5,A
        DJNZ    R4,LOOP
        RET
;
DELAY:  MOV     R6,#5
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        RET
;
TABLE:  DB     0C0H            ;0
        DB     0F9H            ;1
        DB     0A4H            ;2
        DB     0B0H            ;3
        DB      99H            ;4
;
BLANK:  DB     0FFH
        DB     0FFH
        DB     0FFH
        DB     0FFH
        DB     0FFH
;
        END


