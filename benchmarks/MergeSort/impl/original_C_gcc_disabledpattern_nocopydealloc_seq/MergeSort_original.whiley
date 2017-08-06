import whiley.lang.*
// Perform a merge sort on integer array
function sortV1(int[] items, int start, int end)->int[]:
     // Check the length is > 1.
    if (start+1) < end:
        // First, split unsorted items into left and right sub-lists
        int pivot = (start+end) / 2
        //sys.out.println(pivot)
        // Get the sublist
        int[] lhs = Array.slice(items,start,pivot)
        // Recursively split left sublist
        lhs = sortV1(lhs, 0, pivot)
        // Get the sublist
        int[] rhs = Array.slice(items,pivot,end)
        // Recursively Split right sublist
        rhs = sortV1(rhs, 0, (end-pivot))
        // Second, merge left and right sublists into
        // original list.
        int l = 0   // Starting index of left sublist
        int r = 0   // Starting index of right sublist
        int i = 0   // Starting index of items list
        // Update items with the smaller element from left and right sublists.
        while i < (end-start) && l < (pivot-start) && r < (end-pivot):
            if lhs[l] <= rhs[r]:
                items[i] = lhs[l]
                l=l+1
            else:
                items[i] = rhs[r]
                r=r+1
            i=i+1
        // Tidy up remaining items in left sublist
        while l < (pivot-start):
            items[i] = lhs[l]
            i=i+1
            l=l+1
        // Tidy up remaining items in right sublist
        while r < (end-pivot):
            items[i] = rhs[r]
            i=i+1
            r=r+1
        // Done
    return items

method main(System.Console sys):
    int|null n = Int.parse(sys.args[0])
    if n != null:
        int max = n
        // Create a reverse array
        int index = 0
        int[] arr = [0;max]
        //Fill in the array in the reverse order (max..0)
        while index < max:
            arr[index] = max - index
            index = index + 1
        //Use merge sort to order reversed array 'arr' ([10 ... 0])
        arr = sortV1(arr, 0, max)
        // Should be in the ascending order [0..10]
        sys.out.println(arr[0])
        sys.out.println(arr[max-1])
        sys.out.println_s("Pass Mergesort test case")
