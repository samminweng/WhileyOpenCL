
function f(int x) => string:
    return toString(x)
import toString from whiley.lang.Any

function g(real x) => string:
    return toString(x)

public method main(System.Console sys) => void:
    sys.out.println("FIRST: " ++ f(1))
    sys.out.println("SECOND: " ++ g(1.2344))
