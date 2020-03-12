.model tiny
.486
.data
	fname db 'AnyName', 0
	handle dw ?
	name1 db 'Sagar Badiyani', 0dh, 0ah
	ID db '2017B3A71006G', 0dh, 0ah
.code
.startup

;-----creating a new file-----
	mov ah, 3ch ;open file function
	lea dx, fname ;copy address to DX
	mov cl, 1 ;read-only attribute
	int 21h ; as soon as this is called, ax will get a pointer, pointing to fname file ;open the file
	mov handle, ax ;handle or err code

;------writing to the file------
	mov ah, 40h
	mov bx, handle
	mov cx, 16 ;how many bytes to write
	lea dx, name1
	int 21h

;------file pointer----------
	mov ah, 42h
	mov bx, handle
	xor cx, cx
	xor dx, dx
	mov al, 2 ;2 indicates EOF
	int 21h

;------writing to the file------
	mov ah, 40h
	mov bx, handle
	mov cx, 15 ;how many bytes to write
	lea dx, ID
	int 21h

;-----closing the file-------
	mov ah, 3eh
	mov dx, handle
	int 21h

.exit
end
