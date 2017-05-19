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
// ArrayList type stores a byte array and its len, and it is dynamically growing
type MyArrayList is ({byte[] items, nat items_length} this)
// Append one byte to the array
/*
function append(byte[] items, byte item) -> (byte[] nitems):
    //ensures |nitems| == |items| + 1:
    //
    nitems = [0b; |items| + 1]
    int i = 0
    //
    while i < |items|:
        nitems[i] = items[i]
        i = i + 1
    //
    nitems[i] = item
    return nitems
// Decompress 'input' array to a string
function decompress(byte[] data) -> (byte[] output):
    output = [0b;0]
    nat pos = 0
    //
    while (pos+1) < |data|:
        byte header = data[pos]
        byte item = data[pos+1]
        pos = pos + 2
        if header == 00000000b:
            output = append(output, item)
        else:
            int offset = Byte.toUnsignedInt(header)
            int len = Byte.toUnsignedInt(item)
            int start = |output| - offset
            int i = start
            while i < (start+len):
                // Get byte from output array
                item = output[i]
                //sys.out.println(item)
                output = append(output, item)
                i = i + 1
    // all done!
    return output
*/
// Append one byte to the array list
// If full, then double array size and store the data
function opt_append(byte[] items, nat items_length, byte item) -> (MyArrayList nlist):
    if items_length < |items|:
        // Update the array without an array
        items[items_length] = item
    else:
        // Create a new array
        byte[] nitems = [0b; |items|*2+1]
        int i = 0
        while i < |items|:
            nitems[i] = items[i]
            i = i + 1
        nitems[i] = item
        items = nitems
    items_length = items_length +1
    nlist = {items:items, items_length:items_length}
    return nlist

// Resize the input array to the array of given array size
function resize(byte[] items, int size) -> (byte[] nitems)
requires |items| >= size
ensures |nitems| == size:
    nitems = [0b; size]
    int i = 0
    while i < size:
        nitems[i] = items[i]
        i = i + 1
    return nitems

// Decompress 'data' array to a byte array by using array list
function decompress(byte[] data) -> (byte[] output):
    byte[] items = [0b;0]
    nat items_length = 0
    MyArrayList list = {items:items, items_length:items_length}
    nat pos = 0
    while (pos+1) < |data|:
        byte header = data[pos]
        byte item = data[pos+1]
        pos = pos + 2
        if header == 00000000b:
            list = opt_append(items, items_length, item)
            items = list.items
            items_length = list.items_length
        else:
            // Look up sliding window
            int offset = Byte.toUnsignedInt(header)
            int len = Byte.toUnsignedInt(item)
            // Specify the starting position of the offset
            int start = items_length - offset
            int i = start
            // Copy the array of offset items to the list
            while i < (start+len):
                // Get byte from output array
                item = items[i]
                list = opt_append(items, items_length, item)
                items = list.items
                items_length = list.items_length
                i = i + 1
    // all done!
    //Resize list array into the array of accurate length
    output = resize(items, items_length)
    return output

method main(System.Console sys):
    // Read the compress_data from a file
    File.Reader file = File.Reader("small.dat")
    byte[] input_data = file.readAll()
    // Decompress the data to a string
    byte[] decompress_data = decompress(input_data)
    sys.out.println_s("DECOMPRESSED:   ")
    sys.out.println_s(ASCII.fromBytes(decompress_data))
    sys.out.print(|decompress_data|)
    sys.out.println_s(" bytes")
