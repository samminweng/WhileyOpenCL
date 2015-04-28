import whiley.lang.System

function reverse([int] ls) -> [int]:
    int i = |ls|
    [int] r = []
    while i > 0 where i <= |ls|:
        i = i - 1
        r = r ++ [ls[i]]
    return r
   
/*function rewrite_reverse([int] ls) => [int]:
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

method main(System.Console sys) -> void:
    [int] rs = reverse([1, 2, 3, 4, 5])
    sys.out.println(rs)
