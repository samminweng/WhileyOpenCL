import whiley.lang.*
// Called function 'g' by 'func'
function g(int[] a, int[] b) -> int[]:
	return a // Always-return 'a'
// Never return a and always-return b 
function func(int[] a, int[] b) -> int[]:
	int ra = a[0]	
	int rb = b[0]	// ReadOnly_b
	int[] r = g(a, b) // b is read-only and never returned
	r[0] = 1 // a and r are aliased and mutated
	return b
// Main method
public method main(System.Console console):
	int[] a = [2; 2]
	int[] r = func(a, a) 
	assert a[0] == 2