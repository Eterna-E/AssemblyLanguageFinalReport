
        ORG     0000H
START:  MOV     DPTR,#TABLE
        MOV     R3,#OK-TABLE+1
OVER:   MOV     R2,#40
SCAN:   ACALL   SCAN1
        DJNZ    R2,SCAN
        INC     DPTR
        DJNZ    R3,OVER
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
TABLE:  DB     0FFH            ;
        DB     0FFH            ;
        DB     0FFH            ;
        DB     0FFH            ;
        DB     0FFH            ;
        DB     0C0H            ;0
        DB     0F9H            ;1
        DB     0A4H            ;2
        DB     0B0H            ;3
        DB      99H            ;4
        DB      92H            ;5
        DB      82H            ;6
        DB     0F8H            ;7
        DB     080H            ;8
        DB      90H            ;9
        DB      88H            ;A
        DB      83H            ;B
        DB     0C6H            ;C
        DB     0A1H            ;D
        DB      86H            ;E
OK:     DB      8EH            ;F
        DB     0FFH            ;
        DB     0FFH            ;
        DB     0FFH            ;
        DB     0FFH            ;
        DB     0FFH            ;
;
        END


