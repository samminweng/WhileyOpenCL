import whiley.lang.*

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
    sys.out.println(a)
    int b = f(10)
    sys.out.println(b)
    /*int c = f(11)
    sys.out.println(c)
    int d = f(1212)
    sys.out.println(d)
    int e = f(-1212)
    sys.out.println(e)*/
