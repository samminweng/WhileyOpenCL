import whiley.lang.System

type Expr is real | Var | BinOp

type BinOp is {Expr rhs, Expr lhs}

type Var is {string id}

type SyntaxError is {string err}

type SExpr is SyntaxError | Expr

function build(int i) => Expr:
    if i > 10:
        return {id: "var"}
    else:
        if i > 0:
            return i
        else:
            return {rhs: build(i + 1), lhs: build(i + 10)}

function sbuild(int i) => SExpr:
    if i > 20:
        return {err: "error"}
    else:
        return build(i)

function evaluate(Expr e) => real:
    if e is real:
        return e
    if e is {string id}:
        return |e.id|
    else:
        return evaluate(e.lhs) + evaluate(e.rhs)

public method main(System.Console sys) => void:
    int i = -5
    while i < 10:
        SExpr e = sbuild(i)
        if e is {string err}:
            sys.out.println("syntax error: " ++ e.err)
        else:
            e = evaluate(e)
            sys.out.println(Any.toString(e))
        i = i + 1
