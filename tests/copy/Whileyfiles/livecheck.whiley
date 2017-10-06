import whiley.lang.*
method main(System.Console sys):
    int[] a = [0;5] // a[0] = 0
    int[] b = [1;5] // b[0] = 1
    a = b // a[0] = 1
    int[] c = b // c[0] = 1
    int[] d = b // d[0] = 1
    b = [2;5] // b[0] = 2
    assert a[0] == 1
    assert b[0] == 2
    assert c[0] == 1
    assert d[0] == 1
    sys.out.print_s("a[0] = ")
    sys.out.println(a[0])
    sys.out.print_s("b[0] = ")
    sys.out.println(b[0])
    sys.out.print_s("c[0] = ")
    sys.out.println(c[0])
    sys.out.print_s("d[0] = ")
    sys.out.println(d[0])
    sys.out.print_s("Pass livecheck test case")
