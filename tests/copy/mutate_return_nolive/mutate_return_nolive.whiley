import whiley.lang.*

function f(int[] ls) -> int[]:
   	ls[0] = 0
   	return ls

method main(System.Console sys):
	int[] b = [1, 2, 3]
	int[] a = f(b)
	assert a == [0, 2, 3]
	assert b == [0, 2, 3]