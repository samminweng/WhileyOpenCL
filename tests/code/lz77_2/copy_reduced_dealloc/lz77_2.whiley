/**
 * A variation of the Lempel-Ziv 77 compressions/decompression.
 * Instead of appending the element to the output array, 
 * this program allocates extra larger output array (2x input array) in 'compress' function
 *
 * See: http://en.wikipedia.org/wiki/LZ77_and_LZ78
 *      https://github.com/Whiley/WyBench/blob/master/src/009_lz77/Main.whiley
 */
import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

// Positive integer type
type nat is (int x) where x >= 0
// Match type 
type Match is ({nat offset, nat len} this)

// Find the matched entry
function match(byte[] data, nat offset, nat end) -> int:
    //
    nat pos = end
    nat len = 0
    //
    while offset < pos && pos < |data| && data[offset] == data[pos] && len < 255:
        //
        offset = offset + 1
        pos = pos + 1
        len = len + 1
    //
    return len

// pos is current position in input value
function findLongestMatch(byte[] data, nat pos) -> (Match m):
    // Get 'data' byte array
    nat bestOffset = 0
    nat bestLen = 0
    int start = Math.max(pos - 255, 0)
    //assert start >= 0
    nat offset = start
    while offset < pos:
        int len = match(data, offset, pos)
        if len > bestLen:
            bestOffset = pos - offset
            bestLen = len
        offset = offset + 1
    // Return a 'Match' object
    return {offset:bestOffset, len:bestLen}

// Append a byte to the byte array inside 'Data' structure
// This is temporary and should be removed
function append_byte(byte[] items, byte item) -> (byte[] nitems):
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

// Append 'u1' to the byte array
function write_u1(byte[] bytes, int u1) -> (byte[] output):
    //requires u1 >= 0 && u1 <= 255:
    output = append_byte(bytes, Int.toUnsignedByte(u1))
    return output

/* 
* Pre-allocate the output array with extra space and then copy output array
* to an array with actual size
*/
//Compress 'input' array into 'output' array
function compress(byte[] data) -> (byte[] output):
    nat pos = 0
    // Initialize the output array of bytes
    output = [0b;2*|data|]
    // Array size
    nat size = 0
    // Iterate each byte in 'data'
    while pos < |data|:
        Match m = findLongestMatch(data, pos)
        int offset = m.offset
        int len = m.len
        //output = write_u1(output, offset)
        output[size] = Int.toUnsignedByte(offset)
        size = size + 1
        if offset == 0:
            //output = append_byte(output, data[pos])
            output[size] = data[pos]
            size = size + 1
            pos = pos + 1
        else:
            //output = write_u1(output, len)
            output[size] = Int.toUnsignedByte(len)
            size = size + 1
            pos = pos + len
    // Reallocate the output array
    byte[] output2 = [0b;size]
    // Copy 'output' array to 'output2' array
    nat size2 = 0
    while size2 < size:
        output2[size2] = output[size2]
        size2 = size2 + 1
    // Return the array
    return output2

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
            output = append_byte(output, item)
        else:
            int offset = Byte.toUnsignedInt(header)
            int len = Byte.toUnsignedInt(item)
            int start = |output| - offset
            int i = start
            while i < (start+len):
                // Get byte from output array
                item = output[i]
                //sys.out.println(item)
                output = append_byte(output, item)
                i = i + 1
    // all done!
    return output

method main(System.Console sys):
    // Create a byte array with repeated text
    File.Reader file = File.Reader("small.in")
    byte[] data = file.readAll()
    sys.out.print_s("Data:         ")
    sys.out.println_s(ASCII.fromBytes(data))
    sys.out.print(|data|)
    sys.out.println_s(" bytes")
    // Compress the data with LZ algorithm
    byte[] compress_data = compress(data)
    sys.out.print_s("COMPRESSED Data:   ")
    sys.out.println_s(ASCII.fromBytes(compress_data))
    sys.out.print(|compress_data|)
    sys.out.println_s(" bytes")
    // Decompress the data to a string
    byte[] decompress_data = decompress(compress_data)
    sys.out.print_s("DECOMPRESSED:   ")
    sys.out.println_s(ASCII.fromBytes(decompress_data))
    sys.out.print(|decompress_data|)
    sys.out.println_s(" bytes")
