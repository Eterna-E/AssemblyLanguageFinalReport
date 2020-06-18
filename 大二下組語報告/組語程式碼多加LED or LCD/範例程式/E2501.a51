
        ORG     0000H
        ACALL   CLEAR
LOOP:   ACALL   CONV
        ACALL   KILL0
        ACALL   WAIT1
        ACALL   WAIT2
        ACALL   ADD1
        AJMP    LOOP
CLEAR:  MOV     R1,#00
        MOV     R2,#00
        MOV     R3,#00
        RET
CONV:   MOV     R0,#35H
        MOV     A,R3
        ACALL   CONV1
        MOV     A,R2
        ACALL   CONV1
        MOV     A,R1
        ACALL   CONV1
        RET
;
CONV1:  MOV     DPTR,#TABLE
        MOV     R6,A
        ANL     A,#0FH
        MOVC    A,@A+DPTR
        MOV     @R0,A
        DEC     R0
        MOV     A,R6
        SWAP    A
        ANL     A,#0FH
        MOVC    A,@A+DPTR
        MOV     @R0,A
        DEC     R0
        RET
;
TABLE:  DB     0C0H             ;0
        DB     0F9H             ;1
        DB     0A4H             ;2
        DB     0B0H             ;3
        DB      99H             ;4
        DB      92H             ;5
        DB      82H             ;6
        DB     0F8H             ;7
        DB     080H             ;8
        DB      90H             ;9
        DB      88H             ;A
        DB      83H             ;B
        DB     0C6H             ;C
        DB     0A1H             ;D
        DB      86H             ;E
        DB      8EH             ;F
;
KILL0:  MOV     R0,#31H
        MOV     R5,#04
OVER:   CJNE    @R0,#0C0H,OK
KILL:   MOV     @R0,#0FFH
        INC     R0
        DJNZ    R5,OVER
OK:     RET
;
WAIT1:  ACALL   SCAN1
        JNB     P3.7,WAIT1
        RET
;
WAIT2:  ACALL   SCAN1
        JB      P3.7,WAIT2
        RET
;
ADD1:   MOV     A,#01
        ADD     A,R3
        DA      A
        MOV     R3,A
        MOV     A,#00
        ADDC    A,R2
        DA      A
        MOV     R2,A
        MOV     A,#00
        ADDC    A,R1
        DA      A
        MOV     R1,A
        RET
;
SCAN1:  MOV     R5,#11101111B
        MOV     R4,#05
        MOV     R0,#31H
LOOP1:  MOV     P1,@R0
        INC     R0
        MOV     P3,R5
        ACALL   DELAY
        ORL     P3,#11111111B
        MOV     A,R5
        RR      A
        MOV     R5,A
        DJNZ    R4,LOOP1
        RET
;
DELAY:  MOV     R6,#5
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        RET
;
        END


