type pos is (int p) where p > 0

type rec1 is {any f1, pos f2}

type rec2 is {int f1, int f2}

type rec12 is rec1 | rec2

function f(rec12 x) -> int:
    return 1

method main() -> int:
    rec1 r1 = {f1: "hello", f2: 2}
    rec2 r2 = {f1: 1, f2: 0}
    rec12 r3 = {f1: "hello", f2: 0}
    return f(r1) + f(r2) + f(r3)
