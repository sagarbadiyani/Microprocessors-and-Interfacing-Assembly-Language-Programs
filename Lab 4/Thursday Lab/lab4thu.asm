.model tiny
.486
.data
	fname db 'lab.txt', 0
	handle dw ?
	max1 db 1
	act1 db ?
	inp1 db 2 dup('$')
	read_pos dw ?
	buffer db ?, '$'
.code
.startup

;------opening an existing file for reading------
	mov ah, 3dh
	lea dx, fname
	mov al, 0 ; 0 indicates reading mode
	int 21h
	mov handle, ax

;-----Taking input from the user------
	
	mov ah, 08h
	int 21h
	and al, 0Fh

	mov [inp1], al
	mov cl, 10
	mul cl
	dec ax
	mov [read_pos], ax

	mov ah, 42h
	mov al, 00
	mov bx, handle
	mov dx, [read_pos]
	mov cx, 0
	int 21h



;------reading a file------
	mov ah, 3fh
	lea dx, buffer
	mov cx, 1
	int 21h

	mov dl, [buffer]
	mov ah, 02h
	int 21h

.exit
end
