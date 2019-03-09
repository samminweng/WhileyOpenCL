import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

function func(int[] b, int[] c, int i) -> (int[] a) :
	if i >= 2:
		int b1 = b[1]
		a = func(b, c, i-1)  // call1
		a[1] = b[0]
		assert b1 == b[1]
		return a
	else if i == 1:
		a = func(c, b, i-1)  // call2
		return a
	else:
		return c

method main(System.Console sys):
	int[] b = [0,1,2] // [0,0,0]
	int[] c = [3,4,5] // [1,1,1]
	//assert func(b, c, 0) == [3,4,5]
	//assert func(b, c, 1) == [0,1,2]
	//assert func(b, c, 2) == [0,0,2]
	sys.out.println(func(b, c, 1))
	sys.out.println(func(b, c, 2))