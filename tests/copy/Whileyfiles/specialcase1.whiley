import whiley.lang.*
// Never return a, maybe_turn b and c
function func(int[] a, int[] b, int[] c) -> int[]:
	int ra = a[0]	//ReadOnly_a
	int rb = b[0]	//ReadOnly_b
	int rc = c[0]	//ReadOnly_c
	if a[0] == b[0]:
		int[] y = a
		int[] x = b
		return x
	else:
		int[] y = c
		int[] x = y
		return x
// Method 'main'
public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = [2; 2]
	int[] r = func(a, b, c)
	console.out.println(a[0]) //Live_a
	console.out.println(b[0]) //Live_b
	console.out.println(c[0]) //Live_c