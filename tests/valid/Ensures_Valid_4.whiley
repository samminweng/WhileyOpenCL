import whiley.lang.System

function f(int x) => (int r)
requires x >= 0
ensures r >= 0 && x >= 0:
    return x

method main(System.Console sys) => void:
    sys.out.println(Any.toString(f(10)))
