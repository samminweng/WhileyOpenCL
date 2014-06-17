function test_func_1(int sum, int x) => int:	
	sum = sum + 1000
	sum = sum + x
	return sum

function test_func_2(int sum) => int:	
	sum = sum + 2000
	return sum

method main(System.Console sys):
	sys.out.println(test_func_1(42, 0))
	sys.out.println(test_func_2(42))