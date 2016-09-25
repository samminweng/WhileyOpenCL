import * from whiley.lang.System

// Append an integer to the input array and return the array 
// This is temporary and should be removed
function append(int[] items, int item) -> (int[] nitems):
	//
	nitems = [0; |items| + 1]
	int i = 0
	//
	while i < |items|:
		nitems[i] = items[i]
		i = i + 1
	// Update the last item
	nitems[i] = item
	return nitems

// Append two integers to an array at each iteration 
function appendArray(int[] data) -> (int[] output):
	int pos = 0
	// Initialize the output array
	output = [0;0]
	// Iterate each integer in 'data' array
	while pos < |data|:
		// Append an item from 'data' to 'output'
		output = append(output, data[pos]+10)
		output = append(output, data[pos]+10)
		pos = pos + 1
	return output
/*
* The transformed 'appendArray' function pre-allocates
* 2 times of input array and gradually fills each item
* to output array. This function does not use 'append'
* function. 
*/
function fastAppendArray(int[] data) -> (int[] output):
	int pos = 0
	// Initialize the output array
	output = [0;2*|data|]
	// The size of output array
	int size = 0
	// Iterate each integer in 'data' array
	while pos < |data|:
		// Update the output array
		output[size] = data[pos]+10
		// Increment the size
		size = size + 1
		output[size] = data[pos]+10
		size = size + 1
		pos = pos + 1
	// Create the output array with actual array size
	int[] output_1 = [0;size]
	int size_1 = 0
	while size_1 < size:
		output_1[size_1] = output[size_1]
		size_1 = size_1 + 1
	return output_1

method main(System.Console sys):
	int[] data = [1, 2, 3, 4, 5]
	int[] arr = appendArray(data)
	assert arr == [11, 11, 12, 12, 13, 13, 14, 14, 15, 15]
	sys.out.println(arr)
	int[] arr1 = fastAppendArray(data)
	assert arr1 == [11, 11, 12, 12, 13, 13, 14, 14, 15, 15]
	sys.out.println(arr1)