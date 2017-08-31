import whiley.lang.*
// The 'func' function may change 'x' array and may return 'x' array
function func(int[] x, int num) -> int[]:
    int[] a = [0;3] // a[0] = 0
    if num > 10:
        x[0] = num
        return x
    else:
        return a

method main(System.Console sys):
    int[] x = [2;3] // x[0] = 2
    int[] tmp = func(x, 11)
    // x is not live after function call
    // So we use reset macro
    x = tmp
    assert x[0] == 11
    sys.out.print_s("x[0] = ")
    sys.out.println(x[0])
    x = func(x, 65536) // d(x) = [2..65536]
    assert x[0] == 65536
    sys.out.print_s("x[0] = ")
    sys.out.println(x[0])
    assert x[0] == 65536
