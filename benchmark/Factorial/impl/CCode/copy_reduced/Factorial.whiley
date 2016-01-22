import whiley.lang.*
function factorial(int n) -> int:
	if n == 1:
		return 1
	else:
		return n*factorial(n-1)

method main(System.Console sys):
    int|null max = Int.parse(sys.args[0])
    if max != null:
    	// Compute the factorials by using recursive function call
 		int f = factorial(max)
 		// Compute the factorial by using while-loop
 		int factor =1
 		int i = 1
 		while(i<=max):
 			factor = factor * i
 			i = i +1
 		// Check if both values are the same
 		assert f == factor
 		sys.out.print_s("Pass factorial test case")