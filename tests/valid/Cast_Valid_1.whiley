import whiley.lang.System

type R1 is {real x}

function f(int i) => real:
    return (real) i

method main(System.Console sys) => void:
    sys.out.println(Any.toString(f(1)))
