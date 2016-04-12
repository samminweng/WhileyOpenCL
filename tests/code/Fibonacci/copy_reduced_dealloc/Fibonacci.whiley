import whiley.lang.*
// Generate fibonacci sequences
function fibonacci(int[] ls, int n) -> int[]:
	if n<=1:
		//Given the seeds
		ls[0]=0
		ls[1]=1
	else:
		ls = fibonacci(ls, n-1)
		ls[n]=ls[n-1] + ls[n-2]
	return ls

method main(System.Console sys):
	int max = 10
	int[] arr = [0;max]
	arr = fibonacci(arr, max-1)
	assert arr == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
	sys.out.print(arr)
	sys.out.print_s("Pass Fibonacci test case")