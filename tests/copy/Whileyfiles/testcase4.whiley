import whiley.lang.*


//function 'func' that may return input 'x'
function func(int[] x, int num) -> int[]:
	int[] a = [0;3]
	int[] b = [1;3]
	int[] c = a
	int[] d = b
	if num > 10:
		return x
	else:
		if num >9:
			return c
		return d

public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = [2; 2]
	a = func(b, 11)
	console.out.println(a[0]) //Live_a
	console.out.println(b[0]) //Live_b
	console.out.println(c[0]) //Live_c
