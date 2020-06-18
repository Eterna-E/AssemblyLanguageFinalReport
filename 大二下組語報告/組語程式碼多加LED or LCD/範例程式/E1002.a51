
	    ORG     0000H
;
     
LOOP:   JNB     P3.7,CASE1
        JNB     P3.6,CASE2
        JNB     P3.5,CASE3
        AJMP    LOOP
;
CASE1:  MOV     P1,#00001111B
        AJMP    LOOP
CASE2:  MOV     P1,#11110000B
        AJMP    LOOP
CASE3:  MOV     P1,#11111111B
        AJMP    LOOP
;
        END







	
