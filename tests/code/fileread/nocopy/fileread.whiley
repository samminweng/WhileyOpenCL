/*
* Read a pbm file and output an array of bytes
* http://netpbm.sourceforge.net/doc/pbm.html
P1
# feep.pbm
24 7
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 1 1 1 1 0 0 1 1 1 1 0 0 1 1 1 1 0 0 1 1 1 1 0
0 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 1 0
0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 1 0
0 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0
0 1 0 0 0 0 0 1 1 1 1 0 0 1 1 1 1 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

# P1: file type
# 24: width
# 7: height
*
*/
import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

method main(System.Console sys):
    File.Reader file = File.Reader("feep.pbm")
    int width=24
    int height=7
    byte[] data = file.readAll()
    sys.out.print_s("READ:         ")
    sys.out.print(|data|)
    sys.out.println_s(" bytes")
    assert |data| == width*height