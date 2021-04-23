BITS 64

section .text
global strchr

strchr:
    push rdi                ; creation of the pointer

loop:
    cmp BYTE [rdi], sil     ; condition : if occurrence
    je occ                  ; if true => stop loop and go to occ
    cmp BYTE [rdi], 0       ; condition : if no occurrence
    je no_occ               ; if true => stop loop and go to no_occ
    inc rdi                 ; go to next char
    jmp loop                ; repeat the loop till its end

occ:
    mov rax, rdi            ; assign rax the return value
    jmp end                 ; go to return

no_occ:
    mov rax, 0              ; assign rax the retrurn value
    jmp end                 ; go to return

end:
    pop rdi                 ; "free" rdi
    ret                     ; return the value