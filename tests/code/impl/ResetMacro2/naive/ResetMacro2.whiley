import whiley.lang.*

// The 'func' function change 'x' array and return 'x' array
function func(int[] x, int num) -> int[]:
    x[0] = num
    return x

function g2() -> int[]:
    int[] a = [0;3] // a[0] =0
    int[] b = func(a, 11)
    // b[0] = 11 and b is live after function call
    // So we can use reset macro
    return b

method main(System.Console sys):
    int[] a = g2()
    assert a[0] == 11
    sys.out.print_s("a[0] = ")
    sys.out.println(a[0])
