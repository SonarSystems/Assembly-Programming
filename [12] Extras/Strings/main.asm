;nasm 2.11.08

section .data
    str1 db "Hello Everyone", 10
    str1Len equ $- str1

section .text
	global _start

_start:
	mov eax, 4
    mov ebx, 1
    mov ecx, str1
    mov edx, str1Len

    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, str1
    mov edx, str1Len

    int 80h

	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return code of 0 (no error)
	int 80h;
