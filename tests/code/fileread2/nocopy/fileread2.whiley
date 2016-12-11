/*
* Print out a PBM file to a console
* 
*
*/
import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

method print_pbm(System.Console sys, int width, int height, byte[] data):
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
            sys.out.print(Byte.toUnsignedInt(data[pos]))
            // Each pixel is separated by a space
            sys.out.print_s(" ")
            i = i + 1
        // Add a newline
        sys.out.println_s("")
        j = j + 1   

method main(System.Console sys):
    File.Reader r = File.Reader("feep.pbm")
    int width=24
    int height=7
    byte[] data = r.readAll()
    print_pbm(sys, width, height, data)
