TITLE Copy_A_String  (Copy_A_String.asm)

; Author: Peter Moldenhauer
; Date: 10 / 4 / 16
; Description: This program uses a loop to copy a string. The string is represented as an array 
; of bytes with a null terminator value. It uses indexed addressing because the same index register 
; references both strings. 
; Note: the target string must have enough available space to receive the copied characters, including the null byte at the end
; Note: the MOV instruction cannot have two memory operands, so each character is moved from the source string to AL, then from AL to the target string

INCLUDE Irvine32.inc

.data
source    BYTE "This is the source string",0
target    BYTE SIZEOF source DUP(0)

.code
main PROC

     mov  esi, 0                   ; index register
     mov  ecx, SIZEOF source       ; loop counter
L1:
     mov  al, source[esi]          ; get a character from source
     mov  target[esi], al          ; store it in the target
     inc  esi                      ; move to next character 
     loop L1

     exit; exit to operating system
main ENDP
END  main