TITLE Assembly_Division(Assembly_Division.asm)

; Author: Peter Moldenhauer
; Date: 9 / 22 / 16
; Description: This program demonstrates division, it will solve : 9 / 2
; Note that the quotient will finish in the eax register and the remainder will finish in the edx register

INCLUDE Irvine32.inc

.data


.code
main PROC

     mov  eax, 9
     cdq                 ; Remember to extend the sign of the eax register into edx before you do the division
     mov  ebx, 2
     div  ebx

     exit; exit to operating system
main ENDP

; (insert additional procedures here)

END main