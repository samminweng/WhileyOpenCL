function test_loop(int sum) => int:	
	[int] a = [50, 51, 52, 53, 54]
	for i in a:
		sum = sum + (1*i + 2*i + 3*i)
	return sum

function test_nestedloop(int sum) => int:
	[int] a = [50, 51, 52, 53, 54]
	[int] b = [1, 2, 3]
	for i in a:
		for j in b:
				sum = sum + i*j
	return sum

method main(System.Console sys):
	sys.out.println(test_loop(42))
	sys.out.println(test_nestedloop(42))