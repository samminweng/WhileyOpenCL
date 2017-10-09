import whiley.lang.*
// Add the extra if-else branch to return different results
function func(int[] s, int n) -> int[]:
	if n > 5:
		// Update the return array
		int[] t = s
		t[2] = 3
		return t
	else:
		// No update
		return s

// Main function
method main(System.Console sys):
	int[] a = [0,0,0,0,0]
	// Update 'a' array
	a = func(a, 6)
	assert a[2] == 3
	sys.out.print_s("a[2]=")
	sys.out.println(a[2])
	int[] b = [0,0,0,0,0]
	// No update
	int[] c = func(b, 1)
	assert b[2] == 0
	assert c[2] == 0
	sys.out.print_s("b[2]=")
	sys.out.println(b[2])
	sys.out.print_s("c[2]=")
	sys.out.println(c[2])