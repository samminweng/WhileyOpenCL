import whiley.lang.System
import * from whiley.lang.Int

function g(int x) => (int r)
// Return is between 0 and 125 (exclusive)
ensures r > 0 && r < 125:
    //
    if (x <= 0) || (x >= 125):
        return 1
    else:
        return x

function f(int x) => {i8}:
    return {g(x)}

method main(System.Console sys) => void:
    {i8} bytes = f(0)
    sys.out.println(Any.toString(bytes))
