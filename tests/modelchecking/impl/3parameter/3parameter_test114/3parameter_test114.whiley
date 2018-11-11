import whiley.lang.*

function func(int[] a, int[] b, int[] c) -> int[]:
	int ra = a[0]	//ReadOnly_a
	b[0] = 0	//ReadWrite_b
	int rc = c[0]	//ReadOnly_c
	if a[0] == b[0]:	// MaybeReturn_a|MaybeReturn_b|MaybeReturn_c
		return a
	else:
		return b
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = [2; 2]
	int[] r = func(a, b, c)
	console.out.println(a[0]) //Live_a
	console.out.println(b[0]) //Live_b
