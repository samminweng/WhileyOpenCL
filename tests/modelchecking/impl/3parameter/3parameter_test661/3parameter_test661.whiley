import whiley.lang.*

function func(int[] a, int[] b, int[] c) -> int[]:
	a[0] = 0	//ReadWrite_a
	int rb = b[0]	//ReadOnly_b
	int rc = c[0]	//ReadOnly_c
	return a	//AlwaysReturn_a
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = [2; 2]
	int[] r = func(a, b, c)
