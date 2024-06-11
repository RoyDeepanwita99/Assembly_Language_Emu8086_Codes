.model small

.data
    msg_armstrong db 'Armstrong number$'
    msg_not_armstrong db 'Not an Armstrong number$'
    num dw 371 ; Change this value to test different numbers

.code
    mov ax, @data
    mov ds, ax

    ; Calculate the Armstrong number
    mov bx, num

    ; Extract digits
    mov cx, 10
    div cx
    mov dl, ah  ; dl = tens place
    mov dh, al  ; dh = ones place

    ; Calculate the Armstrong number
    mov ax, dx
    mov bx, dx
    mul dx
    mov cx, ax

    ; Compare the calculated sum with the original number
    cmp num, cx

    ; Output the result
    je  is_armstrong
    jmp not_armstrong

is_armstrong:
    ; Output: The number is an Armstrong number
    mov ah, 9
    lea dx, [msg_armstrong]
    int 21h

    jmp exit_program

not_armstrong:
    ; Output: The number is not an Armstrong number
    mov ah, 9
    lea dx, [msg_not_armstrong]
    int 21h

exit_program:
    ; Exit the program
    mov ah, 4Ch
    int 21h
