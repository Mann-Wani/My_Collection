ORG 0000H
    LJMP START

ORG 0030H
START:
    MOV TMOD, #20H      ; Timer1 Mode2 (auto reload)
    MOV TH1, #0FAH      ; 4800 baud for 11.0592MHz crystal
    MOV SCON, #50H      ; Serial Mode1, 8-bit UART
    SETB TR1            ; Start Timer1

AGAIN:
    MOV SBUF, #'A'
BACK:
    JNB TI, BACK
    CLR TI
    SJMP AGAIN

END
