import whiley.lang.System

type tenup is int

type msg1 is {tenup op, [int] data}

type msg2 is {int index}

type msgType is msg1 | msg2

function f(msgType m) => string:
    return Any.toString(m)

method main(System.Console sys) => void:
    msg1 m1 = {op: 11, data: []}
    msg2 m2 = {index: 1}
    sys.out.println(f(m1))
    sys.out.println(f(m2))
