import whiley.lang.*
// b is read-only and never returned
// a is read-only and always returned
function g(int[] a, int[] b) -> int[]:
	return a 
// a is read-write and never returned
// b is read-only and always returned
function func(int[] a, int[] b) -> int[]:
	int ra = a[0]	
	int rb = b[0]	
	int[] r = g(a, b) // No copy on a and b
	r[0] = 1 // a and r are aliased and mutated
	return b
// Main method
public method main(System.Console console):
	int[] a = [2; 2]
	int[] r = func(a, a) // Both 'a' are live. Copy first 'a' and copy second 'a'
	assert a[0] == 2
	assert r[0] == 2