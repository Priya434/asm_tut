%include "printString.inc"

section .data
    text db "Hello world using micro!", 10, 0

section .text
    global _start

_start:
    print text
    exit