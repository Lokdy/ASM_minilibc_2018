BITS 64

section .text
global memmove

memmove:
    xor rcx, rcx                ; index = 0

srcgreater:                     ; loop src >= dest
    cmp rcx, rdx                ; if index == size
    je quit                     ; go to end
    mov rax, [rsi + rcx]        ; rax = src[index]
    mov byte [rdi + rcx], al    ; dest[index] = rax
    inc rcx                     ; index++
    jmp loop                    ; continue the loop till the end

srclesser:
	mov	rbx, rsi	            ; rbx = src
	add	rbx, rdx	            ; rbx += size 
	cmp	rbx, rdi	            ; if (rbx < dest)
	jl	srcgreater		        ; go to greater
	mov	rcx, rbx	            ; rcx = size

loop:
	cmp rdx, 0		            ; if (index == 0)
	je	end		                ; go to end
	mov	bl, [rsi + rcx]	        ; tmp = src[index]
	mov	[rdi + rcx], bl	        ; dest[index] = tmp
	dec	rdx		                ; dest--
	jmp	loop		            ; go to loop

quit:
	mov	rax, rdi	            ; assign to rax the return value of dest 
	ret

end:
    mov rax, rdi                ; assign to rax the return value of dest
    ret