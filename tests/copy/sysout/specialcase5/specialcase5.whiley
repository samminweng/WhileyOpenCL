import whiley.lang.*
// a is read-only and never returned
// b is read-write and never returned
function func(int[] a, int[] b) -> int:
	b[0] = 2//
	return a[0]
// Main method
public method main(System.Console console):
	int[] a = [1; 1]
	int r = func(a, a) // 'a' is live. Copy first 'a' and copy second 'a'
	assert r == 1
