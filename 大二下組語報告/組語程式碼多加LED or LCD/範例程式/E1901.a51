
        ORG     0000H
OFF:    ORL     P1,#11111111B
        ORL     P3,#11111111B
TEST1:  JNB     P3.7,OPEN
        JNB     P3.6,CLOSE
        AJMP    TEST1
OPEN:   JNB     P3.4,OFF
        JNB     P3.5,OFF
        CLR     P1.0
TEST2:  JNB     P3.4,OFF
        JNB     P3.5,OFF
        AJMP    TEST2
CLOSE:  JNB     P3.3,OFF
        JNB     P3.5,OFF
        CLR     P1.1
TEST3:  JNB     P3.3,OFF
        JNB     P3.5,OFF
        AJMP    TEST3
;
        END




