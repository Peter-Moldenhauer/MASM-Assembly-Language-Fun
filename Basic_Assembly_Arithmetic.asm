TITLE Basic_Assembly_Arithmetic(Basic_Assembly_Arithmetic.asm)

; Author: Peter Moldenhauer
; Date: 9 / 22 / 16
; Description: This program demonstrates basic arithmetic. It will solve : 8 + 4 - 2 + 3

INCLUDE Irvine32.inc

.data


.code
main PROC

     ; move integer literals into four general registers
     mov  eax, 8
     mov  ebx, 4
     mov  ecx, 2
     mov  edx, 3

     ; complete the arithmetic
     add  ebx, eax                 ; ebx now contains 12
     sub  ebx, ecx                 ; ebx now contains 10
     add  edx, ebx                 ; edx now contains 13

     ; Alternate (more efficient) way to complete same arithmetic (below). 
     ; Instead of moving multiple literals in different registers, just use one register
     mov  eax, 8
     add  eax, 4
     sub  eax, 2 
     add  eax, 3

     exit; exit to operating system
main ENDP

; (insert additional procedures here)

END main