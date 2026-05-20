ORG 0000H

; LCD CONTROL PINS
RS EQU P0.0
RW EQU P0.1
EN EQU P0.2

;--------------------------------
; START
;--------------------------------
START:
    MOV P1, #00H       ; LCD data
    MOV P2, #0FFH      ; Rows
    MOV P3, #0FFH      ; Columns

    ACALL LCD_INIT

MAIN:
    ACALL KEYPAD_SCAN
    MOV A, R0
    ACALL LCD_DATA
    ACALL DELAY_LONG
    SJMP MAIN

;--------------------------------
; LCD INIT
;--------------------------------
LCD_INIT:
    MOV A, #38H
    ACALL LCD_CMD

    MOV A, #0CH
    ACALL LCD_CMD

    MOV A, #01H
    ACALL LCD_CMD

    MOV A, #06H
    ACALL LCD_CMD
    RET

;--------------------------------
LCD_CMD:
    MOV P1, A
    CLR RS
    CLR RW
    SETB EN
    ACALL DELAY
    CLR EN
    RET

;--------------------------------
LCD_DATA:
    MOV P1, A
    SETB RS
    CLR RW
    SETB EN
    ACALL DELAY
    CLR EN
    RET

;--------------------------------
DELAY:
    MOV R7, #100
D1: DJNZ R7, D1
    RET

;--------------------------------
DELAY_LONG:
    MOV R6, #200
L1: MOV R7, #255
L2: DJNZ R7, L2
    DJNZ R6, L1
    RET

;--------------------------------
; KEYPAD SCAN
;--------------------------------
KEYPAD_SCAN:

WAIT_KEY:
    MOV P3, #0FFH
    MOV A, P3
    ANL A, #0FH
    CJNE A, #0FH, SCAN
    SJMP WAIT_KEY

SCAN:

; -------- ROW 0 --------
    MOV P2, #0FEH
    ACALL CHECK_COL
    JNZ FOUND

; -------- ROW 1 --------
    MOV P2, #0FDH
    ACALL CHECK_COL
    JNZ FOUND

; -------- ROW 2 --------
    MOV P2, #0FBH
    ACALL CHECK_COL
    JNZ FOUND

; -------- ROW 3 --------
    MOV P2, #0F7H
    ACALL CHECK_COL
    JNZ FOUND

    SJMP WAIT_KEY

FOUND:
    RET

;--------------------------------
; COLUMN CHECK + FULL HEX MAP
;--------------------------------
CHECK_COL:
    MOV A, P3
    ANL A, #0FH

; Column 0
    CJNE A, #0EH, COL1
    ACALL MAP_COL0
    SETB ACC.0
    RET

COL1:
    CJNE A, #0DH, COL2
    ACALL MAP_COL1
    SETB ACC.0
    RET

COL2:
    CJNE A, #0BH, COL3
    ACALL MAP_COL2
    SETB ACC.0
    RET

COL3:
    CJNE A, #07H, NO_KEY
    ACALL MAP_COL3
    SETB ACC.0
    RET

NO_KEY:
    CLR A
    RET

;--------------------------------
; COLUMN 0 (0,4,8,C)
;--------------------------------
MAP_COL0:
    JNB P2.0, R0_0
    JNB P2.1, R1_0
    JNB P2.2, R2_0
    JNB P2.3, R3_0

R0_0: MOV R0, #'0'  ; row0 col0
      RET
R1_0: MOV R0, #'4'
      RET
R2_0: MOV R0, #'8'
      RET
R3_0: MOV R0, #'C'
      RET

;--------------------------------
; COLUMN 1 (1,5,9,D)
;--------------------------------
MAP_COL1:
    JNB P2.0, R0_1
    JNB P2.1, R1_1
    JNB P2.2, R2_1
    JNB P2.3, R3_1

R0_1: MOV R0, #'1'
      RET
R1_1: MOV R0, #'5'
      RET
R2_1: MOV R0, #'9'
      RET
R3_1: MOV R0, #'D'
      RET

;--------------------------------
; COLUMN 2 (2,6,A,E)
;--------------------------------
MAP_COL2:
    JNB P2.0, R0_2
    JNB P2.1, R1_2
    JNB P2.2, R2_2
    JNB P2.3, R3_2

R0_2: MOV R0, #'2'
      RET
R1_2: MOV R0, #'6'
      RET
R2_2: MOV R0, #'A'
      RET
R3_2: MOV R0, #'E'
      RET

;--------------------------------
; COLUMN 3 (3,7,B,F)
;--------------------------------
MAP_COL3:
    JNB P2.0, R0_3
    JNB P2.1, R1_3
    JNB P2.2, R2_3
    JNB P2.3, R3_3

R0_3: MOV R0, #'3'
      RET
R1_3: MOV R0, #'7'
      RET
R2_3: MOV R0, #'B'
      RET
R3_3: MOV R0, #'F'
      RET

END