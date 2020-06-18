
        ORG     0000H
        ORL     P1,#11111111B
START:  ACALL   ATOD
        CLR     C
        SUBB    A,#133
        JNC     ON
        AJMP    START
ON:     CLR     P1.5
LOOP:   ACALL   ATOD
        CLR     C
        SUBB    A,#122
        JC      OFF
        AJMP    LOOP
OFF:    SETB    P1.5
        AJMP    START
;
ATOD:   CLR     P1.7
        SETB    P1.7
;
WAIT:   JB      P1.6,WAIT
;
READ:   MOV     A,P3
        RET
;
        END

