; this sample checks if string is a palindrome or not.
; palindrome is a text that can be read backwards
; and give the same meaning as if it was read forward.
; for example: "abba" is polindrome.
; note: this program is case sensitive, "abba" is not "abba".

name "pali"

org 100h

jmp start

m1:
s db 'able was ere ere saw elba'
s_size = $ - m1
  db 0Dh,0Ah,'$'

start:

; first let's print it:
mov ah, 9
mov dx, offset s
int 21h 
lea bx, s

mov si, bx

next_byte:  cmp [si], '$'
            je found_the_end
            inc si
            jmp next_byte

found_the_end:  dec si

; now bx points to beginning,
; and si points to the end of string.


; do the swapping:

do_reverse: cmp bx, si
            jae done
            
            mov al, [bx]
            mov ah, [si]
            
            mov [si], al
            mov [bx], ah
            
            inc bx
            dec si
jmp do_reverse



; reverse complete, print out:
done:       lea dx, s
            mov ah, 09h
            int 21h


lea di, s
mov si, di
add si, s_size
dec si  ; point to last char!

mov cx, s_size
cmp cx, 1
je is_palindrome  ; single char is always palindrome!

shr cx, 1     ; divide by 2!

next_char:
    mov al, [di]
    mov bl, [si]
    cmp al, bl
    jne not_palindrome
    inc di
    dec si
loop next_char


is_palindrome:  
   ;  the string is "palindrome!"
   mov ah, 9
   mov dx, offset msg1
   int 21h
jmp stop

not_palindrome:
   ;  the string is "not palindrome!"
   mov ah, 9
   mov dx, offset msg2
   int 21h  
   
   


stop:




; wait for any key press:
mov ah, 0
int 16h


ret


msg1 db "  this is palindrome!$"
msg2 db "  this is not a palindrome!$"
