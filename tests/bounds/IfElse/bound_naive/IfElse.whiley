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
    sys.out.println(f(1))
    sys.out.println(f(10))
    sys.out.println(f(11))
    sys.out.println(f(1212))
    sys.out.println(f(-1212))
