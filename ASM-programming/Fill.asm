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

// screen has 512 registers, can use this variable for
// making it easy to iterate over them
@511
D=A
@screensize
M=D
(loop)
  @i // set i to 0 before clearing or filling
  M=0

  // check keyboard register


  @KBD
  D=M // store keyboard value

  @clear
  D;JEQ // jump to clear if D = 0 (keyboard not being pressed)

  @fill
  D;JNE // jump to fill if did not jump to clear

  @loop
  0;JMP

(fill) // label for action when keyboard is pressed

  @i
  D=M
  @screensize
  D=D-M
  @loop
  D;JGT // jump back to main loop once have filled pixels

  @i
  D=M
  @SCREEN
  A=A+D // get ith register of screen
  M=-1 // fill ith register of screen
  @i
  M=M+1 // increment i

  @fill // jump back to fill if we haven't filled pixels
  0;JMP
(clear)

  @i
  D=M
  @screensize
  D=D-M
  @loop
  D;JGT // jump back to main loop once have cleared pixels

  @i
  D=M
  @SCREEN
  A=A+D // get ith register of screen
  M=0 // clear ith register of screen
  @i
  M=M+1 // increment i

  @clear // jump back to fill if we haven't cleared pixels
  0;JMP
