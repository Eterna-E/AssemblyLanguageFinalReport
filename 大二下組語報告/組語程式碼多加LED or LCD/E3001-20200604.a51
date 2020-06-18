        ORG     0000H
        ACALL   INIT

        ACALL   LINE1
        MOV     DPTR,#TAB1
        ACALL   DISPLAY

	  ACALL	DELAY
	  ACALL	DELAY
	  ACALL	DELAY
	  ACALL	DELAY
	  ACALL	DELAY
	  ACALL	DELAY
	  ACALL	DELAY
	  ACALL	DELAY
        ACALL   LINE1
        MOV     DPTR,#TAB2
        ACALL   DISPLAY

OK:     AJMP    OK

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
        RET
;
DISPLAY:	MOV     R7,#00H
NEXT:   MOV     A,R7
        MOVC    A,@A+DPTR
        CJNE    A,#10H,DSP
        RET
DSP:    ACALL   WRDATA
        INC     R7
        AJMP    NEXT

LINE1:  MOV     A,#10000000B
        ACALL   WRINS
        RET

LINE2:  MOV     A,#11000000B
        ACALL   WRINS
        RET

WRINS:  MOV     P1,#00111111B   ;RS=0,E=0,R/W=0(R/W 板子上預設為零);P1.7 E，P1.6 RS
        NOP
        SETB    P1.7            ;E=1
        MOV     P0,A		  ;把指令碼送至LCD模組的DB7~DB0
        NOP
        CLR     P1.7            ;E=0
        ACALL   DLY1
        RET

WRDATA: MOV     P1,#01111111B   ;RS=1,R/W=0,E=0
        NOP
        SETB    P1.7            ;E=1
        MOV     P0,A		  ;把指令碼送至LCD模組的DB7~DB0
        NOP
        CLR     P1.7            ;E=0
        ACALL   DLY2
        RET
;
DELAY:  MOV     R6,#100
DL:     MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL
        RET
;
DLY1:   MOV     R6,#20
DL1:    MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL1
        RET
;
DLY2:   MOV     R6,#80
        DJNZ    R6,$
        RET
;now control machine 01
TAB1:	  ;DB      'Cont'
	  ;DB      'rol '
	  DB      'Mach'
	  DB      'ine '
	  DB      '01  '
        DB      10H
TAB2:   DB      'I am'
        DB      ' a '
        DB      'LCD.'
        DB      10H

        END
