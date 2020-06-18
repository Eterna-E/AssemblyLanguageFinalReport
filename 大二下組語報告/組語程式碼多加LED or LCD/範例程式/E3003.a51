
        ORG     0000H
        ACALL   INIT
        ACALL   LABLE
LOOP:   ACALL   CHECK
        ACALL   CNTDSP
        AJMP    LOOP

;
INIT:   ACALL   DELAY
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#08H
        ACALL   WRINS
        MOV     A,#01H
        ACALL   WRINS
        MOV     A,#06H
        ACALL   WRINS
        MOV     A,#0CH
        ACALL   WRINS
;
        MOV     40H,#00
        MOV     41H,#00
        MOV     42H,#00
        MOV     43H,#00
        MOV     44H,#00
        MOV     45H,#00
        MOV     46H,#00
        MOV     47H,#00
;
        MOV     21H,P3
        RET
;
LABLE:  ACALL   L0101
        MOV     A,#'1'
        ACALL   WRDATA
        MOV     A,#':'
        ACALL   WRDATA
;
        ACALL   L0111
        MOV     A,#'2'
        ACALL   WRDATA
        MOV     A,#':'
        ACALL   WRDATA
;
        ACALL   L0201
        MOV     A,#'3'
        ACALL   WRDATA
        MOV     A,#':'
        ACALL   WRDATA
;
        ACALL   L0211
        MOV     A,#'4'
        ACALL   WRDATA
        MOV     A,#':'
        ACALL   WRDATA
        RET
;
CHECK:  MOV     22H,21H
        MOV     21H,P3
CHK1:   JB      21H.1,CHK2
        JNB     22H.1,CHK2
        MOV     R0,#40H
        ACALL   CNTINC
CHK2:   JB      21H.2,CHK3
        JNB     22H.2,CHK3
        MOV     R0,#42H
        ACALL   CNTINC
CHK3:   JB      21H.3,CHK4
        JNB     22H.3,CHK4
        MOV     R0,#44H
        ACALL   CNTINC
CHK4:   JB      21H.4,OK
        JNB     22H.4,OK
        MOV     R0,#46H
        ACALL   CNTINC
OK:     RET
;
CNTINC: MOV     A,#1
        ADD     A,@R0
        DA      A
        MOV     @R0,A
        INC     R0
        MOV     A,#0
        ADDC    A,@R0
        DA      A
        MOV     @R0,A

        RET
;
CNTDSP: ACALL   ASCII

        ACALL   L0103
        MOV     R0,#33H
        ACALL   DSP

        ACALL   L0113
        MOV     R0,#37H
        ACALL   DSP

        ACALL   L0203
        MOV     R0,#3BH
        ACALL   DSP

        ACALL   L0213
        MOV     R0,#3FH
        ACALL   DSP

        RET
;
ASCII:  MOV     R0,#40H
        MOV     R1,#30H
        MOV     R2,#08
LOOP1:  MOV     A,@R0
        PUSH    ACC
        ANL     A,#00001111B
        ADD     A,#30H
        MOV     @R1,A
        POP     ACC
        SWAP    A
        ANL     A,#00001111B
        ADD     A,#30H
        INC     R1
        MOV     @R1,A
        INC     R0
        INC     R1
        DJNZ    R2,LOOP1
        RET
;
DSP:    MOV     R1,#4
LOOP2:  MOV     A,@R0
        ACALL   WRDATA
        DEC     R0
        DJNZ    R1,LOOP2
        RET
;
DELAY:  MOV     R6,#100
DL:     MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL
        RET
;
L0101:  MOV     A,#10000000B
        ACALL   WRINS
        RET
;
L0103:  MOV     A,#10000010B
        ACALL   WRINS
        RET
;
L0111:  MOV     A,#10001010B
        ACALL   WRINS
        RET
;
L0113:  MOV     A,#10001100B
        ACALL   WRINS
        RET
;
L0201:  MOV     A,#11000000B
        ACALL   WRINS
        RET
;
L0203:  MOV     A,#11000010B
        ACALL   WRINS
        RET
;
L0211:  MOV     A,#11001010B
        ACALL   WRINS
        RET
;
L0213:  MOV     A,#11001100B
        ACALL   WRINS
        RET
;
WRINS:  MOV     P3,#00011111B   ;RS=0,R/W=0,E=0
        NOP
        SETB    P3.5            ;E=1
        MOV     P1,A
        NOP
        CLR     P3.5            ;E=0
        ACALL   DLY1
        RET
;
DLY1:   MOV     R6,#20
DL1:    MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL1
        RET
;
WRDATA: MOV     P3,#10011111B   ;RS=1,R/W=0,E=0
        NOP
        SETB    P3.5            ;E=1
        MOV     P1,A
        NOP
        CLR     P3.5            ;E=0
        ACALL   DLY2
        RET
;
DLY2:   MOV     R6,#80
        DJNZ    R6,$
        RET

        END
