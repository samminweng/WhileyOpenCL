import whiley.lang.*

function func(int[] a, int[] b) -> int[]:
	a[0] = 0	//ReadWrite_a
	b[0] = 0	//ReadWrite_b
	return [3;3]	//NeverReturn_a|NeverReturn_b
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] r = func(a, b)
	console.out.println(b[0]) //Live_b
