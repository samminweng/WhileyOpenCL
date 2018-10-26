import whiley.lang.*

function f(int[] a, int[] b) -> int[]:
    if a[0]==b[0]:
        return a
    else:
        return b

method main(System.Console sys):
    int[] a = [2;2]
    int[] b = f(a, a)
    sys.out.println(b[0])