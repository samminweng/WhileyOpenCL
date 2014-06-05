import whiley.lang.System

type Func is {
    function (int)=>int read
}

function id(int x) => int:
    return x

function test(Func f, int arg) => int:
    return f.read(arg)

method main(System.Console sys) => void:
    int x = test({read: &id}, 123)
    sys.out.println("GOT: " ++ Any.toString(x))
    x = test({read: &id}, 12545)
    sys.out.println("GOT: " ++ Any.toString(x))
    x = test({read: &id}, -11)
    sys.out.println("GOT: " ++ Any.toString(x))
