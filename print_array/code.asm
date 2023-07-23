section .data
    myArray db 1, 3, 5, 7, 9
    newline db 10
    ele db 0

section .bss
    i resb 1

section .text
    global _start

_start:
    mov rbx, 0
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
    
    call _print_array
    
    inc rbx
    push rbx
    
    call _newline
    
    pop rbx
    cmp rbx, 5
    jl _loop
    
    ret
    
_print_array:
    mov rax, [myArray + rbx]
    add rax, 48
    mov [ele], al
    
    mov rax, 1
    mov rdi, 1
    mov rsi, ele
    mov rdx, 1
    syscall
    
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