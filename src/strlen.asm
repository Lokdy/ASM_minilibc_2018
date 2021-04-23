BITS 64

section .text
global strlen

strlen:
    xor rax, rax            ; Index(length) : rax = 0

loop:
    cmp byte [rdi + rax], 0 ; condition => if str[i] != '\0'
    jz end                  ; if condition == true => leave the loop
    inc rax                 ; increment the length
    jmp loop                ; repeat the statement if not true

end:
    ret                     ; return