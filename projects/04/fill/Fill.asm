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
//Pseudo code
//Max pixel is at 0x5999 = 24575
//int i = SCREEN;
//while(true) {
//    while(i != 24575)
//    {
//        if(KBD)
//        {
//            M[i] = 0xFFFF;
//        }
//        else
//        {
//            M[i] = 0x0000;
//        }
//    }
//    
//    i = SCREEN;
//}

@SCREEN
D = A
@i
M = D

(MAINLOOP) //While(true)

(SCREENLOOP)
@KBD
D = M
@KBDELSE
D;JEQ //if(KBD)

@0
A = !A
D = A
@i
A = M
M = D
@ENDIF
0;JMP

(KBDELSE)
@0
D = A
@i
A = M
M = D
(ENDIF)

//i != 24575
@i
A = M
D = A
@1
D = D + A
@i
M = D
@24575
D = D - A
@SCREENLOOP
D;JNE


@SCREEN
D = A
@i
M = D //i = SCREEN;

@MAINLOOP
0;JMP