import whiley.lang.*

// The 'func' function does not change 'x' array and may return 'x' array
function func(int[] x, int num) -> int[]:
    x[0] = num
    return x

method main(System.Console sys):
    int[] x = [2;3] // x[0] = 2
    x = func(x, 11)
    assert x[0] == 11
    sys.out.print_s("x[0] = ")
    sys.out.println(x[0])
