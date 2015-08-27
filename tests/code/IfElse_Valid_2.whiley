import whiley.lang.*

function f(int x) -> int:
    if x < 10:
        return 1
    else:
        if x > 10:
            return 2
    return 0

method main(System.Console sys) -> void:
    assert f(1) == 1
    assert f(10) == 0
    assert f(11) == 2
    assert f(1212) == 2
    assert f(-1212) == 1
