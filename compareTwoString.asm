;Comparing Two Strings
include 'emu8086.inc'
.model small
.stack 100h
.data
 string1 db 'Assembly', 0
 string2 db 'assembly', 0
.code
main proc
 ; Compare strings
 mov si, offset string1
 mov di, offset string2
compare_strings:
 mov al, [si]
 mov bl, [di]
 cmp al, bl
 jne not_equal
 cmp al, 0
 je equal
 inc si
 inc di
 jmp compare_strings
not_equal:
 ; Display result for not equal
 print 'Not Equal'
 jmp end_program
equal:
 ; Display result for equal
 print 'Equal'
end_program:
main endp
end main
