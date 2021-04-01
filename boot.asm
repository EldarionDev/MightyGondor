[bits 16]
section .boot_data
boot_string db "Preparing the environment around Osgiliath...", 0

section .boot_code
global _start
_start:
	mov sp, 0x7000
	call setup_print
	push '!'
	call print_char
	push 't'
	call print_char
	
	mov ah, 2 ;Read disk 
	mov al, 1 ;Read 1 sector 
	mov ch, 0 ;Read cylinder 0 
	mov cl, 2 ;Read sector 2 
	mov dh, 0 ;Read head 0 
	mov dl, 0 ;Read disk with stage0 bootloader on 
	mov bx, 0x7e00
	mov es, bx
	mov bx, 0
	int 0x13

	lea bx, boot_string
	push word [bx + 2]
	xchg bx, bx
	call print_char
	;push boot_string
	;call print_string
	jmp $

%include "boot_routines/print.asm"

times 510 - ($ - $$) db 0
dw 0xaa55