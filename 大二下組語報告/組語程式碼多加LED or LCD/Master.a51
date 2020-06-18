		ORG		0000H
		AJMP    	MAIN
;
MAIN:   	MOV     	TMOD,#00100000B 
        	MOV     	TH1,#232        
        	MOV     	TL1,#232        
        	SETB    	TR1             
;
        	MOV     	SCON,#11010000B 
	  	SETB		ES
	  	SETB		EA
	  	CLR 		TI
	  	MOV		SBUF,#11111111B
;
LOOP:   	MOV	    	P1,#11111110B
		JNB     	P2.0,CASE1      
		JNB     	P2.1,CASE1      
		JNB     	P2.2,CASE1      
		JNB     	P2.3,CASE1      
	 	MOV	    	P1,#11111101B
	 	JNB     	P2.0,CASE2      
		JNB     	P2.1,CASE2      
		JNB     	P2.2,CASE2      
		JNB     	P2.3,CASE2      
	 	AJMP    	LOOP
;
CASE1:  	SETB    	TB8             
        	CLR     	TI              
        	MOV     	SBUF,#01        
        	JNB     	TI,$            
        	CALL    	DELAY           

        	CLR     	TB8             
        	CLR     	TI              
        	MOV     	SBUF,P2         
        	JNB     	TI,$            

        	CLR     	RI              
        	CALL    	DELAY           
        	MOV     	A,SBUF          
;
		MOV		C,ACC.0
		MOV		P0.0,C
		MOV		C,ACC.1
		MOV		P0.1,C
		MOV		C,ACC.2
		MOV		P0.2,C
		MOV		C,ACC.3
		MOV		P0.3,C
;        	MOV	   	P0,A
        	CALL    	WAIT            
        	AJMP    	LOOP
;

CASE2:  	MOV		P0,#11111111B
	  	SETB    	TB8             
        	CLR     	TI              
        	MOV     	SBUF,#02        
        	JNB     	TI,$            
        	CALL    	DELAY           

        	CLR     	TB8             
        	CLR     	TI              
        	MOV     	SBUF,P2        
        	JNB     	TI,$            

        	CLR     	RI              
        	CALL    	DELAY           
        MOV     A,SBUF          
		MOV		C,ACC.0
		MOV		P0.4,C
		MOV		C,ACC.1
		MOV		P0.5,C
		MOV		C,ACC.2
		MOV		P0.6,C
		MOV		C,ACC.3
		MOV		P0.7,C
;        MOV     C,ACC.2         
;        MOV     P0.2,C          
;	  MOV     C,ACC.3         
;        MOV     P0.3,C
;	  RL	A
;	  RL	A
;	  RL	A
;	  RL	A         
	  	;MOV		P0,SBUF
        	CALL    	WAIT            
        	AJMP    	LOOP
;
;
WAIT:   	CALL    	DELAY
        	MOV     	A,P2
        	CJNE    	A,#11111111B,WAIT
        	RET
;
DELAY:  	MOV     	R6,#25
DL1:    	MOV     	R7,#200
DL2:    	DJNZ    	R7,DL2
        	DJNZ    	R6,DL1
        	RET
;
        	END


