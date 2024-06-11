.MODEL SMALL
.STACK 100H

.DATA
    msg DB 'Enter a number: $'
    result_armstrong DB 'Armstrong number$'
    result_not_armstrong DB 'Not an Armstrong number $'
    newline DB 0DH, 0AH, '$' ; New line characters for displaying messages

.CODE
MAIN:
    MOV AX, @DATA     
    MOV DS, AX

    
    MOV AH, 09H
    LEA DX, msg
    INT 21H

    
    MOV CX, 0          
    MOV BX, 0          
    MOV AH, 0          

READ_LOOP:
    
    MOV AH, 01H
    INT 21H

    CMP AL, 0DH        
    JE CHECK_ARMSTRONG ; If Enter key pressed, check for Armstrong number

    CMP AL, 0AH        ; Check for line feed (ignore if present)
    JE READ_LOOP

    
    SUB AL, 30H        
    MOV BL, AL         
    MOV AH, 0          

    ; Build the number
    MOV AX, BX         ; Multiply current number by 10
    MUL CX             ; Multiply by the digit count
    ADD AX, BX         ; Add the new digit
    MOV BX, AX         ; Store the updated number in BX
    INC CX             ; Increment count of digits
    JMP READ_LOOP      ; Continue reading characters

CHECK_ARMSTRONG:
    
    MOV SI, 0          ; Reset sum to zero
    MOV DX, 0          ; Clear DX for division operation
    MOV AX, BX         ; Move the entered number to AX for manipulation

CALC_ARMSTRONG:
    MOV CX, AX         ; Move current number to CX register
    MOV BX, 10         ; Set divisor to 10 for digit extraction
    DIV BX             ; Divide by 10, AX = Quotient, DX = Remainder
    MOV BL, DL         ; Move the remainder (digit) to BL
    MOV DL, 0          ; Clear DL
    MUL BL             ; Multiply the digit by itself
    ADD SI, AX         ; Add powered digit to sum

    TEST CX, CX        ; Check if quotient is zero
    JNZ CALC_ARMSTRONG ; If not zero, continue extracting digits

    CMP SI, BX         ; Compare sum with original number
    JNE NOT_ARMSTRONG   ; If not Armstrong, jump to NOT_ARMSTRONG

    
    MOV AH, 09H
    LEA DX, result_armstrong
    INT 21H
    JMP EXIT

NOT_ARMSTRONG:
    
    MOV AH, 09H
    LEA DX, result_not_armstrong
    INT 21H

EXIT:
    
    MOV AH, 09H
    LEA DX, newline
    INT 21H

    MOV AH, 4CH        ; Exit program
    INT 21H

END MAIN