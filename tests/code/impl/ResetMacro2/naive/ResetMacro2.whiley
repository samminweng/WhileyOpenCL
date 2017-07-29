import whiley.lang.*

// The 'func' function does not change 'x' array and may return 'x' array
function func(int[] x, int num) -> int[]:
    int[] a = [0;3] // a[0] = 0
    int[] b = [1;3] // b[0] = 1
    b = a // b[0] = 0
    int[] c = b // c[0] = 0
    int[] d = c // d[0] = 0
    if num > 10:
        return x // x[0] =2
    else:
        if num >9:
            return c // c[0] = 0
    return d // d[0] = 0
method main(System.Console sys):
    int[] x = [2;3] // x[0] = 2
    int[] y = func(x, 11)
    assert y[0] == 2
    sys.out.print_s("y[0] = ")
    sys.out.println(y[0])
    y = func(x, 10)
    assert y[0] == 0
    sys.out.print_s("y[0] = ")
    sys.out.println(y[0])
    y = func(x, 9)
    assert y[0] == 0
    sys.out.print_s("y[0] = ")
    sys.out.println(y[0])
