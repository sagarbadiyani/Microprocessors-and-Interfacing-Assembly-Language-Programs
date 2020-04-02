# Problems

Example1: Displays mpi blinking in middle of the screen
          m: yellow
          p: cyan
          i: magenta
          
 Example2: Divides the screen into two parts the top part from row 0 to row 12 - where data will be displayed in yellow on a blue background and a bottom part where data will displayed in bright green on a white background. A single user character is taken and displayed on the top and bottom of the screen as shown in figure below - where the user entered character is 'a'

Example3: Displays a square of size 50x50 at position 20x20. The square color is yellow

Task1: Display ‘DOLL’ blinking in the center of the screen with White letters on Black background with screen resolution at 720X400 pixels in text VGA mode (80colsX25rows) with 16 colours.(cursor needs to be advanced with each character. Use video  mode 3)

Task2: Implement a ‘dual-window ‘editor. The screen should be divided into two equal divisions. You may choose to split the screen horizontally or vertically. The first half must have a background colour of blue and foreground of yellow. The second half must have a background of white and a foreground of bright green. Use video mode 3. As the user types in characters on the keyboard, they must be simultaneously displayed on both the halves. If the user types ‘$#’, then the program must terminate and it must return to the previous video mode.

Task3: Draw a rectangle (lines red in colour) of area 100x80 pixels with top left corner of the rectangle at pixel position (80, 70). Use video mode 12h

