import whiley.lang.*
// x variable should be 'uint16_t'
function f(int x) -> (int r)
ensures r > 0:
    if x < 10:
        return 1
    else:
        if x > 10: 
            return 2
    return 0

method main(System.Console sys):
    int a = f(1) 
    assert a == 1
    sys.out.println(a)
    int b = f(10) 
    assert b == 0
    sys.out.println(b)
    int c = f(11) 
    assert c == 2
    sys.out.println(c)
