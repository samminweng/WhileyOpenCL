method main(System.Console sys):
	[int] a = [50, 51, 52, 53, 54]
	int sum = 42
	int i = 0
	while i <|a|:
		sum = sum + (1*a[i]+2*a[i]+3*a[i])
		i = i + 1
	sys.out.println(sum)
	