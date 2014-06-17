method main(System.Console sys):
	[int] a = [50, 51, 52, 53, 54]
	int sum = 0
	int i = 0
	while i <|a|:
		sum = sum + a[i]
		i = i + 1
	sys.out.println("sum("++a++")="++sum)
	