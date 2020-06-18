
        ORG     0000H
;
START:  CLR     P1.7
        SETB    P1.7
;
WAIT:   JB      P1.6,WAIT
;
READ:   MOV     A,P3
        MOV     B,A
;
        CLR     C
        SUBB    A,#153
        JNC     LARGE
;
        MOV     A,B
        CLR     C
        SUBB    A,#102
        JNC     MIDDLE
;
SMALL:  MOV     P1,#11110111B
        AJMP    START
;
MIDDLE: MOV     P1,#11101111B
        AJMP    START
;
LARGE:  MOV     P1,#11011111B
        AJMP    START
;
        END

