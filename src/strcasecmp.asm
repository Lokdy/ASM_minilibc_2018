BITS 64

section .text
global strcasecmp

strcasecmp:
    xor rcx, rcx                ; index = 0
    jmp str1_upper              ; go to str1_upper

str1_to_lower:
    add r8b, byte 32            ; add 32 to the ASCII value of str1[index]
    jmp str2_upper              ; jmp to str2_to_lower

str2_to_lower:
    add r9b, byte 32            ; add 32 to the ASCII value of str1[index]
    jmp loop                    ; jump to strcmp

str1_upper:
	mov r8b, [rdi + rcx]        ; r8b == str1[index++]
    cmp r8b, 65                 ; cmp str1[index] and 'A'
    jl str2_upper               ; if str1[index] < 'A'
    cmp r8b, 90                 ; cmp str1[index] and 'Z'
    jl str1_to_lower            ; if str1[index] > 'A' && str1[index] < 'Z'

str2_upper:
	mov r9b, [rsi + rcx]        ; r9b == str2[index++]
    cmp r9b, 65                 ; cmp str2[index] and 'A'
    jl loop                     ; if str2[index] < 'A'
    cmp r9b, 90                 ; cmp str2[index] and 'Z'
    jl str2_to_lower            ; if str2[index] > 'A' && str2[index] < 'Z'
 
loop:
    cmp r8b, byte 0             ; if str[index++] == '\0'
    je end                      ; if condition == true => go to end
    cmp r9b, byte 0             ; if str[index++] == '\0'
    je end                      ; if condition == true => go to end
    cmp r8b, r9b                ; if str1[index++] == str2[index++]
    jne end                     ; if condition != true => go end
    inc rcx                     ; index++
    jmp str1_upper              ; go to str1_upper


end:
    sub r8b, r9b                ; substract the ascii value of the 2 strings
    movsx rax, r8b              ; move result with his sign (not unsigned char)
    ret    