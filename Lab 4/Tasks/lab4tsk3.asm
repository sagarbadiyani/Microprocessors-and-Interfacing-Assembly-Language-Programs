.model tiny
.486
.data
	fname db 'AnyName', 0
	handle dw ?
	buffer db 39 dup(?), '$'
.code
.startup

;------opening an existing file for reading------
	mov ah, 3dh
	lea dx, fname
	mov al, 0 ; 0 indicates reading mode
	int 21h
	mov handle, ax

;------reading a file------
	mov ah, 3fh
	mov bx, handle
	lea dx, buffer
	mov cx, 39
	int 21h

;------string output------
	lea dx, buffer
	mov ah, 09h
	int 21h

;-----closing a file-------
	mov ah, 3eh
	mov dx, handle
	int 21h

.exit
end
