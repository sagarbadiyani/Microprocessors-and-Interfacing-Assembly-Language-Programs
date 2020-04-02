.model tiny
.486
.data
	inp db ?
.code
.startup

;-------Set Display Mode--------
	mov ah, 00h
	mov al, 03h
	int 10h

;-------set cursor position--------
	mov ah, 02h
	mov dh, 00;row
	mov dl, 00;column
	mov bh, 00;page
	int 10h

;------Write character at cursor position------
	mov ah, 09h
	mov al, ' ';character to display
	mov bh, 00;page number
	mov bl, 00011110b;attribute byte - see below
	mov cx, 13*80;number of times to write
	int 10h

;-------set cursor position--------
	mov ah, 02h
	mov dh, 13;row
	mov dl, 00;column
	mov bh, 00;page
	int 10h

;------Write character at cursor position------
	mov ah, 09h
	mov al, ' ';character to display
	mov bh, 00;page number
	mov bl, 01111010b;attribute byte - see below
	mov cx, 13*80;number of times to write
	int 10h

;------Taking input from the user------
	mov ah, 08
	int 21h
	mov inp, al

;------Write character at cursor position------
	mov ah, 09h
	mov bh, 00;page number
	mov bl, 01111010b;attribute byte - see below
	mov cx, 01;number of times to write
	int 10h

;-------set cursor position--------
	mov ah, 02h
	mov dh, 00;row
	mov dl, 00;column
	mov bh, 00;page
	int 10h

;------Write character at cursor position------
	mov ah, 09h
	mov bh, 00;page number
	mov bl, 00011110b;attribute byte - see below
	mov cx, 01;number of times to write
	int 10h


;------Blocking Function-------
	mov ah, 07h
x1: int 21h;DOS Interrupt
	cmp al, '$' ;if key pressed is %, then the program will terminate 
	jnz x1 ;this snippet is to be written just before the exit condition

x2: int 21h;DOS Interrupt
	cmp al, '#'
	jnz x1

.exit
end
