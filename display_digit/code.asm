section .data
    digit db 0, 10

section .text
    global _start

_start:
    ; manual operations
    mov rax, 7
    mov rdi, 3
    sub rax, rdi
    div rdi

    call _printRAXDigit
    
    ; exit code
    mov rax, 60     ; sys_exit syscall
    mov rdi, 0      ; exit status is 0
    syscall         ; perform system call

_printRAXDigit:
    add rax, 48
    ; to the memory of [digit] move the
    ; least significant byte of rax
    ; so, the value of digit, 
    ; [points to]/[is] the
    ; value of the least significant byte of rax
    mov [digit], al

    ; sys_start
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret

