method main(System.Console console):
	[int] a = [1, 1, 2, 3, 1]
	int sum = 0
	for i in a:
		sum = sum + i
	console.out.println("sum("++a++")="++sum)