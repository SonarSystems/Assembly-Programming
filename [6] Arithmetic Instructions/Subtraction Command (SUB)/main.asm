;nasm 2.11.08

section .data
    hello:     db 'Hello world!',10    ; 'Hello world!' plus a linefeed character
    helloLen:  equ $-hello             ; Length of the 'Hello world!' string

section .bss
    var1: resb 4
    var2: resb 4

section .text
	global _start

_start:
    mov ebp, 3
    mov esp, 2
    mov [var1], ebp
    mov [var2], esp
    mov ebp, [var1]
    mov esp, [var2]
    sub ebp, esp
	mov eax,4            ; The system call for write (sys_write)
	mov ebx,1            ; File descriptor 1 - standard output
	mov ecx,hello        ; Put the offset of hello in ecx
	mov edx,ebp     ; helloLen is a constant, so we don't need to say
	                     ;  mov edx,[helloLen] to get it's actual value
	int 80h              ; Call the kernel

	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return code of 0 (no error)
	int 80h;
