import whiley.lang.*

function func(int[] a, int[] b) -> int[]:
	a[0] = 0	//ReadWrite_a
	int rb = b[0]	//ReadOnly_b
	if a[0] == b[0]:	// MaybeReturn_a|NeverReturn_b
		return a
	else:
		return [3;3]
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = func(a, b)
	console.out.println(a[0]) //Live_a
