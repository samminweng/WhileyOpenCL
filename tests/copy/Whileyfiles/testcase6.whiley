import whiley.lang.*

//Function 'func' always returns input 'a'
function func(int[] a) -> int[]:
	int i = 0
	while i < |a|:
		a[i] = 5
		i = i + 1
	return a

public method main(System.Console console):
	int[] a = [2; 2]
	int[] b = [2; 2]
	int[] c = [2; 2]
	a = func(b)
	console.out.println(a[0]) //Live_a
	console.out.println(b[0]) //Live_b
	console.out.println(c[0]) //Live_c
