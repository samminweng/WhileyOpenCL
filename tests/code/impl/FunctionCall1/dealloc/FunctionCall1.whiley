import whiley.lang.*
// Update the array at index of 2 
// and return the resultant array 
function func(int[] s) -> int[]:
	int[] t = s
	t[2] = 3
	return t

// Main function
method main(System.Console sys):
	int[] a = [0,0,0,0,0]
	a = func(a)
	// a[2] == 3
	assert a[2] == 3
	sys.out.print_s("a[2]=")
	sys.out.println(a[2])
	int[] b = [0,0,0,0,0]
	int[] c = func(b)
	assert b[2] == 0
	assert c[2] == 3
	sys.out.print_s("b[2]=")
	sys.out.println(b[2])
	sys.out.print_s("c[2]=")
	sys.out.println(c[2])
