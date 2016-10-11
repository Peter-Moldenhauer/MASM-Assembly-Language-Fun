TITLE Random_Number_Generator   (Random_Number_Generator.asm)

; Author: Peter Moldenhauer
; Date: 10 / 11 / 16
; Description: This program demonstrates random number gerneration capabilities 
; of the link library. It randomly generates 10 unsigned integers in the range 
; of 0 to 4,294,967,294. Then, it generates 10 signed integers in the range of 
; -50 to +49.

INCLUDE Irvine32.inc

TAB = 9                                 ; ASCII code for Tab

.code
main PROC

     call Randomize                     ; init random generator
     call Rand1
     call Rand2 
     exit                               ; exit to operating system
main ENDP

Rand1 PROC
; Generate ten pseudo-random integers
     mov  ecx, 10                       ; loop 10 times

L1:  call Random32                      ; generate random int
     call WriteDec                      ; write in unsigned decimal
     mov  al, TAB                       ; horizontal tab 
     call WriteChar                     ; write the tab 
     loop L1

     call Crlf
     ret
Rand1 ENDP

Rand2 PROC
; Generate ten pseudo-random integers from -50 to +49
     mov  ecx,10                        ; loop 10 times

     L1:  mov  eax, 100                      ; values 0-99
     call RandomRange                        ; generate random int 
     sub  eax, 50                            ; values -50 to +49
     call WriteInt                           ; write signed decimal
     mov  al, TAB                            ; horizontal tab
     call WriteChar                          ; write the tab 
     loop L1 

     call Crlf 
     ret
Rand2 ENDP 

END  main