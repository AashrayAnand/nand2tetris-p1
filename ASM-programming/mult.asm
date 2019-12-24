// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// multiplication is not supported as a primitive operation
// so instead, we can think of multiplying x by y as summing
// up x, from 0 to y

// we can do the above by initializing a sum variable, and
// successively adding R0 to this sum term, while also decrementing
// R1, with the JMP condition being that R1 = 0, meaning we have added
// R0 to sum R1 times
@R2
M=0

(loop)
  @R1
  M=M-1 // R1 > 0 at start, so we can decrement at least once
  D=M+1
  @out // set jump point
  D;JEQ // jump to OUT loop if R1 = 0


  @R0
  D=M // store R0
  @R2
  M=M+D // increase R2 by R0

  @loop // jump back into loop
  0;JEQ

(out)
  @out // set jump point
  0;JEQ
