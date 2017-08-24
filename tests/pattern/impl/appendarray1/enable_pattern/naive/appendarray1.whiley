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
    nitems = [0b; |items| + 1]
    int i = 0
    while i < |items|:
        nitems[i] = items[i]
        i = i + 1
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

// Append an array one by one at each iteration
function f_append(byte[] input) -> (byte[] output):
    int pos = 0
    output = [0b;0] // Initialize the output array
    // Iterate each byte in 'input' array
    while pos < |input|:
        byte index = Int.toUnsignedByte(pos)
        byte item = input[pos]
        // Append item and length to 'output'
        output = append(output, index)
        output = append(output, item)
        pos = pos + 1
    return output

// Transformed 'f_append' function
function f_resize(byte[] input) -> (byte[] output):
    int pos = 0
    // Initialize the output array
    output = [0b;2*|input|]
    int size = 0// The size of output array
    // Iterate each byteeger in 'data' array
    while pos < |input|:
        byte index = Int.toUnsignedByte(pos)
        byte item = input[pos]
        // Update the output array
        output[size] = index
        size = size + 1
        output[size] = item
        size = size + 1
        pos = pos + 1
    assert size <= 2*|input| // Actual array size <= estimated size
    // Resize the output array with actual array size
    output = resize(output, size)
    return output

method main(System.Console sys):
    byte[] input = [01100001b, 01100010b, 01100011b] // 'abc'
    byte[] arr = f_append(input)
    byte[] arr1 = f_resize(input)
    assert arr == arr1
    sys.out.println(arr)
    sys.out.println(arr1)
