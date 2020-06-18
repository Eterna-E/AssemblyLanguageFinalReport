        ORG     0000H
        AJMP    MAIN		
;
        ORG     0003H		
        PUSH    P1		
        PUSH    06		
        PUSH    07		
        MOV     R5,#10
ALARM:  MOV     P1,#11111111B
        ACALL   DELAY
        MOV     P1,#11111110B
        ACALL   DELAY
        DJNZ    R5,ALARM
        POP     07		
        POP     06		
        POP     P1		
        RETI			

; 
MAIN:   SETB    P3.2		
        SETB    IT0		
        SETB    EX0		
        SETB    EA		
LOOP:   MOV     P1,#00001111B
        ACALL   DELAY
        MOV     P1,#11110001B
        ACALL   DELAY
        AJMP    LOOP
; 
DELAY:  MOV     R6,#250
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        RET
;
        END
