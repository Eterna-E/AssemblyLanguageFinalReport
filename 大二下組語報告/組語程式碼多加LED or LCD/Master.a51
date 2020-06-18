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
;=======================================
;=======================================
		MOV		B,P0
        	ACALL   INIT

        	ACALL   LINE1
        	MOV     DPTR,#TAB1
        	ACALL   DISPLAY
		MOV		P0,B
;=======================================

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
;=======================================
;=======================================
		MOV		B,P0
        	ACALL   INIT

        	ACALL   LINE1
        	MOV     DPTR,#TAB2
        	ACALL   DISPLAY
		MOV		P0,B
;=======================================
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
;
INIT:   ACALL   DELAY1

        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS

        MOV     A,#08H
        ACALL   WRINS

        MOV     A,#01H
        ACALL   WRINS

        MOV     A,#06H
        ACALL   WRINS

        MOV     A,#0CH
        ACALL   WRINS
        RET
;
DISPLAY:	MOV     R7,#00H
NEXT:   MOV     A,R7
        MOVC    A,@A+DPTR
        CJNE    A,#10H,DSP
        RET
DSP:    ACALL   WRDATA
        INC     R7
        AJMP    NEXT

LINE1:  MOV     A,#10000000B
        ACALL   WRINS
        RET

LINE2:  MOV     A,#11000000B
        ACALL   WRINS
        RET

WRINS:  MOV     P1,#00111111B   ;RS=0,E=0,R/W=0(R/W 板子上預設為零);P1.7 E，P1.6 RS
        NOP
        SETB    P1.7            ;E=1
        MOV     P0,A		  ;把指令碼送至LCD模組的DB7~DB0
        NOP
        CLR     P1.7            ;E=0
        ACALL   DLY1
        RET

WRDATA: MOV     P1,#01111111B   ;RS=1,R/W=0,E=0
        NOP
        SETB    P1.7            ;E=1
        MOV     P0,A		  ;把指令碼送至LCD模組的DB7~DB0
        NOP
        CLR     P1.7            ;E=0
        ACALL   DLY2
        RET
;
DELAY1:  MOV     R6,#100
DL:     MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL
        RET
;
DLY1:   MOV     R6,#20
DL4:    MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL4
        RET
;
DLY2:   MOV     R6,#80
        DJNZ    R6,$
        RET
;now control machine 01
TAB1:	  ;DB      'Cont'
	  ;DB      'rol '
	  DB      'Mach'
	  DB      'ine '
	  DB      '01  '
        DB      10H
TAB2:   DB      'Mach'
	  DB      'ine '
	  DB      '02  '
        DB      10H
;
        	END


