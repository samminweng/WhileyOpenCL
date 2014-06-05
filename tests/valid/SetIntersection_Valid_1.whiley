import whiley.lang.System

function f({int} xs) => string
requires xs ⊆ {1, 2, 3}:
    return Any.toString(xs)

function g({int} ys) => string:
    return f(ys & {1, 2, 3})

method main(System.Console sys) => void:
    sys.out.println(g({1, 2, 3, 4}))
    sys.out.println(g({2}))
    sys.out.println(g({}))
