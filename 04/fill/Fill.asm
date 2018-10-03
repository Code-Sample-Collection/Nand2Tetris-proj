// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//* ----- var and const init ----- *//
// globle constant
@SCREEN
D=A
@i      // screen ptr
M=D     // i = SCREEN (16394)

// screen fill type
@BLACK
M=1
@WHITE
M=0

//* ----- Main function body ----- *//
(INF_LOOP)
@KBD
D=M
@CLS
D;JEQ   // if M[KBD] == 0: goto CLS

@FILL
0;JMP

@INF_LOOP
0;JMP   // infinite loop


//* ----- fill screen ----- *//
(FILL)
D=M[BLACK]
A=M[i]
M=D     // RAM[i] = BLACK

@INF_LOOP
0;JMP   // goto INF_LOOP


//* ----- clear screen ----- *//
(CLS)
D=M[WHITE]
A=M[i]
M=D     // RAM[i] = WHITE

@INF_LOOP
0;JMP   // goto INF_LOOP
