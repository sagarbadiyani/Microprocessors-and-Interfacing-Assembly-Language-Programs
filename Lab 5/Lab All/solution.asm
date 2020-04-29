
.model tiny
.486
.data
	fname db 'fil1.txt', 0
	handle dw ?
	curr db ?
	buffer db 25 dup(?) ;output string is stored here

	;----to be edited-----
	block db '6' ;last second character of your ID number (6 in case of 2017B3A71006G)
	count dw 5 ;number of characters in your first name (5 in case of "Sagar")
	vowels dw 2 ;number of vowels in your first name (2 in case of "Sagar")
	row db 09 ;your birth month (9 in case of September)
	column db 20 ;your birth date
	;also edit line 81 of the code according to the colour scheme given in the question
	;-----end-------------

.code
.startup

;------opening an existing file for reading------
	mov ah, 3dh
	lea dx, fname
	mov al, 0 ; 0 indicates reading mode
	int 21h
	mov handle, ax

;------file pointer----------
	mov ah, 42h
	mov bx, handle
	xor cx, cx
	mov dx, vowels
	mov al, 0 ;0 indicates SOF
	int 21h

;------reading a file------
	mov ah, 3fh
	mov bx, handle
	lea dx, buffer
	mov cx, count
	int 21h

;-----closing a file-------
	mov ah, 3eh
	mov dx, handle
	int 21h

;------Get Display Mode--------
	mov ah, 0fh;input
	mov curr, ah ;always save the current display mode
	int 10h; BIOS Interrupt
	;AL = current video mode
	;AH = number of character columns
	;BH = page numbe

;-------Set Display Mode--------
	mov ah, 00h
	mov al, 03h
	int 10h
	;ah always zero
	;al: 00h - text mode. 40x25. 16 colours. 8 pages.
	;al: 03h - text mode. 80x25. 16 colours. 8 pages.
	;al: 12h - graphical mode. 80x25. 256 colours. 720x400 pixels. 1 page.
	;Note though 8 pages we always use only the first page

;-------set cursor position--------
	mov ah, 02h
	mov dh, row ;row
	mov dl, column ;column
	mov bh, 00;page
	int 10h

;-------initialisation for reading and displaying the output string - "buffer"-------
	lea si, buffer
	mov di, 00

;------displaying the string-------
X1: mov ah, 09h
	mov al, [si];character to display
	mov bh, 00;page number
	mov bl, 00001110b;attribute byte
	mov cx, 01h;number of times to write
	int 10h

;-----moving forward the cursor-------
	inc dl
	mov ah, 02h
	int 10h

;-----checking if we have reached the end--------
	inc si
	inc di
	cmp di, count
	jne X1

;------Blocking Function-------
	mov ah, 07h
bf: int 21h;DOS Interrupt
	cmp al, block ;if key pressed is <block>, then the program will terminate 
	jnz bf ;this snippet is to be written just before the exit condition

.exit
end
