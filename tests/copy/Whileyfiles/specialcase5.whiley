import whiley.lang.*
// Never return a and always-return b 
function func(int[] a, int[] b) -> int:
	b[0] = 2//
	return a[0]
// Main method
public method main(System.Console console):
	int[] a = [1; 1]
	int r = func(a, a) // first 'a' is copied, sec 'a' is not copied
	assert r == 1
