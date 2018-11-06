import whiley.lang.*

function func(int[] a, int[] b) -> int[]:
	a[0] = 0	//ReadWrite_a
	b[0] = 0	//ReadWrite_b
	return b	//AlwaysReturn_b
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = func(a, b)
	console.out.println(a[0]) //Live_a
