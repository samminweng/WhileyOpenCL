import whiley.lang.*

// The 'func' function does not change 'x' array and may return 'x' array
function func(int[] x, int num) -> int[]:
    int[] a = [0;3] // a[0] = 0
    int[] b = [1;3] // b[0] = 1
    int[] c = a
    int[] d = b
    if num > 10:
        return x // x[0] =2
    else:
        if num >9:
            return c // c[0] = a[0] = 0
    return d // d[0] = b[0] = 1
method main(System.Console sys):
    int[] x = [2;3] // x[0] = 2
    int[] y = func(x, 11)
    // x is not changed but returned
    // So we use caller macro
    assert y[0] == 2
    sys.out.print_s("y[0] = ")
    sys.out.println(y[0])
    y = func(x, 10)
    assert y[0] == 0
    sys.out.print_s("y[0] = ")
    sys.out.println(y[0])
    y = func(x, 9)
    assert y[0] == 1
    sys.out.print_s("y[0] = ")
    sys.out.println(y[0])
