import whiley.lang.*

function reverse(int[] ls) -> int[]:
    int i = |ls|
    int[] r = [0; |ls|]
    while i > 0 where i <= |ls| && |r| == |ls|:
        int item = ls[|ls|-i]
        i = i - 1
        r[i] = item
    return r

//public export method test() -> void:
method main(System.Console sys):
    //int[] rs = reverse([1, 2, 3, 4, 5])
    //assume rs == [5,4,3,2,1]
    int|null max = Int.parse(sys.args[0])
    if max != null:
        //Merge sorting on a reverse array 'arr' ([max ... 0])
        int index = 0
        int[] arr = [0;max+1]
        //sys.out.println(arr)
        //Fill in the array in the reverse order (max..0)
        while index <= max:
            arr[index] = max - index 
            index = index + 1
        //Sort the array
        arr = reverse(arr)
        /**Check the last element of sorted array */
        assert arr[0] == 0
        assert arr[max] == max
        /** Print out the successful message */
        sys.out.print_s("Pass Reverse test case")
