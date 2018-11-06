import whiley.lang.*

function func(int[] a, int[] b) -> int[]:
	int ra = a[0]	//ReadOnly_a
	b[0] = 0	//ReadWrite_b
	return b	//AlwaysReturn_b
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = func(a, b)
