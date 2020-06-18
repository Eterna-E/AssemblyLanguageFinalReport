        ORG     0000H

OFF:    ORL     P1,#11111111B
        ORL     P3,#11111111B

LOOP:   JNB     P3.5,OFF
        JNB     P3.6,REV
        JNB     P3.7,FOR
        AJMP    LOOP

REV:    CLR     P1.1
        JB      P3.5,$
        AJMP    OFF

FOR:    CLR     P1.0
        JB      P3.5,$
        AJMP    OFF

        END


