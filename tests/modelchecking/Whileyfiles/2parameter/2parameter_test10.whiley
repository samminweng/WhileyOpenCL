import whiley.lang.*

function func(int[] a, int[] b) -> int[]:
	int ra = a[0]	//ReadOnly_a
	b[0] = 0	//ReadWrite_b
	if a[0] == b[0]:	// MaybeReturn_b|NeverReturn_a
		return [3;3]
	else:
		return b
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] r = func(a, b)
	console.out.println(a[0]) //Live_a
	console.out.println(b[0]) //Live_b
