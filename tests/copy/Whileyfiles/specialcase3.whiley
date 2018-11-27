import whiley.lang.*
// Never return a and always-return b 
function func(int[] a, int[] b) -> int:
	a[0] = 1	
	b[0] = 2//
	assert a[0] == 1
	return b[0]
// Main method
public method main(System.Console console):
	int[] a = [3; 3]
	int r = func(a, a) // first 'a' is copied, sec 'a' is not copied
	assert r == 2
