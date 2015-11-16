import whiley.lang.*

method main(System.Console sys):
    int[] a = [0,0,0,0,0]
    int[] b = [1,1,1,1,1]
    int[] tmp = a
    a = b
    b = tmp
    assert a == [1,1,1,1,1]
    assert b == [0,0,0,0,0]