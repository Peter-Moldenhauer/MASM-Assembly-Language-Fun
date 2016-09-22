TITLE MASM Template

INCLUDE Irvine32.inc

.data
myHeaderInfo BYTE "Peter Moldenhauer - First MASM Program", 0dh, 0ah, 0

.code
main PROC

     ; Print out header info(from above)
     mov edx, OFFSET myHeaderInfo
     call WriteString

     ; Print out the decimal number in eax register
     mov eax, 123
     call WriteDec

     ; Print out all the registers
     ; Note that 123 will be in register eax but will be in hexadecimal form
     call dumpregs

     exit

main ENDP
END main 