import whiley.lang.*

// The 'func' function does not change 'x' array and may return 'x' array
function func(int[] x, int num) -> int[]:
    x[0] = num
    return x

function g1() -> int[]:
    int[] a = [0;3] // a[0] =0
    int[] b = func(a, 11)
    // b[0] = 11 and a is live after function call
    // Therefore, we use caller macro, not reset macro
    return a

method main(System.Console sys):
    int[] a = g1()
    assert a[0] == 0
    sys.out.print_s("a[0] = ")
    sys.out.println(a[0])
