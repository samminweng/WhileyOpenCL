import whiley.lang.*
function factorial(int n) -> int:
	if n == 1:
		return 1
	else:
		return n*factorial(n-1)

method main(System.Console sys):
 	int f = factorial(5)
 	assert f == 120
 	sys.out.print_s("Pass factorial test case")