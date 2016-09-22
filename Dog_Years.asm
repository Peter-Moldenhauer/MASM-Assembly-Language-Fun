TITLE Dog Years(Project00.asm)

; Author: Peter Moldenhauer
; Course / Project ID : Demo#0                Date: 10 / 04 / 16
; Description: This program will introduce the programmer, get the user's name and age,
;    calculate the user's "dog age", and report the result.

INCLUDE Irvine32.inc

; Constant definitions below
DOG_FACTOR = 7

.data

; Variable definitions below(variables and strings that we need)
userName  BYTE      33 DUP(0); string to be entered by user
userAge   DWORD ? ; integer to be entered by user
intro_1   BYTE      "Hello, my name is Peter, and I'm here to tell you your age in dog years. ", 0
prompt_1  BYTE      "What is your name? ", 0
intro_2   BYTE      "Nice to meet you, ", 0
prompt_2  BYTE      "How old are you? ", 0
dogAge    DWORD ?
result_1  BYTE      "Wow...that's ", 0
result_2  BYTE      " in dog years!", 0
goodBye   BYTE      "Good-bye, ", 0


.code
main PROC

; Introduce programmer
     mov  edx, OFFSET    intro_1        ; Move the offset of the intro_1 variable into the EDX register, remember destination comes first and source comes second
     call WriteString                   ; WriteString will display the text as it is stored in memory
     call CrLf                          ; This goes to a new line, stands for carried returned line feed

; Get user name
     mov  edx, OFFSET    prompt_1
     call WriteString                   ; Don't call CrLf because we want user to enter info on same line
     mov  edx, OFFSET    userName  
     mov  ecx, 32                       ; Restring procedure, accept 32 characters because we initially allowed 33 to be entered (all 0 by default) so having 32 ensures that there will be one remaining 0 at end
     call ReadString     

; Say "Nice to meet you [name]"
     mov  edx, OFFSET    intro_2   
     call WriteString
     mov  edx, OFFSET    userName
     call WriteString
     call CrLf

; Get user age
     mov  edx, OFFSET    prompt_2
     call WriteString    
     call ReadInt   
     mov  userAge,  eax  

; Calculate user "dog years"
     mov  eax, userAge   
     mov  ebx, DOG_FACTOR     
     mul  ebx  
     mov  dogAge,   eax  

; Report result 
     mov  edx, OFFSET    result_1 
     call WriteString    
     mov  eax, dogAge                   ; To print something as an integer, you need to first need to move the value of the integer into the EAX register
     call WriteDec  
     mov  edx, OFFSET    result_2  
     call WriteString    
     call CrLf      

; Say "Good-bye"
     mov  edx, OFFSET    goodBye   
     call WriteString
     mov  edx, OFFSET    userName  
     call WriteString    
     call CrLf 

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
