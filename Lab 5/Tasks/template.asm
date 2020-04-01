.model tiny
.486
.data
	string db "test $"
	curr db ?
.code
.startup

	lea dx, string
	mov ah, 09h
	int 21h

;------Get Display Mode--------
	mov ah, 0fh;input
	mov curr, ah ;always save the current display mode
	int 10h; BIOS Interrupt
	;AL = current video mode
	;AH = number of character columns
	;BH = page number

;-------Set Display Mode--------
	mov ah, 00h
	mov al, 03h
	int 10h
	;ah always zero
	;al: 00h - text mode. 40x25. 16 colours. 8 pages.
	;al: 03h - text mode. 80x25. 16 colours. 8 pages.
	;al: 12h - graphical mode. 80x25. 256 colours. 720x400 pixels. 1 page.
	;Note though 8 pages we always use only the first page

;-------Get cursor position and size-------
	mov ah, 03h;
	mov bh, 00h; bh stores page number which is usually zero
	int 10h
	;DH = row.
	;DL = column.
	;CH = cursor start line.
	;CL = cursor bottom line.

;-------set cursor position--------
	mov ah, 02h
	mov dh, 12;row
	mov dl, 40;column
	mov bh, 00;page
	int 10h

;-------Set cursor size--------
	; mov ah, 01h
	; mov ch, 05h;cursor start line (bits 0-4) and options (bits 5-7).
	; mov cl, 0fh;bottom cursor line (bits 0-4).
	; int 10h

;------Read character at Cursor position------
	mov ah, 08h
	mov bh, 00h; page number
	;OUTPUT mentioned at the end

;------Write character at cursor position------
	mov ah, 09h
	mov al, 't';character to display
	mov bh, 00;page number
	mov bl, 11011011b;attribute byte - see below
	mov cx, 01h;number of times to write
	int 10h

;------Blocking Function-------
	mov ah, 07h
x1: int 21h;DOS Interrupt
	cmp al, '%' ;if key pressed is %, then the program will terminate 
	jnz x1 ;this snippet is to be written just before the exit condition

.exit
end


;-------------OUTPUT of Read character at Cursor position----------
; Error if CF = 1, AX = error code (6)
; AH = attribute.
; AL = character.
; Attribute
; The attribute byte is used to specify the foreground and background of the character displayed on the screen.
; Bits 2-1-0           represent the foreground colour
; Bit   3                  represents the intensity of foreground colour (0-low , 1- high intensity)
; Bits 6-5-4           represent the background colour
; Bit   7                  is used for blinking text if set to 1
; The 3 bit colour code (with their high intensity counterparts ( if bit3 is 1 ) is:
; 000       -black (gray)
; 001       -blue (bright blue)
; 010       -green (bright green)
; 011       -cyan (bright cyan) 
; 100       -red   (bright red)
; 101       -magenta (bright magenta)
; 110       -brown (yellow)
; 111       -white (bright white)

