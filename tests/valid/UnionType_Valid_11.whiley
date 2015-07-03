

type tenup is (int x) where x > 10

type msg1 is {tenup op, [int] data}

type msg2 is {int index}

type msgType is msg1 | msg2

function f(msgType m) -> msgType:
    return m

public export method test() -> void:
    msg1 m1 = {op: 11, data: []}
    msg2 m2 = {index: 1}
    assume f(m1) == {op: 11, data: []}
    assume f(m2) == {index: 1}
