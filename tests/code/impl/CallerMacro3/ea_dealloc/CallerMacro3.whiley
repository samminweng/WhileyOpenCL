import whiley.lang.*

function f(int[] x) -> int[]:
	return x

method main(System.Console sys):
	// Create a fixed size array and its length is 10.
	int[] b = [0;10]
	b[1] = 1
	int[] a = f(b) // Function call
	b[1] = 0
	assert a[1] == 1
	assert b[1] == 0
	sys.out.print_s("a[1] = ")
	sys.out.println(a[1])
	sys.out.print_s("b[1] = ")
	sys.out.println(b[1])
