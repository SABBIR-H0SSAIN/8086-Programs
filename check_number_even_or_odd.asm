;Author: Sabbir Hossain           

org 100h

 mov ax,101
 and ax,1
 jz even
 jnz odd
 even:
  mov dx,0h
  ret
 odd:
  mov dx,1h

ret

;even -> dx=0
;odd  -> dx=1

