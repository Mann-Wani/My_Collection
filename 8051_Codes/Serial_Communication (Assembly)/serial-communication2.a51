ORG 0000H 
 LJMP START 
 ORG 0030H 
START: MOV TMOD, #20H ; select timer 1 mode 2 
 MOV TH1, #0FAH  ; load count to get reqd. baud rate of 9600 
 MOV SCON, #50H  ; initialise uart in mode 2 
     ; 8 bit data and 1 stop bit 
 SETB TR1   ; start timer 
LOOP: MOV A, #'C'   ; load 1st letter ‘C’ in a 
 ACALL LOAD   ; call load subroutine 
 MOV A, #'O'   ; load 2nd letter ‘W’ in a 
 ACALL LOAD   ; call load subroutine 
 MOV A, #'E'   ; load 3rd letter ‘I’ in a 
 ACALL LOAD   ; call load subroutine 
 MOV A, #'P'   ; load 4th letter ‘T’ in a 
 ACALL LOAD   ; call load subroutine 
 
 MOV A, #'M'    
 ACALL LOAD
MOV A, #'A'    
 ACALL LOAD
MOV A, #'N'    
 ACALL LOAD
MOV A, #'N'    
 ACALL LOAD 
 SJMP LOOP   ; repeat steps 
LOAD:  MOV SBUF, A 
HERE:  JNB TI, HERE  ; Check for transmit interrupt flag 
  CLR TI   ; Clear transmit interrupt flag 
         RET 
  END 
