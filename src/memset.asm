BITS 64

section .text
global memset

memset:
    xor rcx, rcx            ; index = 0

loop:
    cmp rdx, rcx            ; if index == n
    je end                  ; if true => go to end
    mov [rdi + rcx], sil    ; dest[i] = src
    inc rcx                 ; index++
    jmp loop                ; continue the loop

end:
    mov rax, rdi            ; assign rax the value of dest
    ret                     ; return dest