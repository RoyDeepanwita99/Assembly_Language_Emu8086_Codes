.model small
.data
    message db 'CSE department$'  ; Null-terminated string

.code
main:
    mov ax, @data     ; Initialize the data segment
    mov ds, ax

    lea si, message   ; Load the address of the message into si register

print_loop:
    mov al, [si]      ; Load the current character into al register
    cmp al, '$'       ; Check if it is the end of the string
    je  end_program   ; If yes, exit the loop

    ; Your code to display or process the character goes here
    ; For simplicity, let's assume printing the character
    ; Replace the following line with the appropriate code for your system
    ; (e.g., interrupt 0x10 for BIOS console output)

    ; Example: Print the character using interrupt 0x10
    mov ah, 0x0E       ; BIOS teletype function
    mov bh, 0          ; Page number
    mov bl, 0x07       ; Text attribute (color)
    int 0x10           ; Call interrupt

    ; Print a space between characters
    mov ah, 02h        ; Function to display a character
    mov dl, ' '        ; Space character
    int 21h            ; Call interrupt 21h to display the character

    inc si            ; Move to the next character in the string
    jmp print_loop     ; Jump back to the beginning of the loop

end_program:
    ; Your cleanup code or program termination goes here

    ; For DOS, you can use the following to terminate the program
    mov ah, 4Ch       ; Function to terminate program
    int 21h           ;
