import whiley.lang.System

function reverse([int] ls) => [int]:
    int i = |ls|
    [int] r = []
    while i > 0 where i <= |ls|:
        i = i - 1
        r = r ++ [ls[i]]
    return r
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

method main(System.Console sys) => void:
	//Create the input list using the for loop. 
	[int] xs = []
	for i in 1..1000:
		xs = xs ++ [i]
	[int] rs = reverse(xs)
	sys.out.println(Any.toString(rs))