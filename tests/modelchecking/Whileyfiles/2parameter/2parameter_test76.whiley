import whiley.lang.*

function func(int[] a, int[] b) -> int[]:
	int ra = a[0]	//ReadOnly_a
	int rb = b[0]	//ReadOnly_b
	if a[0] == b[0]:	// MaybeReturn_a|NeverReturn_b
		return a
	else:
		return [3;3]
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] r = func(a, b)