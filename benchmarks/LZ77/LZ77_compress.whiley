import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

// Positive integer type
type nat is (int x) where x >= 0
// Match type
type Match is ({nat offset, nat len} this)

// Find the matched entry with affine loop bound
/*function match(byte[] data, nat offset, nat end) -> int:
    nat pos = end
    nat len = 0
    nat maxIter = Math.min(pos - offset, |data| - pos)
    maxIter = Math.min(255, maxIter)
    while len < maxIter && data[offset+len] == data[pos+len]:
        len = len + 1
    return len
*/
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

// Compress 'input' array into 'output' array
function compress(byte[] data) -> (byte[] output):
    nat pos = 0
    // Initialize the output array of bytes
    output = [0b;0]
    // Iterate each byte in 'data'
    while pos < |data|:
        Match m = findLongestMatch(data, pos)
        // Encode the match to 'offset-length' pair
        // The distance to the longest match
        byte offset = Int.toUnsignedByte(m.offset)
        // The length of the match
        byte length = Int.toUnsignedByte(m.len)
        if offset == 00000000b:
            // No match is found. Put the first byte of look-ahead array
            length = data[pos]
            pos = pos + 1
        else:
            // Skip the matched bytes
            pos = pos + m.len
        // Write 'offset-length' pair to the output array
        output = append(output, offset)
        output = append(output, length)
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
    sys.out.println_s(ASCII.fromBytes(data))
    sys.out.print(|data|)
    sys.out.println_s(" bytes")
    // Compress the data with LZ algorithm
    byte[] compress_data = compress(data)
    sys.out.println_s("COMPRESSED Data:   ")
    sys.out.print(|compress_data|)
    sys.out.println_s(" bytes")
    // Write out compressed data to 'small.dat' file
    File.Writer writer = File.Writer(sys.args[1])
    writer.write(compress_data)
    writer.close()
    file.close()
