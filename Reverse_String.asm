TITLE Reverse_String   (Reverse_String.asm)

; Author: Peter Moldenhauer
; Date: 10 / 10 / 16
; Description: This program loops through a string and pushes each character on the stack.
; It then pops the letters from the stack (in reverse order) and stores them back into the 
; same string variable. Because the stack is a LIFO (last-in, first-out) structure, the 
; letters in the string are reversed.
; Note: This program does not produce any screen output to the user 

INCLUDE Irvine32.inc

.data
aName     BYTE "Abraham Lincoln",0
nameSize = ($ - aName) - 1

.code
main PROC

     ; Push the name on the stack
          mov  ecx, nameSize
          mov  esi, 0

     L1:  movzx eax, aName[esi]         ; get character
          push eax                      ; push on stack 
          inc  esi 
          loop L1

     ; Pop the name from the stack, in reverse and store in the aName array.
          mov  ecx, nameSize
          mov  esi, 0

     L2:  pop  eax                      ; get character 
          mov  aName[esi],al            ; store in string 
          inc  esi 
          loop L2

     exit                     ; exit to operating system
main ENDP
END  main