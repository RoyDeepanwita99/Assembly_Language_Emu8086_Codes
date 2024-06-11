  .STACK 100H
.MODEL SMALL
.DATA
string db 'roy'
.CODE

MAIN PROC 
    mov ax,@data
    mov ds,ax
    
    mov si, offset string
    
    mov cx,10
    
    loop1: 
        mov bx,[si]
        push bx
        inc si
        loop loop1
        
    mov cx,10
    
    loop2:    
        pop dx
        mov ah ,02h
        int 21h
        loop loop2
     
         
    
    

    
    MAIN ENDP

END MAIN


