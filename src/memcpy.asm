BITS 64

section .text
global memcpy

memcpy:
    xor rcx, rcx                ; index = 0

loop:
    cmp rdx, rcx                ; if index == size
    je end                      ; go to end
    mov rax, [rsi + rcx]        ; rax = src[index]
    mov byte [rdi + rcx], al    ; dest[index] = rax
    inc rcx                     ; index++
    jmp loop                    ; continue the loop till the end

end:
    mov rax, rdi                ; assign to rax the return value of dest
    ret