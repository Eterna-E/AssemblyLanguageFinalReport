        ORG     0000H

        ORL     P1,#11111111B
        ORL     P3,#11111111B

LOOP:   JNB     P3.7,OFF
        JNB     P3.6,ON
        AJMP    LOOP

OFF:    SETB    P1.0
        AJMP    LOOP

ON:     CLR     P1.0
        AJMP    LOOP

        END

