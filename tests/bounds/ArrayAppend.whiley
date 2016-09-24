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

// Append two integers to an array 
function appendArray(int[] data) -> (int[] output):
	int pos = 0
	// Initialize the output array
	output = [0;0]
	// Iterate each integer in 'data' array
	while pos < |data|:
		output = append(output, pos+10)
		pos = pos + 1
	return output

method main(System.Console sys):
	int[] arr = appendArray([1, 2, 3, 4, 5])
	sys.out.println(arr)
