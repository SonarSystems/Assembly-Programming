;nasm 2.11.08

%macro EpicPrint 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2

    int 80h
%endmacro

section .data
    hello:     db 'Hello world!',10    ; 'Hello world!' plus a linefeed character
    helloLen:  equ $-hello             ; Length of the 'Hello world!' string

section .text
	global _start

_start:
	EpicPrint hello, 1
	EpicPrint hello, 2
	EpicPrint hello, 3

	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return code of 0 (no error)
	int 80h;
