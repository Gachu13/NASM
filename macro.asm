%macro write_string 2
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   80h
   %endmacro
 
section .text
   global _start            
_start:                    

   write_string msg, len                

   mov eax,1                ;system call number (sys_exit)
   int 0x80                 ;call kernel

section .data
msg db 'The sum is:',0xA,0xD
len equ $ - msg