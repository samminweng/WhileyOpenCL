
function f({int} ls) -> bool
requires some { i in ls | i < 0 }:
    return true

function g({int} ls) -> void:
    f(ls)
