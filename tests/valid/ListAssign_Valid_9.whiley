import whiley.lang.System

function f() => ([int] rs)
// Returned list must have at least two elements
ensures |rs| > 1:
    //
    return [1, 2]

method main(System.Console sys) => void:
    [int] a1 = f()
    [int] a2 = f()
    a2[0] = 0
    sys.out.println(Any.toString(a1[0]))
    sys.out.println(Any.toString(a1[1]))
    sys.out.println(Any.toString(a2[0]))
    sys.out.println(Any.toString(a2[1]))
