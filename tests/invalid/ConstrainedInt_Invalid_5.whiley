
type c2nat is (int x) where x < 10

function f(c2nat x) => c2nat:
    x = x + 1
    return x

method main(System.Console sys) => void:
    debug Any.toString(f(9))
