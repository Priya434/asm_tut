section .data
    newline db 10

section .bss
    i resb 1

section .text
    global _start

_start:
    mov rcx, 5
    call _loop
    
    ; exit
    mov rax, 60
    mov rdi, 0
    syscall
    
_loop:
    mov rax, rcx
    add rax, 48
    mov [i], rax
    dec rcx
    push rcx
    
    ; print digit
    mov rax, 1
    mov rdi, 1
    mov rsi, i
    mov rdx, 1
    syscall
    
    call _newline
    
    pop rcx
    cmp rcx, 0
    jg _loop
    
    ret
    
_newline:
    mov rax, [newline]
    mov [newline], al
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    
    ret