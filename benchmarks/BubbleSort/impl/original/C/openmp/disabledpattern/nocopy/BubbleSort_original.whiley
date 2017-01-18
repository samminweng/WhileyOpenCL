import whiley.lang.*

function bubbleSort(int[] items) -> int[]:
	int length = |items|
	// The index of last swapped item.
	int last_swapped = 0
	// Until no items is swapped
	while length > 0:
		last_swapped = 0
		int index = 1
		while index < length:
		//Check previous item > current item
			if items[index-1] > items[index]:
				// Swap them
				int tmp = items[index-1]
				items[index-1] = items[index]
				items[index] = tmp
				last_swapped = index 
			//End if
			index = index + 1
		// Skip the remaing items as they are orderred. This saves lots of time.
		length = last_swapped
	return items

method main(System.Console sys):
	int|null n = Int.parse(sys.args[0])
	if n != null:
		int max = n
		//Merge sorting on a reverse array 'arr' ([max ... 0])
		int index = 0
		int[] arr = [0;max]
		//sys.out.println(arr)
		//Fill in the array in the reverse order (max..0)
		while index <= max:
			arr[index] = max - index 
			index = index + 1
		//Sort the array
		arr = bubbleSort(arr)
		// Print the last element of sorted array
		sys.out.println(arr[0])
		sys.out.println(arr[max-1])
		sys.out.println_s("Pass BubbleSort test case")