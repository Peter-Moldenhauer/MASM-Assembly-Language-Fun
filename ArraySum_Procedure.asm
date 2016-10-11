TITLE ArraySum_Procedure   (ArraySum_Procedure.asm)

; Author: Peter Moldenhauer
; Date: 10 / 11 / 16
; Description: This program tests the ArraySum procedure by calling 
; it and passing the offset and length of an array of 32-bit integers.
; After calling ArraySum, it saves teh procedure's return value in a
; variable named theSum.
; Note: This program does not produce any screen output to the user 

INCLUDE Irvine32.inc

.data
array     DWORD     10000h,20000h,30000h,40000h,50000h
theSum    DWORD     ?

.code
main PROC

     mov  esi, OFFSET array             ; ESI points to array
     mov  ecx, LENGTHOF array           ; ECX = array count
     call ArraySum                      ; call the procedure below to calculate the sum
     mov  theSum, eax                   ; returned in EAX 

     exit                     ; exit to operating system
main ENDP

;---------------------------------------------------------------
; ArraySum
; Calculates the sum of an array of 32-bit integers.
; Receives: ESI = the array offset
; ECX = number of elements in the array
; Returns: EAX = sum of the array elements 
;----------------------------------------------------------------

ArraySum  PROC
     push esi                           ; save ESI, ECX
     push ecx
     mov  eax, 0                        ; set the sum to zero
L1:
     add  eax, [esi]                    ; add each integer to sum
     add  esi, TYPE DWORD               ; point to next integer
     loop L1                            ; repeat for array size

     pop  ecx                           ; restore ECX, ESI
     pop  esi                           
     ret                                ; return sum which is in EAX 
ArraySum  ENDP 

END  main