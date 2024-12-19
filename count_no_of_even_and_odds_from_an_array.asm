;Author: Sabbir Hossain

;Count numer of even and odds from an array
;count[0] -> even count
;count[1[ -> odd count

org 100h

MOV CX,9
MOV SI,0
MOV BX,0
MOV DX,0

traverse:
 MOV Al,array[SI]
 AND Al,1
 JZ even
 JNZ odd
 even:
  INC BX
  JMP next
 odd:
  INC DX
  JMP next
 next:
  INC SI
  MOV count[0], Bl
  MOV count[1], Dl
  LOOP traverse 

ret
array DB 1,2,3,4,5,6,7,8,9
count DB 0,0 


