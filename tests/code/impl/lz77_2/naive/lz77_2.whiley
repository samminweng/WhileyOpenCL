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

// Find the matched entry with affine loop bound
function match(byte[] data, nat offset, nat end) -> int:
    nat pos = end
    nat len = 0
    nat maxIter = Math.min(pos - offset, |data| - pos)
    maxIter = Math.min(255, maxIter)
    while len < maxIter && data[offset+len] == data[pos+len]:
        len = len + 1
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

// Append a byte to the byte array
// This is temporary and should be removed
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

// Append 'u1' to the byte array
/*function write_u1(byte[] bytes, int u1) -> (byte[] output):
    //requires u1 >= 0 && u1 <= 255:
    output = append_byte(bytes, Int.toUnsignedByte(u1))
    return output
*/

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

/*
* Pre-allocate the output array with extra space and then copy output array
* to an array with actual size
*/
//Compress 'input' array into 'output' array
function compress(byte[] data) -> (byte[] output):
    nat pos = 0
    nat arr_capacity=2*|data|
    // Initialize the output array of bytes
    output = [0b;arr_capacity]
    // Array size
    nat arr_size = 0
    // Iterate each byte in 'data'
    while pos < |data|:
        Match m = findLongestMatch(data, pos)
        // Encode the match to 'offset-length' pair
        byte offset = Int.toUnsignedByte(m.offset)
        byte length = Int.toUnsignedByte(m.len)
        if offset == 00000000b:
            // Put the next byte
            length = data[pos]
            pos = pos + 1
        else:
            // Skip the matched bytes
            pos = pos + m.len
        // write the encoded pair
        output[arr_size] = offset
        arr_size = arr_size + 1
        output[arr_size] = length
        arr_size = arr_size + 1
    // Add extra invariant to ensure array capacity >= array size
    assert arr_capacity >= arr_size
    // Reallocate the output array
    output = resize(output, arr_size)
    // Return the array
    return output

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

method main(System.Console sys):
    // Create a byte array with repeated text
    File.Reader file = File.Reader("small.in")
    byte[] data = file.readAll()
    sys.out.println_s("Data:         ")
    sys.out.println_s(ASCII.fromBytes(data))
    sys.out.print(|data|)
    sys.out.println_s(" bytes")
    // Compress the data with LZ algorithm
    byte[] compress_data = compress(data)
    sys.out.print_s("COMPRESSED Data:   ")
    sys.out.println(compress_data)
    sys.out.print(|compress_data|)
    sys.out.println_s(" bytes")
    // Decompress the data to a string
    byte[] decompress_data = decompress(compress_data)
    sys.out.println_s("DECOMPRESSED:   ")
    sys.out.println_s(ASCII.fromBytes(decompress_data))
    sys.out.print(|decompress_data|)
    sys.out.println_s(" bytes")
    assert |data| == |decompress_data|
    assert data == decompress_data