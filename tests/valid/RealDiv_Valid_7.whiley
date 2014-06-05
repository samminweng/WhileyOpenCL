import whiley.lang.System

function diver(real x, real y, real z) => real
requires y != 0 && z != 0:
    //
    return (x / y) / z

method main(System.Console sys) => void:
    sys.out.println(Any.toString(diver(1.2, 3.4, 4.5)))
    sys.out.println(Any.toString(diver(1000, 300, 400)))
