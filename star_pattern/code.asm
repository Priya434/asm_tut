section .data
    newline db 10
    star db 42
    starItr db 0

section .bss
    i resb 1

section .text
    global _start

_start:
    mov rbx, 5
    call _loop
    
    ; exit
    mov rax, 60
    mov rdi, 0
    syscall
    
_loop:
    mov rcx, rbx
    
    mov rax, rbx
    add rax, 48
    mov [i], al
    dec rbx
    push rbx
    push rcx
    
    _print_star:
        mov rax, [star]
        mov [star], al
        
        mov rax, 1
        mov rdi, 1
        mov rsi, star
        mov rdx, 1
        syscall
        
        pop rcx
        mov [starItr], rcx
        dec rcx
        push rcx
        
        jg _print_star
        pop rcx
    
    call _newline
    
    pop rbx
    cmp rbx, 0
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