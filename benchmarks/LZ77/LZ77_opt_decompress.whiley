/**
 * A simplistic implementation of the Lempel-Ziv 77 compressions/decompression.
 *
 * See: http://en.wikipedia.org/wiki/LZ77_and_LZ78
 *      https://github.com/Whiley/WyBench/blob/master/src/009_lz77/Main.whiley
 */
 import * from whiley.io.File
 import * from whiley.lang.System
 import whiley.lang.*
 
 // Positive integer type
 type nat is (int x) where x >= 0
 // Resize the input array to the array of given array size
 function resize(byte[] buffer, int size) -> (byte[] nbuffer)
 requires |buffer| >= size
 ensures |nbuffer| == size:
     nbuffer = [0b; size]
     int i = 0
     while i < size:
         nbuffer[i] = buffer[i]
         i = i + 1
     return nbuffer
 
 // Function opt_append checks the size of array 'buffer' before the appending.
 // If full, then double array size to store the item. Otherwise, have an in-place array.
 // buffer: input array, size: index which the item is inserted to, item: array item
 function opt_append(byte[] buffer, nat size, byte item) -> (byte[] output)
     requires size >= 0
     requires size <= |buffer|
     ensures |output| >= size +1
     ensures all {i in 0..size | output[i] == buffer[i]}
     ensures output[size] == item:
     if size < |buffer|:
         buffer[size] = item // Update the array without an array
         return buffer
     else:
         byte[] nbuffer = [0b; |buffer|*2+1]// Create a new array and double its size
         int index = 0
         while index < |buffer|
             where index>=0 && index <= |buffer|
             where |buffer| == |nbuffer|
         where all {i in 0..index | nbuffer[i] == buffer[i]}:
             nbuffer[index] = buffer[index]
             index = index + 1
         nbuffer[index] = item
         return nbuffer
 
 // Decompress 'data' array to a byte array by using array list
 function decompress(byte[] data) -> (byte[] output):
     byte[] items = [0b;0]
     nat size = 0
     nat pos = 0
     while (pos+1) < |data|:
         byte header = data[pos]
         byte item = data[pos+1]
         pos = pos + 2
         if header == 00000000b:
             items = opt_append(items, size, item)
             size = size + 1
         else:
             // Look up sliding window
             int offset = Byte.toUnsignedInt(header)
             int len = Byte.toUnsignedInt(item)
             // Specify the starting position of the offset
             int start = size - offset
             int i = start
             // Copy the array of offset items to the list
             while i < (start+len):
                 // Get one byte from output array
                 item = items[i]
                 items = opt_append(items, size, item)
                 size = size + 1
                 i = i + 1
     // all done!
     //Resize list array into the array of accurate length
     output = resize(items, size)
     return output
 
 method main(System.Console sys):
     // Read the compress_data from a file
     File.Reader file = File.Reader(sys.args[0])
     byte[] input_data = file.readAll()
     // Decompress the data to a string
     byte[] decompress_data = decompress(input_data)
     sys.out.println_s("DECOMPRESSED:   ")
     sys.out.print(|decompress_data|)
     sys.out.println_s(" bytes")
     file.close()
 