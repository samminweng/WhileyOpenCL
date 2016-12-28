import whiley.lang.*
// Reverse an integer array
function reverse(int[] arr) -> int[]:
    int i = |arr|
    int[] r = [0; |arr|]
    while i > 0 where i <= |arr| && |r| == |arr|:
        int item = arr[|arr|-i]
        i = i - 1
        r[i] = item
    return r

//public export method test() -> void:
method main(System.Console sys):
    int|null n = Int.parse(sys.args[0])
    if n != null:
        int max = n
        //Merge sorting on a reverse array 'arr' ([max ... 0])
        int index = 0
        int[] arr = [0;max]
        //sys.out.println(arr)
        //Fill in the array in the reverse order (max..0)
        while index < max:
            arr[index] = max - index 
            index = index + 1
        //Sort the array
        arr = reverse(arr)
        /**Print the last element of sorted array */
        sys.out.println(arr[0])
        sys.out.println(arr[max-1])
        /** Print out the successful message */
        sys.out.println_s("Pass Reverse test case")