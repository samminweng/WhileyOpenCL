import whiley.lang.System

function reverse(int[] ls) -> int[]:
    int i = |ls|
    int[] r = [0; |ls|]
    while i > 0 where i <= |ls| && |r| == |ls|:
        int item = ls[|ls|-i]
        i = i - 1
        r[i] = item
    return r

method main(System.Console sys):
    int[] rs = reverse([1, 2, 3, 4, 5])
    assert rs == [5,4,3,2,1]
    sys.out.println(rs)
    int[] rs2 = reverse([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    sys.out.println(rs2)
/* The transformed reversed function with r_size and r_capacity
function reverse([int] ls) => [int]:
    int i = |ls|
    int r_capacity = |ls|
    [int] r = ls
    int r_size = 0
    while i > 0 where i <= |ls| && r_size >= 0 :
        i = i - 1
        r[r_size] = ls[i]
        r_size = r_size +1
    assert r_size == r_capacity
    return r
*/
