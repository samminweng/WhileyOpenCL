import whiley.lang.*
// The 'func' function may change 'b' array and may return 'b' array
function func(int[] b, int num) -> int[]:
    int[] c = [0;3] // c[0] = 0
    if num > 10:
        b[0] = num
        return b
    else:
        return c

method main(System.Console sys):
    int[] b = [2;3] // b[0] = 2
    int[] tmp = func(b, 11)
    // x is not live after function call
    // So we use reset macro
    b = tmp
    assert b[0] == 11
    sys.out.println(b[0])
    b = func(b, 65536) // d(b) = [2..65536]
    sys.out.println(b[0])
    assert b[0] == 65536
