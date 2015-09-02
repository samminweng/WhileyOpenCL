import whiley.io.File.*
import whiley.lang.*

/**
 * Perform a merge sort of integer items.
 */
function sort([int] items) -> [int]:
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

method main(System.Console sys):  
    /**Benchmark merge sorting**/
    int|null max = Int.parse(sys.args[0])
    if max != null:
        [int] ys = []
        int index = 0
        /**Fill in the array in the reverse order (max..0)**/
        while index <= max:
            ys = ys ++ [max - index] 
            index = index + 1
        /**Use merge sort to sort the array**/
        ys = sort(ys)
        /**Check the last element of sorted array */
        assert ys[max] == max
        /** Print out the sorted array */
        sys.out.println(ys[max])