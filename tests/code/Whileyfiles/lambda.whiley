import whiley.lang.*

method main(System.Console sys):
    function(int) -> int twice = &(int x -> x*2)
    assert twice(3) == 6
    function () -> int f = &(null n -> twice(3))
    assert f(null) == 6

