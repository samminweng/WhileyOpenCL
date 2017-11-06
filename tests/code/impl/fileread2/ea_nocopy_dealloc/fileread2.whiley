/*
* Print out a PBM file to a console
*
*
*/
import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

constant SPACE is 00100000b // ASCII code of space (' ')
constant BLACK is 01100010b // ASCII code of 'b'

// ========================================================
// Print a pbm image
// ========================================================
method print_pbm(System.Console sys, int width, int height, byte[] pixels):
    // File type
    sys.out.println_s("P1")
    // Width + height
    sys.out.print(width)
    sys.out.print_s(" ")
    sys.out.println(height)
    // An array of bytes with an row of pixels in width
    int j = 0
    while j<height:
        int i = 0
        while i<width:
            int pos = j*width + i
            if pixels[pos] == SPACE:
                sys.out.print(0)
            else:
                sys.out.print(1)
            // Each pixel is separated by a space
            sys.out.print_s(" ")
            i = i + 1
        // Add a newline
        sys.out.println_s("")
        j = j + 1

method main(System.Console sys):
    File.Reader r = File.Reader("../../../Inputfiles/image64x64.pbm")
    int width=64
    int height=64
    byte[] pixels = r.readAll()
    print_pbm(sys, width, height, pixels)
