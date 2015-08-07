import whiley.lang.System
function swap([int] xs, int i0, int i1) -> [int]:
    int tmp0 = xs[i0]
    int tmp1 = xs[i1]
    xs[i0] = tmp1
    xs[i1] = tmp0
    return xs

method main(System.Console console):
    [int] xs = [0,2,1,3,4]
    console.out.println(xs)
    [int] r = swap(xs,1,2)
    console.out.println(r)