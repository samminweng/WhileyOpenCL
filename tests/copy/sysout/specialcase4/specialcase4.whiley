import whiley.lang.*
// a, b and c maybe returned
// a, b and c are read-write
function func(int[] a, int[] b, int[] c) -> int[]:
	int[] x = a // no copy
	x = b // no copy
	x = c // no copy
	return x
// Method 'main'
public method main(System.Console console):
	int[] a = [1; 2]
	int[] b = [2; 2]
	int[] c = [3; 2]
	int[] r = func(a, b, c) // Copy a, b and c
	assert a[0] == 1 //Live_a
	assert b[0] == 2 //Live_b
	assert c[0] == 3 //Live_c
	assert r[0] == 3