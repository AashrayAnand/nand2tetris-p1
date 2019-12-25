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


(loop)
  @SCREEN
  D=A

  @addr
  M=D

  @KBD
  D=M // store keyboard value

  @clear
  D;JEQ // jump to clear if D = 0 (keyboard not being pressed)

  @fill
  D;JNE // jump to fill if did not jump to clear

  @loop
  0;JMP

(clear)
  // set color to be 0
  @color
  M=0
  @apply
  0;JMP

(fill)
  // set color to be -1
  @color
  M=-1
  @apply
  0;JMP

// iterate from 0 to 511
// apply color in each register
(apply)

  @color // get color
  D=M

  @addr // apply color at current address
  A=M
  M=D

  @addr
  M=M+1
  D=M // get next screen address
  @KBD
  D=A-D // get difference between current screen
        // address and keyboard memory map address

  @apply
  D;JGT

  @loop
  0;JMP
