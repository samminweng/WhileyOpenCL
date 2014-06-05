import whiley.lang.System

type Tup1 is (int, int)

type Tup2 is (real, real)

function f(Tup1 x) => Tup2:
    return x

method main(System.Console sys) => void:
    Tup2 x = f((1, 2))
    sys.out.println(Any.toString(x))
