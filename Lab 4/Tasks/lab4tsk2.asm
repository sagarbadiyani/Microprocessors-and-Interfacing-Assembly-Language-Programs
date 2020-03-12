.model tiny
.486
.data
	fname db 'AnyName', 0
	handle dw ?
	hostel db 'CH1 '
	room db '247'
.code
.startup

;------opening an existing file for writing------
	mov ah, 3dh
	lea dx, fname
	mov al, 1 ; 1 indicates writing mode
	int 21h
	mov handle, ax

;------file pointer----------
	mov ah, 42h
	mov bx, handle
	xor cx, cx
	xor dx, dx
	mov al, 2 ;2 indicates EOF
	int 21h

;------writing to a file------
	mov ah, 40h
	mov bx, handle
	mov cx, 4 ;how many bytes to write
	lea dx, hostel
	int 21h

;------file pointer----------
	mov ah, 42h
	mov bx, handle
	xor cx, cx
	xor dx, dx
	mov al, 2 ;2 indicates EOF
	int 21h

;------writing to a file------
	mov ah, 40h
	mov bx, handle
	mov cx, 3 ;how many bytes to write
	lea dx, room
	int 21h

;-----closing a file-------
	mov ah, 3eh
	mov dx, handle
	int 21h

.exit
end
