

type Point is {int y, int x}

type Point3D is {int z, int y, int x}

type Points is Point | Point3D

public export method test(Points t) -> bool:
    if t is Point:
        return true
    else:
        return false

public export method test() -> void:
    Point3D p3d = {z: 3, y: 2, x: 1}
    assume test(p3d) == false
    Point p2d = {y: 2, x: 1}
    assume test(p2d) == true
