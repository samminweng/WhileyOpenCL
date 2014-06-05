import whiley.lang.System

function f([int | real] e) => [int]:
    if e is [int]:
        return e
    else:
        return [1, 2, 3]

method main(System.Console sys) => void:
    sys.out.println(Any.toString(f([1, 2, 3, 4, 5, 6, 7])))
    sys.out.println(Any.toString(f([])))
    sys.out.println(Any.toString(f([1, 2, 2.01])))
    sys.out.println(Any.toString(f([1.23, 2, 2.01])))
