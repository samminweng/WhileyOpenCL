/*
* Read a file and output an array of bytes
*
*/
import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

method main(System.Console sys):
    File.Reader file = File.Reader("medium.in")
    //File.Reader file = File.Reader(sys.args[0])
    byte[] data = file.readAll()
    sys.out.print_s("READ:         ")
    sys.out.print(|data|)
    sys.out.println_s(" bytes")
