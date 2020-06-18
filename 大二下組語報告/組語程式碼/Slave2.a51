		ORG     0000H
;
        	MOV     TMOD,#00100000B 
        	MOV     TH1,#232        
        	MOV     TL1,#232        
        	SETB    TR1             
;
		MOV     SCON,#11010000B 
LOOP:   
		SETB    SM2             
        	CLR     RI              
        	JNB     RI,$            
        	MOV     A,SBUF          
        	CJNE    A,#02,LOOP      

        	CLR     SM2             
        	CLR     RI              
        	JNB     RI,$            
        	MOV     A,SBUF          
        	JNB     ACC.0,LED1        
        	JNB     ACC.1,LED2       
        	JNB     ACC.2,LED3        
        	JNB     ACC.3,LED4       
;        JNB     ACC.4,ON3        
;        JNB     ACC.5,OFF3       
;        JNB     ACC.6,ON4        
;        JNB     ACC.7,OFF4       
        	AJMP    LOOP
;

;
LED1:   	MOV		A,P0
	  	XRL		A,#00000001B
	  	MOV		P0,A
        	CLR     	TI              
        	MOV     	SBUF,P0         
        	JNB     	TI,$            
        	AJMP    	LOOP
;
LED2:   	MOV		A,P0
	  	XRL		A,#00000010B
	  	MOV		P0,A
        	CLR     	TI              
        	MOV     	SBUF,P0         
        	JNB     	TI,$            
        	AJMP    	LOOP
;
LED3:   	MOV		A,P0
	  	XRL		A,#00000100B
	  	MOV		P0,A
        	CLR     	TI              
        	MOV     	SBUF,P0         
        	JNB     	TI,$            
        	AJMP    	LOOP
;
LED4:   	MOV		A,P0
   		XRL	 	A,#00001000B
	  	MOV		P0,A
        	CLR     	TI              
        	MOV     	SBUF,P0         
        	JNB     	TI,$            
        	AJMP    	LOOP
;
        	END
