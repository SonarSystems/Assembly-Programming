section	.data
    message db 'Factorial of the number 3 = '
    messageLen equ $- message

section .bss
    fact resb 1

section	.text
   global _start

_start:
   mov bx, 3
   call  ProcessFactorial
   add   ax, 30h
   mov  [fact], ax

   mov	  eax,4
   mov	  ebx,1
   mov	  ecx,message
   mov	  edx,messageLen

   int	  80h

   mov	  eax,4
   mov	  ebx,1
   mov	  ecx,fact
   mov    edx,1

   int	  80h

   mov	  eax,1
   mov ebx, 0

   int	  80h
	
ProcessFactorial:
   cmp   bl, 1
   jg    Calculate
   mov   ax, 1
   ret

Calculate:
   dec   bl
   call  ProcessFactorial
   inc   bl
   mul   bl
   ret
