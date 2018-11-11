import whiley.lang.*

function func(int[] a, int[] b, int[] c) -> int[]:
	a[0] = 0	//ReadWrite_a
	b[0] = 0	//ReadWrite_b
	int rc = c[0]	//ReadOnly_c
	if a[0] == b[0]:	// MaybeReturn_a|NeverReturn_b|NeverReturn_c
		return a
	else:
		return [3;3]
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = [2; 2]
	int[] r = func(a, b, c)
	console.out.println(a[0]) //Live_a
	console.out.println(b[0]) //Live_b
