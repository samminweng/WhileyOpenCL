import whiley.lang.*

function func(int[] a, int[] b, int[] c) -> int[]:
	a[0] = 0	//ReadWrite_a
	b[0] = 0	//ReadWrite_b
	int rc = c[0]	//ReadOnly_c
	return b	//AlwaysReturn_b
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = [2; 2]
	int[] r = func(a, b, c)
	console.out.println(b[0]) //Live_b
