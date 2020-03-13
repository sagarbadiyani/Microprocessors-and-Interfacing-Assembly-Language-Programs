.model tiny
.486
.data
	fname db 'lab.txt', 0
	handle dw ?
	max1 db 1
	act1 db ?
	inp1 db 2 dup('$')
	read_pos dw ?
	buffer db  5 dup('$')
.code
.startup

;------opening an existing file------
	mov ah, 3dh
	lea dx, fname
	mov al, 2; 
	int 21h
	mov handle, ax

;-----Taking input from the user------
    mov cx, 05
    lea di, buffer
    cld

X1:	mov ah, 08h
	int 21h
	stosb
	loop X1

;------file pointer----------
	mov ah, 42h
	mov bx, handle
	mov cx, 0FFFFh
	mov dx, 0fffbh
	mov al, 2 ;2 indicates EOF
	int 21h


;------writing to a file------
	mov ah, 40h
	mov bx, handle
	mov cx, 5 ;how many bytes to write
	lea dx, buffer
	int 21h

;-----closing a file-------
	mov ah, 3eh
	mov dx, handle
	int 21h

.exit
end
