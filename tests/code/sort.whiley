import whiley.lang.*

/**
 * Original version :Perform a merge sort of integer items.
 */
/*function sort(int[] items) -> int[]:
    //
    if |items| > 1:
        // First, sort left and right sub-lists
        int pivot = |items| / 2
        int[] lhs = sort(Array.slice(items,0,pivot))
        int[] rhs = sort(Array.slice(items,pivot,|items|))
        // Second, merge left and right sublists into
        // original list.
        int l = 0 // left sublist index
        int r = 0 // right sublist index
        int i = 0 // items index
        while i < |items| && l < |lhs| && r < |rhs|:
            if lhs[l] <= rhs[r]:
                items[i] = lhs[l]
                l=l+1
            else:
                items[i] = rhs[r]
                r=r+1
            i=i+1
        // Tidy up remaining items in left sublist
        while l < |lhs|:
            items[i] = lhs[l]
            i=i+1
            l=l+1
        // Tidy up remaining items in right sublist
        while r < |rhs|:
            items[i] = rhs[r]
            i=i+1
            r=r+1
    // Done
    return items
*/
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
function sortV1(int[] items, int start, int end) -> int[]:
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

//method main(System.Console sys):
public export method test() -> void:
    /* For testing call-by-value sortV1 function*/
    int[] ys = [3,4,7,1,2]
    ys = sortV1(ys, 0, 5)
    assert ys == [1,2,3,4,7]
    ys = [3,4,7,2]
    ys = sortV1(ys, 0, 4)
    assert ys == [2,3,4,7]
    ys = [1,2,3,4]
    ys = sortV1(ys, 0, 4)
    assert ys == [1,2,3,4]
    ys = [1,2,3,4,5]
    ys = sortV1(ys, 0, 5)
    assert ys == [1,2,3,4,5]
    //Merge sorting on a reverse array 'arr' ([10 ... 0])
    int max = 10
    int index = 0
    int[] arr = [0;max+1]
    //sys.out.println(arr)
    //Fill in the array in the reverse order (max..0)
    while index <= max:
        arr[index] = max - index 
        index = index + 1
    //Use merge sort to sort the array
    arr = sortV1(arr, 0, max+1)
    // Should be in the ascending order [0..10]
    //sys.out.println(arr)
    assert arr == [0,1,2,3,4,5,6,7,8,9,10]
    