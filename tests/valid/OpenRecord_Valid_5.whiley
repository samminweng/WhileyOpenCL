import whiley.lang.System

type Point is {int y, int x, ...}

type VecPoint is [Point] | Point

function sum(VecPoint vp) => int:
    if vp is Point:
        return vp.x + vp.y
    else:
        int r = 0
        for p in vp:
            r = r + sum(p)
        return r

method main(System.Console sys) => void:
    VecPoint vp = {y: 2, x: 1}
    sys.out.println(sum(vp))
    vp = [{y: 2, x: 1}, {y: 2, x: 1}]
    sys.out.println(sum(vp))
