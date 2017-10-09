import whiley.lang.*

function reverse(int[] ls) -> int[]:
    int i = |ls|
    int[] r = [0; |ls|]
    while i > 0 where i <= |ls| && |r| == |ls|:
        int item = ls[|ls|-i]
        i = i - 1
        r[i] = item
    return r

method main(System.Console sys):
    // Generated a reversed array 'arr'
    int[] input = [0;10]
    int index = 0
    // Fill in the array (10, 9, 8, 7, ..., 2, 1)
    while index < 10:
        input[index] = 10 - index
        index = index + 1
    // Re-order the array
    int[] tmp = reverse(input)
    // Check the first element of input array
    assert input[0] == 10

    int[] output = tmp
    // Check the first element of output array
    assert output[0] == 1
