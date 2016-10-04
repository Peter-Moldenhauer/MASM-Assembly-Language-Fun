TITLE Sum_Integer_Array  (Sum_Integer_Array.asm)

; Author: Peter Moldenhauer
; Date: 10 / 3 / 16
; Description: This program sums an array of 16-bit integers. Follow the below steps to calculate the sum of array:
; 1 - Assign the arrays address to a register that will serve as an indexed operand
; 2 - Initialize the loop counter to the length of the array
; 3 - Assign zero to the register that accumulates the sum
; 4 - Create a label to mark the beginning of the loop
; 5 - In the loop body, add a single array element to the sum
; 6 - Point to the next array element
; 7 - Use a LOOP instruction to repeat the loop 

INCLUDE Irvine32.inc

.data
intarray  DWORD 10000h, 20000h, 30000h, 40000h

.code
main PROC

     mov  edi, OFFSET intarray     ; 1 - EDI = address of intarray
     mov  ecx, LENGTHOF intarray   ; 2 - initialize loop counter
     mov  eax, 0                   ; 3 - sum = 0
L1:                                ; 4 - mark beginning of loop
     add  eax, [edi]               ; 5 - add an integer 
     add  edi, TYPE intarray       ; 6 - point to next element 
     loop L1                       ; 7 - repeat until ECX = 0
     
     exit                          ; exit to operating system
main ENDP
END  main