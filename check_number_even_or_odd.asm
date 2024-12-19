; Author: Sabbir Hossain           

; Even -> DX = 0
; Odd  -> DX = 1

ORG 100h

MOV AX, 123h
AND AX, 1
JZ EVEN
JNZ ODD

EVEN:
  MOV DX, 0h
  RET

ODD:
  MOV DX, 1h
  RET
