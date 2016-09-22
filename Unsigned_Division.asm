TITLE Divider Program     (Unsigned_Division.asm)

; Author: Peter Moldenhauer
; Course / Project ID : Divider Program                 Date: 9/20/16
; Description: This program demonstrates how to perform unsigned integer division in assembly

INCLUDE Irvine32.inc

; (insert constant definitions here if any)

.data

; variable definitions below
     myMessage BYTE      "Welcome to the DIV instruction tutorial!", 0dh,0ah,0
     number_1  DWORD     120
     number_2  DWORD     7 
     quotient  DWORD     ?
     remainder DWORD     ?

.code
main PROC

; executable instructions below
     call Clrscr 

     mov  edx, OFFSET    myMessage
     call WriteString    

     ; print the divisor 
     mov  eax, number_2
     cdq                      ; cdq means convert doubleword to quadword
     call WriteDec
     call Crlf 

     ; print the dividend 
     mov  eax, number_1
     call WriteDec 
     call Crlf

     ; perform the division 
     mov  ebx, number_2
     div  ebx
     mov  quotient, eax
     mov  remainder,     edx

     ; print the quotient
     call WriteDec
     call Crlf 
     mov  eax, remainder 

     ; print the remainder
     call WriteDec 
     call Crlf

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
