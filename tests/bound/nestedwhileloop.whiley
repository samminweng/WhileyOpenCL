import whiley.lang.System
function f(int limit) -> int:
	int i =0
	int sum=0
	while i < limit:
		int j = 0
		while j < limit:
			sum = sum + 1
			j = j + 1
		i = i + 1
	return sum

method main(System.Console sys):
	int a = f(5)
	sys.out.println(a)
	assert a == 100

