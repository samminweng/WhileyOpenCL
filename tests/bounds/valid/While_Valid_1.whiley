import whiley.lang.System

function reverse([int] xs) => ([int] ys)
// size of lists are the same
ensures |xs| == |ys|:
    int i = 0
    [int] zs = xs
    //
    while i<|xs| where i>=0 && |xs|==|zs|:
        int j = |xs| - (i+1)
        xs[i] = zs[j]
        i = i + 1
    return xs

method main(System.Console sys) => void:
    [int] rs = reverse([1, 2, 3, 4, 5, 6, 10])
    sys.out.println(Any.toString(rs))
