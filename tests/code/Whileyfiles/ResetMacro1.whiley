import whiley.lang.*

// The 'func' function change 'x' array and return 'x' array
function func(int[] x, int num) -> int[]:
    x[0] = num
    return x

method main(System.Console sys):
    int[] x = [2;3] // x[0] = 2
    int[] tmp = func(x, 11)
    // x is not live after function call
    // So we use reset macro
    x = tmp
    assert x[0] == 11
    sys.out.print_s("x[0] = ")
    sys.out.println(x[0])
