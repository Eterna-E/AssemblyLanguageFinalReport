
        ORG     0000H
        MOV     R3,#00H
LOOP:   MOV     DPTR,#TABLE
        MOV     A,R3
        MOVC    A,@A+DPTR
        MOV     P1,A
        ACALL   D1S
        MOV     A,R3
        ADD     A,#1
        DA      A
        ANL     A,#0FH
        MOV     R3,A
        AJMP    LOOP
;
D1S:    MOV     R5,#10
DL0:    MOV     R6,#250
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        DJNZ    R5,DL0
        RET
;
TABLE:  DB      11000000B       ; 0
        DB      11111001B       ; 1
        DB      10100100B       ; 2
        DB      10110000B       ; 3
        DB      10011001B       ; 4
        DB      10010010B       ; 5
        DB      10000010B       ; 6
        DB      11111000B       ; 7
        DB      10000000B       ; 8
        DB      10010000B       ; 9
;
        END
