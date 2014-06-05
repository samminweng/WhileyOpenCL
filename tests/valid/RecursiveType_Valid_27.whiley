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

public method main(System.Console sys) => void:
    int i = -5
    while i < 10:
        SExpr e = sbuild(i)
        if e is SyntaxError:
            sys.out.println("syntax error: " ++ e.err)
        else:
            sys.out.println(Any.toString(e))
        i = i + 1
