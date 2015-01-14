import whiley.lang.System

function f(int x) => int:
    if x < 10:
        return 1
    else:
        if x > 10:
            return 2
    return 0

method main(System.Console sys) => void:
    int r = f(1)
    sys.out.println(Any.toString(r))
