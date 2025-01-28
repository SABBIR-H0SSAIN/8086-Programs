;8086 program to compress a user-inputted string by counting consecutive repeated characters and storing the results in an output buffer. 

;Example:
;   aaaazzzdddsss -> a4z3d3s3
;   ssaaabbiiir   -> s2a3b2i3r1


org 100h

printf macro msg
    mov dx, offset msg
    mov ah, 09h
    int 21h
endm

scanf macro buffer
    mov dx, offset buffer
    mov ah, 0Ah
    int 21h
endm

start:
    printf prompt
    scanf input_str
    
    mov si, offset input_str + 2
    mov di, offset output_str   
    
    call compress_string 
    
    printf result_msg
    printf output_str  
    
    mov ah, 4ch
    int 21h

compress_string proc
    compress_loop:
        mov al, [si]
        cmp al, '$'
        je done
        mov [di], al
        inc di
        mov cx, 1
    count_loop:
        inc si
        mov bl, [si]
        cmp al, bl
        jne store_count
        inc cx
        jmp count_loop
    store_count:
        add cx, '0'
        mov [di], cl
        inc di
        jmp compress_loop
    done:
        mov [di], '$'
        ret
compress_string endp

input_str  db 100 dup('$')
output_str db 100 dup('$')
prompt     db 'Enter a string: $'
result_msg db 'Compressed string: $'

end start
