; Author: Sabbir Hossain

; Compare two numbers
; 1st < 2nd -> DX = 1h
; 1st > 2nd -> DX = 2h
; 1st = 2nd -> DX = 3h

ORG 100h

MOV AX, 10h
MOV BX, 30h
MOV DX, 0h
CMP AX, BX
JZ EQUAL
JC SMALLER
JNC GREATER

EQUAL:
  MOV DX, 03h
  RET

SMALLER:
  MOV DX, 01h
  RET

GREATER:
  MOV DX, 02h
  RET
