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
	/* For testing call-by-value sortV1 function*/
    int[] ys = [3,4,7,1,2]
    ys = bubbleSort(ys)
    assert ys == [1,2,3,4,7]
    sys.out.println(ys)
    ys = [3,4,7,2]
    ys = bubbleSort(ys)
    assert ys == [2,3,4,7]
    sys.out.println(ys)
    ys = [1,2,3,4]
    ys = bubbleSort(ys)
    assert ys == [1,2,3,4]
    sys.out.println(ys)
    ys = [1,2,3,4,5]
    ys = bubbleSort(ys)
    assert ys == [1,2,3,4,5]
    sys.out.println(ys)
    //Create a reversed array 'arr' 
    int max = 10
    int index = 0
    int[] arr = [0;max]
    //sys.out.println(arr)
    //Fill in the array in the reverse order ([10 ... 1])
    while index < max:
        arr[index] = max - index 
        index = index + 1
    //Use merge sort to sort the array
    arr = bubbleSort(arr)
    // Should be in the ascending order [1..10]
    assert arr == [1,2,3,4,5,6,7,8,9,10]
    sys.out.println(arr)
    sys.out.println_s("Pass BubbleSort test case")