import whiley.lang.System

type Expr is int | {int op, Expr left, Expr right}

method main(System.Console sys) => void:
    Expr e = 1
    sys.out.println(Any.toString(e))
