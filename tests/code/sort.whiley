
import whiley.lang.*


/**
 * Perform a merge sort of integer items.
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
 * Perform a merge sort of integer items.
 * param items the input array
 * param start the starting index
 * param end the ending index
 * return the sorted array
 */
//function sort(&[int] items) -> [int]:
function sort([int] items, int start, int end) -> [int]:
//function sort([int] items, int start, int end, System.Console sys) -> [int]:
     // Check the length is > 1.
    if (start+1) < end:
        // First, split unsorted items into left and right sub-lists 
        int pivot = (start+end) / 2
        //sys.out.println(pivot)
        // Get the sublist
        [int] lhs = items[..pivot]
        // Recursively split left sublist
        lhs = sort(lhs, 0, |lhs|)
        // Get the sublist
        [int] rhs = items[pivot..]
        // Recursively Split right sublist
        rhs = sort(rhs, 0, |rhs|)
        //sys.out.println(lhs)
        //sys.out.println(rhs)
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
    //sys.out.println(items)
    return items

//method main(System.Console sys):
public export method test() -> void:
    /*  For testing only.*/
    [int] xs = []
    xs = sort(xs, 0, |xs|)
    assert xs == []
    xs = [4,3,5,2,1]
    xs = sort(xs, 0, |xs|)
    assert xs == [1,2,3,4,5]
    xs = [3,4,7,1,2]
    xs = sort(xs, 0, |xs|)
    assert xs == [1,2,3,4,7]
    xs = [3,4,7,2]
    xs = sort(xs, 0, |xs|)
    assert xs == [2,3,4,7]
    xs = [1,2,3,4]
    xs = sort(xs, 0, |xs|)
    assert xs == [1,2,3,4]
    xs = [1,2,3,4,5]
    xs = sort(xs, 0, |xs|)
    assert xs == [1,2,3,4,5]
    /**Merge sorting on a reverse array ([10 ... 0])*/
    int max = 10
    [int] ys = []
    int index = 0
    //Fill in the array in the reverse order (max..0)
    while index <= max:
        ys = ys ++ [max - index] 
        index = index + 1
    //Use merge sort to sort the array
    ys = sort(ys, 0, |ys|)
    // Should be in the ascending order [0..10]
    assert ys == [0,1,2,3,4,5,6,7,8,9,10]