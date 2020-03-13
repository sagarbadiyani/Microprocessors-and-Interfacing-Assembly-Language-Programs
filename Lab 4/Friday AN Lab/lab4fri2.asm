.model tiny
.486
.data
	file1 db "lab.txt",0
	file2 db "tap.txt",0
	handle1 dw ?
	handle2 dw ?
	input db ?
	read_buffer1 db 500 dup('$')
	read_buffer2 db 500 dup('$')
	size1 dw ?
	size2 dw ?
.code
.startup
	
	mov ah, 3dh ; open an existing file
	mov al, 02 ; open for read/write
	lea dx, file1
	int 21h
	mov handle1, ax
	
	mov ah, 3dh ; open an existing file
	mov al, 02 ; open for read/write
	lea dx, file2
	int 21h
	mov handle2, ax
	
;------file pointer----------
	mov ah, 42h
	mov bx, handle1
	mov cx, 0FFFFh
	mov dx, 0fff6h
	mov al, 2 ;2 indicates EOF
	int 21h
	
 ;------reading a file------
 	mov ah, 3fh
 	mov bx, handle1
 	lea dx, read_buffer1
 	mov cx, 10
 	int 21h
 
 ;------file pointer----------
 	mov ah, 42h
 	mov bx, handle2
 	xor cx, cx
 	xor dx, dx
 	mov al, 2 ;2 indicates EOF
 	int 21h
	
 ;------writing to a file------
 	mov ah, 40h
 	mov bx, handle2
 	mov cx, 10 ;how many bytes to write
 	lea dx, read_buffer1
 	int 21h	
	
 ;-----closing a file-------
 	mov ah, 3eh
 	mov dx, handle1
 	int 21h	
 
 ;-----closing a file-------
 	mov ah, 3eh
 	mov dx, handle2
 	int 21h		
 
	
	
.exit
end
