[bits 16]
setup_print:
	mov al, 0x02
	mov ah, 0x0
	int 0x10
	ret

print_char:
	mov bx, sp
	mov ax, [bx + 2]
	mov ah, 0x0e
	int 0x10
	ret

print_string:
	mov dx, sp
	mov bx, sp
	mov bx, [bx + 2]
	mov si, 0
	
	print_loop:
	mov al, [bx + si]
	cmp al, 0
	je print_end
	push ax
	call print_char
	add si, 1
	jmp print_loop

	print_end:
	mov sp, dx
	ret
