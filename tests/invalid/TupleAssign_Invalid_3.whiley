
type tac3ta is {int f1, int f2} where f1 < f2

method main(System.Console sys) => void:
    {int f1, int f2} x = {f1: 2, f2: 3}
    tac3ta y = {f1: 1, f2: 3}
    x.f1 = 1
    debug Any.toString(x)
    debug Any.toString(y)
    assert x != y
