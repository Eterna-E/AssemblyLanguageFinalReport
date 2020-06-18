        ORG     0000H
;
LOOP:   MOV     P3,#01111111B
        JNB     P3.3,KEY0
        JNB     P3.2,KEY1
        JNB     P3.1,KEY2
        JNB     P3.0,KEY3
;
        MOV     P3,#10111111B
        JNB     P3.3,KEY4
        JNB     P3.2,KEY5
        JNB     P3.1,KEY6
        JNB     P3.0,KEY7
;
        MOV     P3,#11011111B
        JNB     P3.3,KEY8
        JNB     P3.2,KEY9
        JNB     P3.1,KEYA
        JNB     P3.0,KEYB
;
        MOV     P3,#11101111B
        JNB     P3.3,KEYC
        JNB     P3.2,KEYD
        JNB     P3.1,KEYE
        JNB     P3.0,KEYF
        AJMP    LOOP

;
KEY0:   MOV     P1,#11111111B
        AJMP    LOOP
KEY1:   MOV     P1,#11111110B
        AJMP    LOOP
KEY2:   MOV     P1,#11111101B
        AJMP    LOOP
KEY3:   MOV     P1,#11111100B
        AJMP    LOOP
KEY4:   MOV     P1,#11111011B
        AJMP    LOOP
KEY5:   MOV     P1,#11111010B
        AJMP    LOOP
KEY6:   MOV     P1,#11111001B
        AJMP    LOOP
KEY7:   MOV     P1,#11111000B
        AJMP    LOOP
KEY8:   MOV     P1,#11110111B
        AJMP    LOOP
KEY9:   MOV     P1,#11110110B
        AJMP    LOOP
KEYA:   MOV     P1,#11110101B
        AJMP    LOOP
KEYB:   MOV     P1,#11110100B
        AJMP    LOOP
KEYC:   MOV     P1,#11110011B
        AJMP    LOOP
KEYD:   MOV     P1,#11110010B
        AJMP    LOOP
KEYE:   MOV     P1,#11110001B
        AJMP    LOOP
KEYF:   MOV     P1,#11110000B
        AJMP    LOOP
;
        END






        






	
