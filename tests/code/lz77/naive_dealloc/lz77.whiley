/**
 * A simplistic implementation of the Lempel-Ziv 77 compressions/decompression.
 *
 * See: http://en.wikipedia.org/wiki/LZ77_and_LZ78
 *      https://github.com/Whiley/WyBench/blob/master/src/009_lz77/Main.whiley
 */
import * from whiley.lang.System
import whiley.lang.*

// The binary representation of 'LZ 77 compression' string
constant text is [01001100b, 01011010b, 00100000b, 00110111b, 00110111b,
				  00100000b, 01100011b, 01101111b, 01101101b, 01110000b,
				  01110010b, 01100101b, 01110011b, 01110011b, 01101001b,
				  01101111b, 01101110b]
// Positive integer type
type nat is (int x) where x >= 0
// Match type
type Match is ({nat offset, nat len} this)

// Find the matched entry
function match(byte[] data, nat offset, nat end) -> int:
    //ensures 0 <= len && len <= 255:
    //
    nat pos = end
    nat len = 0
    //
    while offset < pos && pos < |data| && data[offset] == data[pos] && len < 255:
        //where offset >= 0 && pos >= 0 && len >= 0 && len <= 255:
        //
        offset = offset + 1
        pos = pos + 1
        len = len + 1
    //
    return len

// pos is current position in input value
/*function findLongestMatch(byte[] data, nat pos) -> Match:
    //ensures offset >= 0 && offset <= 255
    //ensures len >= 0 && len <= 255:
    //
    nat bestOffset = 0
    nat bestLen = 0
    int start = Math.max(pos - 255,0)
    //assert start >= 0
    nat offset = start
    while offset < pos:
        //where offset >= 0 && pos >= 0 && bestOffset >= 0 && bestLen >= 0
        //where bestOffset <= 255 && pos - offset <= 255 && bestLen <= 255:
        int len = match(data,offset,pos)
        if len > bestLen:
            bestOffset = pos - offset
            bestLen = len
        offset = offset + 1
    // Return a 'Match' object
    return {offset:bestOffset, len:bestLen}


// Compress 'data' byte array into another byte array
function compress(byte[] data) -> byte[]:
	nat pos = 0
	byte[] output = [0b;0]
	// Iterate each byte in 'data'
	while pos < |data|:
		Match m = findLongestMatch(data, pos)
		pos = pos + 1
	return output
*/

method main(System.Console sys):
	// Create an array of bytes, that represents a string 
	byte[] data = text
	sys.out.println_s("Data:         ")
	sys.out.println_s(ASCII.fromBytes(data))

