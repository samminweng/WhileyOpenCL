import whiley.lang.*
function f(int[] a) -> int[]:
       a[0] = 10
       return a

method main(System.Console sys):
       int[] a = [0, 0, 0]
       int[] b = f(a)
       assert a[0] == 0
       assert b[0] == 10