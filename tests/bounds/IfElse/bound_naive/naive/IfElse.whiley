import whiley.lang.*

function f(int x) -> (int r)
ensures r > 0:
    if x < 10:
        // Return a short integer
        return 1
    else:
        if x > 10:
            // Return a long integer 
            return 2
    // Return a long long integer
    return 0

method main(System.Console sys):
    // a: uint16_t
    int a = f(1) 
    assert a == 1
    sys.out.println(a)
    // b: uint64_t
    int b = f(10) 
    assert b == 0
    sys.out.println(b)
    // c: uint32_t
    int c = f(11) 
    assert c == 2
    sys.out.println(c)
    // d = [32767..2147483647] d: uint32 
    int d = f(1212)
    assert d == 2
    sys.out.println(d)
    int e = f(-1212)
    assert e == 1
    sys.out.println(d)
