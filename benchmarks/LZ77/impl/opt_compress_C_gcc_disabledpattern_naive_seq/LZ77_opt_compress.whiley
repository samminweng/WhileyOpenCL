import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

// Positive integer type
type nat is (int x) where x >= 0
// Match type
type Match is ({nat offset, nat len} this)

// Find the matched entry with affine loop bound
function match(byte[] data, nat offset, nat end) -> (int length)
    ensures 0 <= length && length <= 255:
    nat pos = end
    nat len = 0
    while offset < pos && pos < |data| && data[offset] == data[pos] && len < 255:
        offset = offset + 1
        pos = pos + 1
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

// Pre-allocate the output array with extra space and then copy output array
// to an array with actual size
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
    // Read a text file of repeated contents as a byte array
    File.Reader file = File.Reader(sys.args[0])
    byte[] data = file.readAll()
    sys.out.println_s("Data:         ")
    sys.out.print(|data|)
    sys.out.println_s(" bytes")
    // Compress the data with LZ algorithm
    byte[] compress_data = compress(data)
    sys.out.println_s("COMPRESSED Data:   ")
    sys.out.print(|compress_data|)
    sys.out.println_s(" bytes")
