method main(System.Console console):
	[int] a = [50, 51, 52, 53, 54]
	int sum = 0
	for i in a:
		sum = sum + i
	console.out.println("sum("++a++")="++sum)
	