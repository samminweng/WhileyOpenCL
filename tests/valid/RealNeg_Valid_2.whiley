import whiley.lang.System

function f(real x) => real:
    return -x

method main(System.Console sys) => void:
    sys.out.println(Any.toString(f(1.2)))
    sys.out.println(Any.toString(f(0.00001)))
    sys.out.println(Any.toString(f(5632)))
