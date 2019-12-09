SYS_READ equ 3
SYS_WRITE equ 4
SYS_EXIT equ 1
SYS_IN  equ 0
SYS_OUT equ 1

section .text
global _start
     _start:
mov eax, SYS_WRITE
mov ebx, SYS_OUT
mov ecx, userInput1
mov edx, userInput1Length
int 0x80

mov eax, SYS_READ
mov ebx, SYS_IN
mov ecx, firstNumber
mov edx, 2
int 0x80

mov eax, SYS_WRITE
mov ebx, SYS_OUT
mov ecx, userInput2
mov edx, userInput2Length
int 0x80

mov eax, SYS_READ
mov ebx, SYS_OUT
mov ecx, secondNumber
int 0x80

mov al, [firstNumber]
sub al, '0'

mov bl, [secondNumber]
sub bl, '0'

imul ebx

add eax,'0'

mov [result], eax

mov eax, SYS_WRITE
mov ebx, SYS_OUT
mov ecx, answer
mov edx, answerLength
int 0x80

mov eax, SYS_WRITE
mov ebx, SYS_OUT
mov ecx, result
int 0x80

mov eax, SYS_EXIT
int 0x80

section .data
userInput1 db "First number: ", 0xa
userInput1Length equ $ - userInput1

userInput2 db "Second number: ", 0xa
userInput2Length equ $ - userInput2

answer db "Result: ", 0xa
answerLength equ $ - answer

section .bss
firstNumber resb 2
secondNumber resb 2
result resb 2