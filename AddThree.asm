COMMENT !
     This program adds the contents of three integer variables 
     and then stores the sum in the fourth variable
!

TITLE AddThree   (AddThree.asm)

; Author: Peter Moldenhauer
; Date : 9/22/16
; Description: See above in block comment

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data

     firstval  DWORD     20002000h
     secondval DWORD     11111111h
     thirdval  DWORD     22222222h
     sum       DWORD     0

.code
main PROC

     mov  eax, firstval
     add  eax, secondval
     add  eax, thirdval 
     mov  sum, eax

     exit; exit to operating system
main ENDP

; (insert additional procedures here)

END main