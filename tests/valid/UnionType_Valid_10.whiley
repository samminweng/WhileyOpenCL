

type tenup is int

type msg1 is {tenup op, [int] data}

type msg2 is {int index}

type msgType is msg1 | msg2

function f(msgType m) -> msgType:
    return m

public export method test() -> void:
    msg1 x = {op: 11, data: []}
    assume f(x) == {op: 11, data: []}
