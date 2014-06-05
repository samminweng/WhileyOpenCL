import whiley.lang.System

constant ADD is 1

constant SUB is 2

constant MUL is 3

constant DIV is 4

type binop is {int op, Expr left, Expr right}

type asbinop is {int op, Expr left, Expr right}

type Expr is int | binop

method main(System.Console sys) => void:
    Expr bop1 = {op: ADD, left: 1, right: 2}
    Expr bop2 = bop1
    Expr e1 = bop1
    Expr e2 = {op: SUB, left: bop1, right: 2}
    sys.out.println(Any.toString(e1))
    sys.out.println(Any.toString(e2))
