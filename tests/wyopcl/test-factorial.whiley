function factorial(int n) => int:
	if(n == 0):
		return 1
	else:
		return n * factorial(n -1)

method main(System.Console console):
	console.out.println("factorial(7)="++factorial(7))