/*
* Read a file and output an array of bytes
*
*/
import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

method main(System.Console sys):
    File.Reader r = File.Reader("image.jpg")
    //File.Reader file = File.Reader(sys.args[0])
    byte[] data = r.readAll()
    sys.out.print_s("READ:         ")
    sys.out.print(|data|)
    sys.out.println_s(" bytes")
    File.Writer w = File.Writer("output.jpg")
    w.write(data)
    w.close()