.model tiny
.486
.data
	fname db 'file1', 0
	rename db 'renamed', 0
	handle dw ?
	msg db 'File Handling'
	msg1 db 'File Handling', 0dh, 0ah
	buffer db 25 dup(?)
	count db 10
.code
.startup

; ;-----opening a new file-----
; 	mov ah, 3ch ;open file function
; 	lea dx, fname ;copy address to DX
; 	mov cl, 1 ;read-only attribute
; 	int 21h ; as soon as this is called, ax will get a pointer, pointing to fname file ;open the file
; 	mov handle, ax ;handle or err code

; ;-----closing a file-------
; 	mov ah, 3eh
; 	mov dx, handle
; 	int 21h

; --------------------------------------------------------------------------------------------------------------------------------------------

; ;------opening an existing file for writing------
; 	mov ah, 3dh
; 	lea dx, fname
; 	mov al, 1 ; 1 indicates writing mode
; 	int 21h
; 	mov handle, ax

; ;------writing to a file------
; 	mov ah, 40h
; 	mov bx, handle
; 	mov cx, 12 ;how many bytes to write
; 	lea dx, msg
; 	int 21h

; ;-----closing a file-------
; 	mov ah, 3eh
; 	mov dx, handle
; 	int 21h

; --------------------------------------------------------------------------------------------------------------------------------------------


; ;------opening an existing file for reading------
; 	mov ah, 3dh
; 	lea dx, fname
; 	mov al, 0 ; 0 indicates reading mode
; 	int 21h
; 	mov handle, ax

; ;------reading a file------
; 	mov ah, 3fh
; 	mov bx, handle
; 	lea dx, buffer
; 	mov cx, 10
; 	int 21h

; ;------displaying 10 bytes--------
; 	lea si, buffer

; L1:
; 	mov ah, 2
; 	mov dl, [si]
; 	int 21h
; 	inc si
; 	dec count
; 	jnz L1	

; --------------------------------------------------------------------------------------------------------------------------------------------

; ;------opening an existing file for writing------
; 	mov ah, 3dh
; 	lea dx, fname
; 	mov al, 1 ; 1 indicates writing mode
; 	int 21h
; 	mov handle, ax

; ;------file pointer----------
; 	mov ah, 42h
; 	mov bx, handle
; 	xor cx, cx
; 	xor dx, dx

; 	mov al, 2 ;2 indicates EOF
; 	int 21h

; ;------writing to a file------
; 	mov ah, 40h
; 	mov bx, handle
; 	mov cx, 16 ;how many bytes to write
; 	lea dx, msg
; 	int 21h

; ;-----closing a file-------
; 	mov ah, 3eh
; 	mov dx, handle
; 	int 21h

; --------------------------------------------------------------------------------------------------------------------------------------------

; ;-----deleting a file---------
; 	mov ah, 41h
; 	lea dx, fname
; 	int 21h

; --------------------------------------------------------------------------------------------------------------------------------------------

; ;------renaming a file---------
; 	mov ah, 56h;
; 	lea dx, fname
; 	lea di, rename
; 	int 21h

; --------------------------------------------------------------------------------------------------------------------------------------------




.exit
end

     
