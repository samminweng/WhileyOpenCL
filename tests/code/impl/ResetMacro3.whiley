import whiley.lang.*
// The 'func' function may change 'x' array and may return 'x' array
function func(int[] x, int num) -> int[]:
    int[] a = [0;3] // a[0] = 0
    int b = 10
    if num > b:
        x[0] = num
        return x
    else:
        return a

method main(System.Console sys):
    int[] x = [2;3] // x[0] = 2
    int num = 11
    int[] tmp = func(x, num)
    // x is not live after function call
    // So we use reset macro
    x = tmp
    assert x[0] == 11
    sys.out.print_s("x[0] = ")
    sys.out.println(x[0])
