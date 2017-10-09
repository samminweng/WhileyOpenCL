import whiley.lang.*
// Function 'func' may change 'a' array and may return 'b' array
function add(int[] a, int[] b) -> int[]:
    int length = |a|
    int[] r = [0;length]
    int i = 0
    while i < length:
        int aa = a[i]
        int bb = b[i]
        a[i] = aa + bb
        b[i] = 0
        i = i + 1
    return a

method main(System.Console sys):
    int[] a = [0;10] // b[0] = 0
    int i = 0
    while i < 10:
        a[i] = i
        i = i + 1
    // Pass the same 'a' to function 'add'
    int[] sum = add(a, a)
    i = 0
    while i < 10:
        sys.out.println(sum[i])
        assert sum[i] == 2 * i
        i = i + 1
