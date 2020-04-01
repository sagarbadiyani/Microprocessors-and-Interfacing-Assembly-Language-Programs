.model tiny
.486

.code
.startup

;-------Set Display Mode--------
	mov ah, 00h
	mov al, 03h
	int 10h
	
;-------set cursor position--------
	mov ah, 02h
	mov dh, 12;row
	mov dl, 39;column
	mov bh, 00;page
	int 10h

;------Write character at cursor position------
	mov ah, 09h
	mov al, 'm';character to display
	mov bh, 00;page number
	mov bl, 10001110b;attribute byte - see below
	mov cx, 01h;number of times to write
	int 10h

;-------set cursor position--------
	mov ah, 02h
	mov dh, 12;row
	mov dl, 40;column
	mov bh, 00;page
	int 10h

;------Write character at cursor position------
	mov ah, 09h
	mov al, 'p';character to display
	mov bh, 00;page number
	mov bl, 10001011b;attribute byte - see below
	mov cx, 01h;number of times to write
	int 10h

;-------set cursor position--------
	mov ah, 02h
	mov dh, 12;row
	mov dl, 41;column
	mov bh, 00;page
	int 10h

;------Write character at cursor position------
	mov ah, 09h
	mov al, 'i';character to display
	mov bh, 00;page number
	mov bl, 10001101b;attribute byte - see below
	mov cx, 01h;number of times to write
	int 10h

	;------Blocking Function-------
	mov ah, 07h
x1: int 21h;DOS Interrupt
	cmp al, '%' ;if key pressed is %, then the program will terminate 
	jnz x1 ;this snippet is to be written just before the exit condition

.exit
end
