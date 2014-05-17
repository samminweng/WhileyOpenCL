function factorial(int n) => int:
	if(n == 0):
		return 1
	else:
		return n * factorial(n -1)

method main(System.Console sys):
	//sys.out.println(factorial(2))
	sys.out.println(factorial(7))