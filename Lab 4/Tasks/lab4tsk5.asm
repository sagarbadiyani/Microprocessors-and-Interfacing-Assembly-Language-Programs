.model tiny
.486
.data
	fname db 'NewFile', 0
	handle dw ?
	max1 db 32
	act1 db ?
	inp1 db 32 dup('$')

	NEWLINE	DB 0DH, 0AH

	max2 db 32
	act2 db ?
	inp2 db 32 dup('$')

.code
.startup

;-----opening a new file-----
	mov ah, 3ch ;open file function
	lea dx, fname ;copy address to DX
	mov cl, 2 ;read-only attribute
	int 21h ; as soon as this is called, ax will get a pointer, pointing to fname file ;open the file
	mov handle, ax ;handle or err code

;-----Taking input from the user------
	lea dx, max1
	mov ah, 0Ah
	int 21h

;-----Taking input from the user------
	lea dx, max2
	mov ah, 0Ah
	int 21h

;------opening an existing file for writing------
	mov ah, 3dh
	lea dx, fname
	mov al, 2 ; 1 indicates writing mode
	int 21h
	mov handle, ax

;------writing name to the file------
	mov ah, 40h
	mov bx, handle
	mov cl, act1;how many bytes to write
	mov ch, 00h
	lea dx, inp1
	int 21h

;------file pointer----------
	mov ah, 42h
	mov bx, handle
	xor cx, cx
	xor dx, dx
	mov al, 2 ;2 indicates EOF
	int 21h

;------writing newline to the file------
	mov ah, 40h
	mov bx, handle
	mov cx, 2 ;how many bytes to write
	lea dx, NEWLINE
	int 21h

;------file pointer----------
	mov ah, 42h
	mov bx, handle
	xor cx, cx
	xor dx, dx
	mov al, 2 ;2 indicates EOF
	int 21h

;------writing id to the file------
	mov ah, 40h
	mov bx, handle
	mov cl, act2 ;how many bytes to write
	mov ch, 00h
	lea dx, inp2
	int 21h

;-----closing a file-------
	mov ah, 3eh
	mov dx, handle
	int 21h

.exit
end

