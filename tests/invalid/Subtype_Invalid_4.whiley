
type scf4set is ({int} set) where |set| > 0

function f(scf4set x) => int:
    return 1

method main(System.Console sys) => void:
    {int} x = {}
    f(x)
