section .data
    ; msg       :   name of memory address
    ; db        :   define bytes
    ; "Hello.." :   defined bytes
    ; 10        :   newline character or \n
    msg db "Hello, World!", 10
    
    ; length of buffer
    ; for "Hello, World!" len is 14
    ; 13 [Hello, World!] + 1 for the newline character
    ; len equ $ - msg 

section .text
    global _start

_start:
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout file descriptor
    mov rsi, msg    ; bytes to write
    ; mov rdx, len    ; number of bytes to write
    mov rdx, 14
    syscall         ; perform system call

    ; exit code
    mov rax, 60     ; sys_exit syscall
    mov rdi, 0      ; exit status is 0
    syscall         ; perform system call