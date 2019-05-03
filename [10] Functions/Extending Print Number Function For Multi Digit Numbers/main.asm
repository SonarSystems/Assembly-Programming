;nasm 2.11.08

section .data
    hello:     db 'Hello world!',10    ; 'Hello world!' plus a linefeed character
    helloLen:  equ $-hello             ; Length of the 'Hello world!' string

section .bss
    var1: resb 4

section .text
	global _start

_start:



    mov esi, 7651
    mov [var1], esi

    call PrintNumber

	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return code of 0 (no error)
	int 80h;

PrintNumber:
    mov eax, [var1]
    mov esi, 10

    LP1:
    div esi
    cmp	eax,0

    add edx, 48
    mov [var1], edx

    mov eax,4            ; The system call for write (sys_write)
	mov ebx,1            ; File descriptor 1 - standard output
	mov ecx,var1        ; Put the offset of hello in ecx
	mov edx,helloLen     ; helloLen is a constant, so we don't need to say
	                     ;  mov edx,[helloLen] to get it's actual value
	int 80h              ; Call the kernel

    jge	LP1     ; If it is less than or equal to 10, then jump to LP1





    ;mov eax, [var1]
    ;mov esi, 10
    ;div esi
    ;add edx, 48
    ;mov [var1], edx

    ;mov eax,4            ; The system call for write (sys_write)
	;mov ebx,1            ; File descriptor 1 - standard output
	;mov ecx,var1        ; Put the offset of hello in ecx
	;mov edx,helloLen     ; helloLen is a constant, so we don't need to say
	                     ;  mov edx,[helloLen] to get it's actual value
	;int 80h              ; Call the kernel

    ret
