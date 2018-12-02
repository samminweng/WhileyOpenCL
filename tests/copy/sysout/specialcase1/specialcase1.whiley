import whiley.lang.*
// a, b and c may be returned
// a, b and c are read-write
function func(int[] a, int[] b, int[] c) -> int[]:
	int ra = a[0]	
	int rb = b[0]	
	int rc = c[0]	
	if a[0] == b[0]:
		int[] y = a // no copy
		int[] x = b // no copy
		return x // return b
	else:
		int[] y = c // no copy
		int[] x = y // no copy
		return x // return a, c
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