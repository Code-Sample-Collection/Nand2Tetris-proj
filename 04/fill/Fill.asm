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
M=D     // i = SCREEN (16384)

// globle constant
@I_MIN
M=D     // MIN = SCREEN
@24576  // MAX = SCREEN + (256-1)*32
D=A
@I_MAX
M=D

// screen fill type
@BLACK
M=-1
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


//* ----- fill screen ----- *//
(FILL)
D=M[BLACK]
A=M[i]
M=D     // RAM[i] = BLACK

D=M[I_MAX]
D=D-M[i]
@INF_LOOP
D;JEQ   // if i == I_MAX: goto INF_LOOP
@i
M=M+1   // else: i++

@INF_LOOP
0;JMP   // goto INF_LOOP


//* ----- clear screen ----- *//
(CLS)
D=M[WHITE]
A=M[i]
M=D     // RAM[i] = WHITE

D=M[I_MIN]
D=M[i]-D
@INF_LOOP
D;JEQ   // if i == I_MIN: goto INF_LOOP
@i
M=M-1   // else: i--

@INF_LOOP
0;JMP   // goto INF_LOOP
