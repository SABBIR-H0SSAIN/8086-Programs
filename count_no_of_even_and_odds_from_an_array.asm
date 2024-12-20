; Author: Sabbir Hossain

; Count number of evens and odds from an array
; COUNT[0] -> Even Count
; COUNT[1] -> Odd Count

ORG 100h

MOV CX, 9
MOV SI, 0
MOV BX, 0
MOV DX, 0

TRAVERSE:
 MOV AL, ARRAY[SI]
 AND AL, 1
 JZ EVEN
 JNZ ODD

EVEN:
  INC BX
  JMP NEXT

ODD:
  INC DX
  JMP NEXT

NEXT:
  INC SI
  MOV COUNT[0], BL
  MOV COUNT[1], DL
  LOOP TRAVERSE 

RET

ARRAY DB 1, 2, 3, 4, 5, 6, 7, 8, 9
COUNT DB 0, 0
