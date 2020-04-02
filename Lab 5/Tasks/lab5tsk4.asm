.model tiny
.486
.data
	
.code
.startup

;-------Set Display Mode--------
	mov ah, 00h
	mov al, 12h
	int 10h

;------Prints the outermost red box
	mov ah, 0ch
	mov al, 1100b
	mov cx, 00
	mov dx, 00
x1: int 10h
	inc dx
	cmp dx, 250
	jnz x1
	mov dx, 00
	inc cx
	cmp cx, 150
	jnz x1

;------Prints the 2nd outermost green box
	mov ah, 0ch
	mov al, 1010b
	mov cx, 10
	mov dx, 15
x2: int 10h
	inc dx
	cmp dx, 235
	jnz x2
	mov dx, 15
	inc cx
	cmp cx, 140
	jnz x2

;------Prints the 3rd outermost red box
	mov ah, 0ch
	mov al, 1100b
	mov cx, 20
	mov dx, 30
x3: int 10h
	inc dx
	cmp dx, 220
	jnz x3
	mov dx, 30
	inc cx
	cmp cx, 130
	jnz x3	

;------Prints the 4th outermost green box
	mov ah, 0ch
	mov al, 1010b
	mov cx, 30
	mov dx, 45
x4: int 10h
	inc dx
	cmp dx, 205
	jnz x4
	mov dx, 45
	inc cx
	cmp cx, 120
	jnz x4

;------Prints the 5th outermost red box
	mov ah, 0ch
	mov al, 1100b
	mov cx, 40
	mov dx, 60
x5: int 10h
	inc dx
	cmp dx, 190
	jnz x5
	mov dx, 60
	inc cx
	cmp cx, 110
	jnz x5	

;------Prints the 6th outermost green box
	mov ah, 0ch
	mov al, 1010b
	mov cx, 50
	mov dx, 75
x6: int 10h
	inc dx
	cmp dx, 175
	jnz x6
	mov dx, 75
	inc cx
	cmp cx, 100
	jnz x6

;------Blocking Function-------
	mov ah, 07h
bf: int 21h;DOS Interrupt
	cmp al, '%' ;if key pressed is %, then the program will terminate 
	jnz bf ;this snippet is to be written just before the exit condition

.exit
end
