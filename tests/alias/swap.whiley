import whiley.lang.System
function swap([int] xs, int i0, int i1) -> [int]:
    int v0 = xs[i0]
    int v1 = xs[i1]
    int sum = v0 + v1
    xs[i0] = v1
    xs[i1] = v0
    return xs

method main(System.Console console):
    [int] xs = [0,2,1,3,4]
    [int] ys = swap(xs,1,2)
    console.out.println(ys)