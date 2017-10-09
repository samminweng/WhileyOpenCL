import whiley.lang.*

// The 'func' function does not change 'x' array and may return 'x' array
function func(int[] x, int num) -> int[]:
    x[0] = num
    return x

function g3(int x) -> int[]:
    int[] a = [0;3] // a[0] =0
    int[] b = func(a, 11)
    // a[0] = 0 and a is live after function call
    // So we use Caller macro
    if x > 0:
        return a
    else:
        return b

method main(System.Console sys):
    int[] a = g3(1)
    assert a[0] == 0
    sys.out.print_s("a[0] = ")
    sys.out.println(a[0])
    int[] b = g3(0)
    assert b[0] == 11
    sys.out.print_s("b[0] = ")
    sys.out.println(b[0])
