
import whiley.lang.*

/**
 * Original version :Perform a merge sort of integer items.
 */
/*function sort([int] items) -> [int]:
    //
    if |items| > 1:
        // First, sort left and right sub-lists
        int pivot = |items| / 2
        [int] lhs = sort(items[..pivot])
        [int] rhs = sort(items[pivot..])
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
function sortV1([int] items, int start, int end) -> [int]:
     // Check the length is > 1.
    if (start+1) < end:
        // First, split unsorted items into left and right sub-lists 
        int pivot = (start+end) / 2
        //sys.out.println(pivot)
        // Get the sublist
        [int] lhs = items[..pivot]
        // Recursively split left sublist
        lhs = sortV1(lhs, 0, |lhs|)
        // Get the sublist
        [int] rhs = items[pivot..]
        // Recursively Split right sublist
        rhs = sortV1(rhs, 0, |rhs|)
        // Second, merge left and right sublists into
        // original list.
        int l = 0   // Starting index of left sublist
        int r = 0   // Starting index of right sublist
        int i = 0   // Starting index of items list
        // Update items with the smaller element from left and right sublists.
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
method sortV2(&([int]) items, int start, int end):
    // Check the length is > 1.
    if (start+1) < end:
        // First, split unsorted items into left and right sub-lists 
        int pivot = (start+end) / 2
        //sys.out.println(pivot)
        // Get the sublist
        &([int]) lhs = new (*items)[..pivot]
        // Recursively split left sublist
        sortV2(lhs, 0, |(*lhs)|)
        // Get the sublist
        &([int]) rhs = new (*items)[pivot..]        
        // Recursively Split right sublist
        sortV2(rhs, 0, |(*rhs)|)
        // Second, merge left and right sublists into
        // original list.
        int i = 0   // Starting index of items list
        int l = 0   // Starting index of left sublist
        int r = 0   // Starting index of right sublist
        // Update items with the smaller element from left and right sublists.
        while i < |(*items)| && l < |(*lhs)| && r < |(*rhs)|:
            if (*lhs)[l] <= (*rhs)[r]:
                (*items)[i] = (*lhs)[l]
                l=l+1
            else:
                (*items)[i] = (*rhs)[r]
                r=r+1
            i=i+1
        // Tidy up remaining items in left sublist
        while l < |(*lhs)|:
            (*items)[i] = (*lhs)[l]
            i=i+1
            l=l+1
        // Tidy up remaining items in right sublist
        while r < |(*rhs)|:
            (*items)[i] = (*rhs)[r]
            i=i+1
            r=r+1
    // Done


method main(System.Console sys):
//public export method test() -> void:
    /*  For testing call-by-reference sortV2 method*/
    &([int]) xs = new []
    sortV2(xs, 0, |(*xs)|)
    assert (*xs) == []
    xs = new [4,3,5,2,1]
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
    [int] arr = []
    //Fill in the array in the reverse order (max..0)
    while index <= max:
        arr = arr  ++ [max - index] 
        index = index + 1
    //Assign 'arr' to input array
    xs = new arr
    // Use merge sort to sort the array
    sortV2(xs, 0, |(*xs)|)
    // Should be in the ascending order [0..10]
    assert (*xs) == [0,1,2,3,4,5,6,7,8,9,10]
    sys.out.println((*xs))
    /* For testing call-by-value sortV1 function*/
    [int] ys = []
    ys = sortV1(ys, 0, |ys|)
    assert ys == []
    ys = [3,4,7,1,2]
    ys = sortV1(ys, 0, |ys|)
    assert ys == [1,2,3,4,7]
    ys = [3,4,7,2]
    ys = sortV1(ys, 0, |ys|)
    assert ys == [2,3,4,7]
    ys = [1,2,3,4]
    ys = sortV1(ys, 0, |ys|)
    assert ys == [1,2,3,4]
    ys = [1,2,3,4,5]
    ys = sortV1(ys, 0, |ys|)
    assert ys == [1,2,3,4,5]
    //Use merge sort to sort the array
    ys = arr
    ys = sortV1(ys, 0, |ys|)
    // Should be in the ascending order [0..10]
    assert ys == [0,1,2,3,4,5,6,7,8,9,10]
    sys.out.print(ys)