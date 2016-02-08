import whiley.lang.*

method main(System.Console sys):
    function(int) -> int twice = &(int x -> x*2)
    sys.out.println(twice(3))
    //function () -> int f = &(null n -> twice(3))
    //sys.out.println(f(null))

