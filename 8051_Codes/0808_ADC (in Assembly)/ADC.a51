

CHA    EQU P2.0
CHB    EQU P2.1
CHC    EQU P2.2
ALE    EQU P0.2
START  EQU P0.1
OE     EQU P0.0
EOC    EQU P0.4

ORG 0000H
SJMP MAIN

ORG 0030H
MAIN:
    MOV P3,#0FFH
    MOV P2,#00H
    MOV P0,#0F0H

BACK:
    SETB CHA
    CLR CHB
    CLR CHC

    SETB ALE
    NOP
    CLR ALE

    SETB START
    NOP
    CLR START

CHECK:
    JNB EOC,CHECK

    SETB OE
    NOP
    MOV A,P3
    MOV P1,A
    CLR OE

    SJMP BACK

END
