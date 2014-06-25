method main(System.Console sys):
	[int] a = [5, 1, 2, 5, 4]
	int sum = 0
	int i = 0
	while i <|a|:
		sum = sum + a[i]
		i = i + 1
	sys.out.println("sum("++a++")="++sum)
	