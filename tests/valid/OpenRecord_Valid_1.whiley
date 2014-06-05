import whiley.lang.System

type OpenRecord is {int field, ...}

function getField(OpenRecord r) => int:
    return r.field

method main(System.Console sys) => void:
    OpenRecord r = {field: 1}
    sys.out.println(getField(r))
    r = {field: 2, x: "hello"}
    sys.out.println(getField(r))
    r = {field: 3, y: 2, x: 1}
    sys.out.println(getField(r))
