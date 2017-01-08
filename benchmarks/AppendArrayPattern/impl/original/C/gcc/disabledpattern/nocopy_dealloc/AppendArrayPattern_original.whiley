/*
*  This example aims to test the transformation from dynamic 'append' to static 'resize'
*
*/
import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

// Append a byte to the byte array Note this is temporary and should be removed
function append(byte[] items, byte item) -> (byte[] nitems)
    ensures |nitems| == |items| + 1:
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

// Append two integers to an array at each iteration 
function comp(byte[] data) -> (byte[] output):
    int pos = 0
    // Initialize the output array
    output = [0b;0]
    // Iterate each integer in 'data' array
    while pos < |data|:
        byte item = data[pos]
        byte length = Int.toUnsignedByte(pos)
        pos = pos + 1
        // Append two items to 'output'
        output = append(output, length)
        output = append(output, item)
    return output

// /*
// * The transformed 'f' function pre-allocates
// * 2 times of input array and gradually fills each item
// * to output array. This function does not use 'append'
// * function. 
// */
// function f(byte[] data) -> (byte[] output):
// 	int pos = 0
// 	// Initialize the output array
// 	output = [0;2*|data|]
// 	// The size of output array
// 	int size = 0
// 	// Iterate each integer in 'data' array
// 	while pos < |data|:
// 		// Update the output array
// 		output[size] = Int.toUnsignedByte(pos)
// 		size = size + 1
// 		output[size] = data[pos]
// 		size = size + 1
// 		pos = pos + 1
// 	// Resize the output array with actual array size
// 	output = resize(output, size)
// 	return output

method main(System.Console console):
    int|null n = Int.parse(console.args[0])
    if n != null:
        int max = n
        // The byte array of 'a' 
        byte[] data = [01100001b;max]
        byte[] arr = comp(data)
        assert |arr| == 2 * |data|
        console.out.print(|arr|)
