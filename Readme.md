# Assembly Tutorial

Assembly NASM x86_64

Run Code:
```
nasm -f elf64 code.asm -o code.o
ld code.o -o code
./code
```

- register VS variable:
```
register	value
[register]	memory

variable	memory
[variable]	value
```

- valid mov instructions
```
mov  register, register     ; copy one register to another
mov  register, memory       ; load value from memory into register
mov  memory,   register     ; store value from register into memory
mov  register, immediate    ; move immediate value (constant) into register
mov  memory,   immediate    ; store immediate value (constant) in memory
```

References:
- [YouTube](https://youtube.com/playlist?list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn)
