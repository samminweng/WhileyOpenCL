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
    int a = f(1) //short int
    assert a == 32767
    sys.out.println(a)
    int b = f(10) // long long
    assert b == 9223372036854775807
    sys.out.println(b)
    int c = f(11) // long int
    assert c == 2147483647
    sys.out.println(c)
    /*int d = f(1212)
    sys.out.println(d)
    int e = f(-1212)
    sys.out.println(e)*/
