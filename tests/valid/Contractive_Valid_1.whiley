

type Contractive is Contractive | null

function f(Contractive x) -> Contractive:
    return x

public export method test() -> void:
    x = f(null)
    assume x == null
