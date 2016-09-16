import whiley.lang.*

function f(int x) -> (int r)
ensures r > 0:
    if x < 10:
        // Return a short integer
        return 32767
    else:
        if x > 10:
            // Return a long integer 
            return 2147483647
    // Return a long long integer
    return 9223372036854775807

method main(System.Console sys):
    // a: uint16_t
    int a = f(1) 
    assert a == 32767
    sys.out.println(a)
    // b: uint64_t
    int b = f(10) 
    assert b == 9223372036854775807
    sys.out.println(b)
    // c: uint32_t
    int c = f(11) 
    assert c == 2147483647
    sys.out.println(c)
    // d = [32767..2147483647] d: uint32 
    int d = f(1212)
    sys.out.println(d)
    d = f(-1212)
    sys.out.println(d)
