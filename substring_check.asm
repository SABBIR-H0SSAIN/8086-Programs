;info[0] -> count of total appearance of substring in the array
;info[1] -> first index of the substring

org 100h

start:
    cld
    mov dx, 0FF00h
    mov cx, len1
    sub cx, len2
    inc cx
    mov bx, 0

search_loop:
    lea si, [str1 + bx]
    lea di, [str2]
    push cx
    mov cx, len2
    repe cmpsb
    pop cx
    jne no_match
    
    inc dl
    cmp dh, 0FFh
    jne skip_index
    mov dh, bl

skip_index:
    add bx, len2
    jmp continue_search

no_match:
    inc bx

continue_search:
    loop search_loop

    mov [info], dl
    mov [info+1], dh
    ret

str1 db 'bsccse kuetcse'
len1 equ ($-str1)

str2 db 'etc'
len2 equ ($-str2)

info db 0, 0
