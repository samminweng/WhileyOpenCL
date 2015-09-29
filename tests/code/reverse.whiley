import whiley.lang.*

// The original reverse function creates an new array 
// and gradually fills in values. 
function reverse(int[] ls) -> int[]:
    int[] r = [0;|ls|]
    int i = |ls|
    int j = 0
    while i > 0 where i <= |ls|:
        i = i - 1
        r[j] = ls[i]
        j = j + 1
    return r

// The transformed reversed function with r_size and r_capacity
/*function reverse(int[] ls) -> int[]:
    int r_capacity = |ls|
    int[] r = ls
    int r_size = 0
    int i = |ls|
    while i > 0 where i <= |ls| && r_size >= 0 :
        i = i - 1
        r[r_size] = ls[i]
        r_size = r_size +1
    assert r_size == r_capacity
    return r
*/

//method main(System.Console sys):
public export method test() -> void:
    int[] xs = [0,1,2,3,4,5]
    int[] rs = reverse(xs)
    assert rs == [5,4,3,2,1,0]
	//sys.out.println(rs)