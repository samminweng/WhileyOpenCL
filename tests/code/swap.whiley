import whiley.lang.System
function swap(int[] xs, int i0, int i1) -> int[]:
    int v0 = xs[i0]
    int v1 = xs[i1]
    int sum = v0 + v1
    xs[i0] = v1
    xs[i1] = v0
    return xs

//method main(System.Console sys):
public export method test() -> void:
    int[] xs = [0,1,2,3,4,5]
    //Aliased. Copy of xs needed before calling swap
    //(or inside swap) if swap mutates xs.
    int[] ys = swap(xs, 3, 5)
    assert ys == [0,1,2,5,4,3]
    assert xs == [0,1,2,3,4,5]
	//Not aliased, so no copy needed
    xs = swap(xs,3,5)
    assert xs == [0,1,2,5,4,3] 