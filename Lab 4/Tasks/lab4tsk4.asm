.model tiny
.486
.data
	fname db 'AnyName', 0
	store db 100 dup('$')
.code
.startup

;------opening an existing file for reading------
	mov ah, 3dh
	lea dx, fname
	mov al, 0 ; 0 indicates reading mode
	int 21h

	mov bx, ax ;bx has handle
	lea dx, store ;dx is for output

X1: mov cx, 01h
;------reading a file------
	mov ah, 3fh
	int 21h
	inc dx
	cmp ax, 00h
	jnz X1

	mov di, dx

	;------string output------
	lea dx, store
	mov ah, 09h
	int 21h

	;-----closing a file-------
	mov ah, 3eh
	int 21h

.exit
end
