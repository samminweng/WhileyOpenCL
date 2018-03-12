import whiley.lang.*
// Function 'func' may change 'b' array and may return 'b' array
// If not, return new array 'c'
function func(int[] b, int num) -> int[]:
    int[] c = [0;3] // c[0] = 0
    if num > 10:
        b[0] = num
        return b
    else:
        return c
// Method 'main'
method main(System.Console sys):
    int[] b = [2;3] // b[0] = 2
    int[] tmp = func(b, 11) // function call
    assert b[0] == 2
    assert tmp[0] == 11
    sys.out.println(b[0])
