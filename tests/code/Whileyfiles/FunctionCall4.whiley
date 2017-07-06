import whiley.lang.*
// Add if-else branch to return a new array
function func(int[] s, int n) -> int[]:
	if n > 5:
		// Update the input array
		int[] t = s
		t[2] = 3
		return t
	else:
		// Return a new array
		int[] new_t = [1,1,1,1,1]
		// Cause a memory leak on 's' array
		return new_t
// Main function
method main(System.Console sys):
	int[] a = [0,0,0,0,0]
	a = func(a, 6)
	assert a[2] == 3
	sys.out.print_s("a[2]=")
	sys.out.println(a[2])
	int[] b = [0,0,0,0,0]
	// This function call causes a memory leak
	// The copied 'b' is not freed at 'func' function
	int[] c = func(b, 1)
	assert b[2] == 0
	assert c[2] == 1
	sys.out.print_s("b[2]=")
	sys.out.println(b[2])
	sys.out.print_s("c[2]=")
	sys.out.println(c[2])
