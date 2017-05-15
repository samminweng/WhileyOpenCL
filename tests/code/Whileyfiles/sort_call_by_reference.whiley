import whiley.lang.*

/**
 * Perform a merge sort of integer items using call-by-value function
 * This function requires the return value to give back the change to
 * the caller.
 *
 * param items the input array
 * param start the starting index
 * param end the ending index
 * return the sorted array
 */
/*function sortV1(int[] items, int start, int end) -> int[]:
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
*/
/**
 * Perform a merge sort of integer items using pass-by-reference method.
 * As the input array is passed to the method by reference, the change
 * to the array is still visible, and return value can be avoided. 
 *  
 * param items the input array
 * param start the starting index
 * param end the ending index
 */
//method sort(&([int]) items, int start, int end, System.Console sys):
method sortV2(&(int[]) items, int start, int end):
    // Check the length is > 1.
    if (start+1) < end:
        // First, split unsorted items into left and right sub-lists 
        int pivot = (start+end) / 2
        //sys.out.println(pivot)
        // Get the sublist
        &(int[]) lhs = new Array.slice(*items, start, pivot)
        // Recursively split left sublist
        sortV2(lhs, 0, pivot)
        // Get the sublist
        &(int[]) rhs = new Array.slice(*items, pivot, end)       
        // Recursively Split right sublist
        sortV2(rhs, 0, end-pivot)
        // Second, merge left and right sublists into
        // original list.
        int i = 0   // Starting index of items list
        int l = 0   // Starting index of left sublist
        int r = 0   // Starting index of right sublist
        // Update items with the smaller element from left and right sublists.
        while i < (end - start) && l < (pivot-start) && r < (end-pivot):
            if (*lhs)[l] <= (*rhs)[r]:
                (*items)[i] = (*lhs)[l]
                l=l+1
            else:
                (*items)[i] = (*rhs)[r]
                r=r+1
            i=i+1
        // Tidy up remaining items in left sublist
        while l < (pivot-start):
            (*items)[i] = (*lhs)[l]
            i=i+1
            l=l+1
        // Tidy up remaining items in right sublist
        while r < (end-pivot):
            (*items)[i] = (*rhs)[r]
            i=i+1
            r=r+1
    // Done


//method main(System.Console sys):
public export method test() -> void:
    /*  For testing call-by-reference sortV2 method*/
    &(int[]) xs = new [4,3,5,2,1]
    sortV2(xs, 0, |(*xs)|)
    assert (*xs) == [1,2,3,4,5]
    xs = new [3,4,7,1,2]
    sortV2(xs, 0, |(*xs)|)
    assert (*xs) == [1,2,3,4,7]
    xs = new [3,4,7,2]
    sortV2(xs, 0, |(*xs)|)
    assert (*xs) == [2,3,4,7]
    xs = new [1,2,3,4]
    sortV2(xs, 0, |(*xs)|)
    assert (*xs) == [1,2,3,4]
    xs = new [1,2,3,4,5]
    sortV2(xs, 0, |(*xs)|)
    assert (*xs) == [1,2,3,4,5]
    //Merge sorting on a reverse array 'arr' ([10 ... 0])
    int max = 10
    int index = 0
    int[] arr = [0;max+1]
    //sys.out.println(arr)
    //Fill in the array in the reverse order (max..0)
    while index <= max:
        arr[index] = max - index 
        index = index + 1
    //Assign 'arr' to input array
    xs = new arr
    // Use call-by-reference merge sort to sort the array
    sortV2(xs, 0, |(*xs)|)
    // Should be in the ascending order [0..10]
    assert (*xs) == [0,1,2,3,4,5,6,7,8,9,10]