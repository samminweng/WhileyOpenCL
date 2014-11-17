import whiley.lang.System

method main(System.Console sys):
	int i = 0
	int sum = 0
	while i<=1000000:
		sum = sum + i
		i=i+1
	sys.out.println("Sum="++sum)