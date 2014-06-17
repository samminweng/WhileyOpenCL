function sum_func(int x, int y) => int:
	return x + y

function sum_func_1(int x, int y, int z) => int:
	return x + y + z

method main(System.Console console):
	int x = 10
	int y = 20
	int z = 30
	console.out.println("sum("++x++", "++y++")="++sum_func(x, y))
	console.out.println("sum("++x++", "++y++", "++z++")="++sum_func_1(x, y, z))