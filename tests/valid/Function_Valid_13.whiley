

type Point is {int y, int x} where x != y

function f(int x) -> int:
    return x

function Point(int i, int j) -> Point:
    if f(i) != f(j):
        return {y: j, x: i}
    else:
        return {y: -1, x: 1}

public export method test() -> void:
    Point rs = Point(1, 1)
    assume rs == {x:1,y:-1}
    rs = Point(1, 2)
    assume rs == {x:1,y:2}
