method main(System.Console sys):
	int sum = 42
	[int] a = [50, 51, 52, 53, 54]
	[int] b = [1, 2, 3]
	for i in a:
		for j in b:
				sum = sum + i*j	
	sys.out.println(sum)