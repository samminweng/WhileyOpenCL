
function f([int] ls) => void
requires some { i in {0, 1, 2, 3} | (i >= 0) && ((i < |ls|) && (ls[i] < 0)) }:
    debug Any.toString(ls)

function g([int] ls) => void
requires |ls| > 0:
    f(ls)

method main(System.Console sys) => void:
    g([1, 2, 3])
