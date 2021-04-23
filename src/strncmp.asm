BITS 64

section .text
global strncmp

strncmp:
    xor rcx, rcx            ; index = 0

loop:
    mov r8b, [rdi + rcx]    ; r8b == str1[index++]
    mov r9b, [rsi + rcx]    ; r9b == str2[index++]
    cmp r8b, r9b            ; if str1[index++] == str2[index++]
    jne end                 ; if condition != true => go to end
    cmp rdx, rcx            ; if index == 3rd arg
    je end                  ; if condition == true => go to end
    cmp r8b, 0              ; if str[index++] == '\0'
    je end                  ; if condition == true => go to end
    cmp r9b, 0              ; if str[index++] == '\0'
    je end                  ; if condition == true => go to end
    inc rcx                 ; index++
    jmp loop                ; continue the loop

end:
    sub r8b, r9b            ; substract the ascii value of the 2 strings
    movsx rax, r8b          ; move result with his sign (not unsigned char)
    ret                     ; return 