;8086 Program to sort an array using bubble sort algorithm

org 100h

    lea si, array
    mov cx, n
    call bubble_sort
    ret

bubble_sort proc
    dec cx
loop_i:
    mov ah, cl
    lea si, array
loop_j:
    mov al, [si]
    mov bl, [si+1]
    cmp al, bl
    jc noswap
    mov dl, bl
    mov bl, al
    mov [si+1], bl
    mov al, dl
    mov [si], al
noswap:
    inc si
    dec ah
    jnz loop_j
    loop loop_i
    ret
bubble_sort endp

array db 10,0,8,4,3
n equ ($-array)
