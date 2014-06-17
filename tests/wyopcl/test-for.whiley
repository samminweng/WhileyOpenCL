method main(System.Console sys):
	[int] a = [50, 51, 52, 53, 54]
	int sum = 42
	for i in a:
		sum = sum + (1*i + 2*i + 3*i)
	sys.out.println("sum("++a++")="++sum)
	