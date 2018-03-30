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
function resize(byte[] items, int size) -> (byte[] nitems)
requires |items| >= size
ensures |nitems| == size:
    nitems = [0b; size]
    int i = 0
    while i < size:
        nitems[i] = items[i]
        i = i + 1
    return nitems

// Function opt_append checks the items_length before the appending.
// If full, then double array size to store the item. Otherwise, have an in-place array.
// items: input array, inspos: index which the item is inserted to, item: array item
function opt_append(byte[] items, nat inspos, byte item) -> (byte[] output)
    requires inspos <= |items|
    ensures output[inspos] == item
    ensures all {i in 0..inspos-1 | output[i] == items[i]}
    ensures |output| >= inspos +1:
    if inspos < |items|:
        items[inspos] = item // Update the array without an array
        return items
    else:
        byte[] nitems = [0b; |items|*2+1]// Create a new array and double its size
        int index = 0
        while index < |items|
            where index>=0 && index <= |items| && all {i in 0..index-1 | nitems[i] == items[i]}:
            nitems[index] = items[index]
            index = index + 1
        nitems[index] = item
        return nitems

// Decompress 'data' array to a byte array by using array list
function decompress(byte[] data) -> (byte[] output):
    byte[] items = [0b;0]
    nat inspos = 0
    nat pos = 0
    while (pos+1) < |data|:
        byte header = data[pos]
        byte item = data[pos+1]
        pos = pos + 2
        if header == 00000000b:
            items = opt_append(items, inspos, item)
            inspos = inspos + 1
        else:
            // Look up sliding window
            int offset = Byte.toUnsignedInt(header)
            int len = Byte.toUnsignedInt(item)
            // Specify the starting position of the offset
            int start = inspos - offset
            int i = start
            // Copy the array of offset items to the list
            while i < (start+len):
                // Get one byte from output array
                item = items[i]
                items = opt_append(items, inspos, item)
                inspos = inspos + 1
                i = i + 1
    // all done!
    //Resize list array into the array of accurate length
    output = resize(items, inspos)
    return output

method main(System.Console sys):
    // Read the compress_data from a file
    File.Reader file = File.Reader("../../../Inputfiles/small_opt.dat")
    byte[] input_data = file.readAll()
    // Decompress the data to a string
    byte[] decompress_data = decompress(input_data)
    sys.out.println_s("DECOMPRESSED:   ")
    sys.out.println_s(ASCII.fromBytes(decompress_data))
    sys.out.print(|decompress_data|)
    sys.out.println_s(" bytes")
    file.close()
