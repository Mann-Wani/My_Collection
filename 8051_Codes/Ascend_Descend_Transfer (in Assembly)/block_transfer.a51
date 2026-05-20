ORG 0000H

    MOV R0, #30H      ; Pointer to Array 1
    MOV R1, #4BH      ; Pointer to Array 2
    MOV R2, #03H       ; Number of bytes to exchange

EXCHANGE:
    MOV A, @R0        ; Read element from Array 1
    XCH A, @R1        ; Exchange with Array 2 element
    MOV @R0, A        ; Store back to Array 1

    INC R0            ; Next locations
    INC R1
    DJNZ R2, EXCHANGE

HERE: SJMP HERE       ; Stop

END
