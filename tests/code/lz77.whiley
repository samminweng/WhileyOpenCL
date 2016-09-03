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

type nat is (int x) where x >= 0

method main(System.Console sys):
	// Create an array of bytes, that represents a string 
	byte[] data = text
	sys.out.println_s("Data:         ")
	sys.out.println_s(ASCII.fromBytes(data))

