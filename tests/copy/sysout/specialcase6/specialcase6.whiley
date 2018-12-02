import whiley.lang.*
// a is read-write and may be returned
function fill(int[] a, int v, int i) -> int[]:
	if i < |a| :
		a[i] = v
		return fill(a, v, i+1) // a is not live. No copy for 'a'
	else:
		return a
// Main method
public method main(System.Console console):
	int[] a = [0; 7]
	int[] b = fill(a, 8, 0) // a is not live. No copy for 'a'
	assert |b| == 7
	assert b[0] == 8
	assert b[6] == 8
	
