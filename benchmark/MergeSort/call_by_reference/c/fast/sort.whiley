import whiley.io.File.*
import whiley.lang.*

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
method sort(&([int]) items, int start, int end):
    // Check the length is > 1.
    if (start+1) < end:
        // First, split unsorted items into left and right sub-lists 
        int pivot = (start+end) / 2
        //sys.out.println(pivot)
        // Get the sublist
        &([int]) lhs = new (*items)[..pivot]
        // Recursively split left sublist
        sort(lhs, 0, |(*lhs)|)
        // Get the sublist
        &([int]) rhs = new (*items)[pivot..]        
        // Recursively Split right sublist
        sort(rhs, 0, |(*rhs)|)
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
    /**Benchmark merge sorting**/
    int|null max = Int.parse(sys.args[0])
    if max != null:
        [int] arr = []
        int index = 0
        /**Fill in the array in the reverse order (max..0)**/
        while index <= max:
            arr = arr ++ [max - index] 
            index = index + 1
        //Assign arr to pointer variable 'ys'
        &([int]) ys = new arr
        /**Use merge sort to sort the array**/
        sort(ys, 0, |(*ys)|)
        /**Check the last element of sorted array */
        assert (*ys)[0] == 0
        assert (*ys)[max] == max
        /** Print out the sorted array */
        sys.out.println((*ys)[max])