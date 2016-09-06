/**
 * A simplistic implementation of the Lempel-Ziv 77 compressions/decompression.
 *
 * See: http://en.wikipedia.org/wiki/LZ77_and_LZ78
 *      https://github.com/Whiley/WyBench/blob/master/src/009_lz77/Main.whiley
 */
import * from whiley.lang.System
import whiley.lang.*

// The binary representation of 'aacaacabcabaaac' string
constant text is [01100001b, 01100001b, 01100011b, 01100001b, 01100001b,
                  01100011b, 01100001b, 01100010b, 01100011b, 01100001b,
                  01100010b, 01100001b, 01100001b, 01100001b, 01100011b]
// Positive integer type
type nat is (int x) where x >= 0
// Match type
type Match is ({nat offset, nat len} this)
// DATA type (item: byte arra, length: the length of 'item' array)
type Data is ({byte[] items, int length} this)

// Find the matched entry
function match(Data input, nat offset, nat end) -> int:
    //
    nat pos = end
    nat len = 0
    byte[] data = input.items
    //
    while offset < pos && pos < input.length && data[offset] == data[pos] && len < 255:
        //
        offset = offset + 1
        pos = pos + 1
        len = len + 1
    //
    return len

// pos is current position in input value
function findLongestMatch(Data input, nat pos) -> Match:
    // Get 'data' byte array
    nat bestOffset = 0
    nat bestLen = 0
    int start = Math.max(pos - 255, 0)
    //assert start >= 0
    nat offset = start
    while offset < pos:
        int len = match(input, offset, pos)
        if len > bestLen:
            bestOffset = pos - offset
            bestLen = len
        offset = offset + 1
    // Return a 'Match' object
    return {offset:bestOffset, len:bestLen}

// Append a byte to the byte array inside 'Data' structure
// This is temporary and should be removed
function append_byte(Data data, byte item) -> Data:
	//ensures |nitems| == |items| + 1:
	//
	byte[] items = data.items
	byte[] nitems = [0b; |items| + 1]
	int i = 0
	//
	while i < |items|:
		nitems[i] = items[i]
		i = i + 1
	//
	nitems[i] = item    
	int length = data.length + 1
	return {items:nitems, length:length}

// Append 'u1' to the byte array
function write_u1(Data data, int u1) -> Data:
    //requires u1 >= 0 && u1 <= 255:
    //
    return append_byte(data, Int.toUnsignedByte(u1))

// Compress 'input' data into 'output' data 
//method compress(Data input, System.Console sys) -> Data:
function compress(Data input) -> Data:
	nat pos = 0
	// The output byte array
	Data output = {items:[0b;0], length:0}
	//sys.out.println_s("================Compression==================")
	// Iterate each byte in 'data'
	while pos < input.length:
		Match m = findLongestMatch(input, pos)
		int offset = m.offset
		int len = m.len
		//sys.out.print_s("offset:")
		//sys.out.println(offset)
		//sys.out.print_s("len:")
		//sys.out.println(len)
		output = write_u1(output, offset)
		if offset == 0:
			output = append_byte(output, input.items[pos])
			pos = pos + 1
		else:
			output = write_u1(output, len)
			pos = pos + len
	   // Print out 'output' byte array
	   //sys.out.println_s(ASCII.fromBytes(output.items))
	return output

//method decompress(Data input, System.Console sys) -> Data:
function decompress(Data input) -> Data:
    Data output = {items:[0b;0], length:0}
    byte[] data = input.items
    nat pos = 0
    //
    while (pos+1) < input.length:
        byte header = data[pos]
        byte item = data[pos+1]
        pos = pos + 2
        //sys.out.println_s("================Decompression=============")
        //sys.out.print_s("Header:")
        //sys.out.println(Byte.toUnsignedInt(header))
        //sys.out.print_s("Item:")
        //sys.out.println(Byte.toUnsignedInt(item))
        if header == 00000000b:
            output = append_byte(output, item)
        else:
            int offset = Byte.toUnsignedInt(header)
            int len = Byte.toUnsignedInt(item)
            int start = |output.items| - offset
            int i = start
            //sys.out.println_s("Get previous items:")
            while i < (start+len):
                // Get byte from output array
                item = output.items[i]
                //sys.out.println(item)
                output = append_byte(output, item)
                i = i + 1
        //sys.out.println_s(ASCII.fromBytes(output.items))
    // all done!
    return output

method main(System.Console sys):
    // Create an array of bytes, that represents a string 
    Data data = {items:text, length:|text|}
    sys.out.print_s("Data:         ")
    sys.out.println_s(ASCII.fromBytes(data.items))
    sys.out.print(data.length)
    sys.out.println_s(" bytes")
    //Data compress_data = compress(data, sys)
    Data compress_data = compress(data)
    sys.out.print_s("COMPRESSED Data:   ")
    sys.out.println_s(ASCII.fromBytes(compress_data.items))
    sys.out.print(compress_data.length)
    sys.out.println_s(" bytes")
    //Data decompress_data = decompress(compress_data, sys)
    Data decompress_data = decompress(compress_data)
    sys.out.print_s("DECOMPRESSED:   ")
    sys.out.println_s(ASCII.fromBytes(decompress_data.items))
    sys.out.print(decompress_data.length)
    sys.out.println_s(" bytes")
    
