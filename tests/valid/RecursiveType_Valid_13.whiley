import whiley.lang.System

constant ADD is 1

constant SUB is 2

constant MUL is 3

constant DIV is 4

type binop is {int op, expr left, expr right}

type expr is int | binop

method main(System.Console sys) => void:
    expr e1 = {op: ADD, left: 1, right: 2}
    expr e2 = {op: SUB, left: e1, right: 2}
    expr e3 = {op: SUB, left: {op: MUL, left: 2, right: 2}, right: 2}
    sys.out.println(Any.toString(e1))
    sys.out.println(Any.toString(e2))
    sys.out.println(Any.toString(e3))
