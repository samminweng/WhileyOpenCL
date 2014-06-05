import whiley.lang.System

type TYPE is null | int

function f([TYPE] xs, TYPE p) => int:
    int r = 0
    for x in xs:
        if x == p:
            return r
        r = r + 1
    return -1

method main(System.Console sys) => void:
    sys.out.println(Any.toString(f([null, 1, 2], null)))
    sys.out.println(Any.toString(f([1, 2, null, 10], 10)))
