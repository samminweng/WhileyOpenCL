import whiley.lang.System
function f(int limit) -> int:
	int i =0
	int sum=0
	while i < limit:
		int j = 0
		while j < limit:
			sum = sum + i*j // Makes i*j = 65536. and use u32_t
			j = j + 1
		i = i + 1
	return sum

method main(System.Console sys):
	int a = f(43)
	sys.out.println(a)
	assert a == 815409
	int b = f(257) 
	sys.out.println(b)
	assert b == 1082146816
