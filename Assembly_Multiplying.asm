TITLE Assembly_Multiplying    (Assembly_Multiplying.asm)

; Author: Peter Moldenhauer
; Date: 9 / 22 / 16
; Description: This program demonstrates multiplication, it will solve: 8 * 4

INCLUDE Irvine32.inc

.data


.code
main PROC

     ; solve 8 * 4
     mov  eax, 8
     mov  ebx, 4
     mul  ebx       ; the mul instruction requires just ONE argument - eax is always the 1st arument with mul - it is implied!

     ; NOTE: if there is overflow in eax, it will go into the edx register
     ; If there was previously a value in edx, it will get cleared out when mul is used to make space for overflow of mul

     exit; exit to operating system
main ENDP

; (insert additional procedures here)

END main