import whiley.lang.*
method main(System.Console sys):
    // Begin of 1st block
    int[] a = [0;5]  // {}
    int[] b = a      // {a}
    // End of 1st block
    b[0] = 1         // {a, b}
    // End of 2nd block
    assert a[0] == 0 // {a, b}
    assert b[0] == 1 // {a, b}
    sys.out.print_s("a[0] = ") // {a, b}
    sys.out.println(a[0])      // {a, b}
    sys.out.print_s("b[0] = ") // {b}
    sys.out.println(b[0])      // {b}
    sys.out.print_s("Pass livecheck1 test case")
    // End of 3rd block
