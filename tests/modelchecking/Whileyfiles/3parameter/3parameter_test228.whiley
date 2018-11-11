import whiley.lang.*

function func(int[] a, int[] b, int[] c) -> int[]:
	a[0] = 0	//ReadWrite_a
	int rb = b[0]	//ReadOnly_b
	int rc = c[0]	//ReadOnly_c
	if a[0] == b[0]:	// NeverReturn_a|MaybeReturn_b|MaybeReturn_c
		return [3;3]
	else:
		return b
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = [2; 2]
	int[] r = func(a, b, c)
	console.out.println(a[0]) //Live_a
	console.out.println(c[0]) //Live_c
