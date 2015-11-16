import whiley.lang.System
function swap(int[] xs, int i0, int i1) -> int[]:
    int v0 = xs[i0]
    int v1 = xs[i1]
    int sum = v0 + v1
    xs[i0] = v1
    xs[i1] = v0
    return xs

method main(System.Console sys):
    int[] xs = [0,1,2,3,4,5]
    int[] ys = swap(xs, 3, 5)
    assert ys == [0,1,2,5,4,3]
    assert xs == [0,1,2,3,4,5]
    xs = swap(xs,3,5)
    assert xs == [0,1,2,5,4,3] 