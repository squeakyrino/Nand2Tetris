// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// PSEUDO CODE
// x=R0
// y=R1
// R2=0
// while(x > 0) {
//     R2 += y
//     x--
// }

//Get the values into the registers
@R0
D = M
@x
M = D //x = R0

@R1
D = M
@y
M = D //y = R1

@0
D = A
@R2
M = D //R2 = 0

//while
(WHILE)
@x
D = M
@0
D = D - A   //x - 0
@END        //If x - 0 = 0 then END else continue
D;JEQ

@y      //Get y so we can add it to R2
D = M
@R2     //Now we can add it to R2
M = M + D

@x
D = M
@1
D = D - A
@x
M = D   //x--

@WHILE  //Back up we go
0;JMP

(END)
@END
0;JMP