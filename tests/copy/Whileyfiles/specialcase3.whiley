import whiley.lang.*
// a is read-write and never returned
// b is read-write and never returned
function func(int[] a, int[] b) -> int:
	a[0] = 1	
	b[0] = 2
	assert a[0] == 1
	return b[0]
// Main method
public method main(System.Console console):
	int[] a = [3; 3]
	int r = func(a, a) // Both 'a' and 'a' are live? Copy first 'a' and copy sec 'a'
	assert r == 2
