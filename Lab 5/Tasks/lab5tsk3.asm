.model tiny
.486
.data
	x1 dw 70
	y1 dw 80
.code
.startup

;-------Set Display Mode--------
	mov ah, 00h
	mov al, 12h
	int 10h

	mov cx, y1
	mov ah, 0ch
	mov al, 1100b
x2: mov dx, 70
	int 10h
	mov dx, 150
	int 10h
	inc cx
	cmp cx, 180
	jnz x2

	mov dx, x1
x3: mov cx, 80
	int 10h
	mov cx, 180
	int 10h
	inc dx
	cmp dx, 150
	jnz x3

;------Blocking Function-------
	mov ah, 07h
bf: int 21h;DOS Interrupt
	cmp al, '%' ;if key pressed is %, then the program will terminate 
	jnz bf ;this snippet is to be written just before the exit condition

.exit
end
