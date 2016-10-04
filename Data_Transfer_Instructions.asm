TITLE Data_Transfer_Instructions   (Data_Transfer_Instructions.asm)

; Author: Peter Moldenhauer
; Date: 10 / 3 / 16
; Description: This program demonstrates various data transfer instructions in MASM.
; This program will include MOV, XCHG, MOVSX, and MOVDX to show how bytes, words  and
; doublewords are affected. This program will also include some direct-offset operands. 
; Note: This program does not produce any screen output 

INCLUDE Irvine32.inc

.data
val1      WORD 1000h
val2      WORD 2000h
arrayB    BYTE 10h, 20h, 30h, 40h, 50h
arrayW    WORD 100h, 200h, 300h 
arrayD    DWORD 10000h, 20000h

.code 
main PROC

; Demonstrate MOVZX instruction (move with zero-extend):
     mov       bx, 0A69Bh
     movzx     eax, bx             ; EAX = 0000A69Bh
     movzx     edx, bl             ; EDX = 0000009Bh
     movzx     cx, bl              ; CX = 009Bh 

; Demonstrate MOVSX instruction (move with sign-extend):
     mov       bx, 0A69Bh 
     movsx     eax, bx             ; EAX = FFFFA69Bh 
     movsx     edx, bl             ; EDX = FFFFFF9Bh
     mov       bl, 7Bh 
     movsx     cx, bl              ; CX = 007Bh 

; Memory to memory exchange 
     mov       ax, val1            ; AX = 1000h
     xchg      ax, val2            ; AX = 2000h, val2 = 1000h
     mov       val1, ax            ; val1 = 2000h

; Direct-offset addressing (byte array):
     mov       al, arrayB          ; AL = 10h
     mov       al, [arrayB+1]      ; AL = 20h 
     mov       al, [arrayB+2]      ; AL = 30h 

; Direct-offset addressing (word array):
     mov       ax, arrayW          ; AX = 100h
     mov       ax, [arrayW+2]      ; AX = 200h 

; Direct-offset addressing (doubleword array):
     mov       eax, arrayD         ; EAX = 10000h
     mov       eax, [arrayD+4]     ; EAX = 20000h 

     exit      ; exit to operating system 
main ENDP
END  main 