import * from whiley.lang.*

method main(System.Console sys) => void:
    {int} xs = {1, 2, 3}
    {int} zs = { x + y | x in xs }
    sys.out.println(Any.toString(xs))
    sys.out.println(Any.toString(zs))
