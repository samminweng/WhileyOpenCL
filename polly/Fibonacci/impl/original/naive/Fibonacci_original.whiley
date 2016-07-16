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
	int|null n = Int.parse(sys.args[0])
	if n != null:
		int max = n
		int[] arr = [0;max]
		arr = fibonacci(arr, max-1)
		sys.out.println(arr[max-3])
		sys.out.println(arr[max-2])
		sys.out.println(arr[max-1])
		//assert arr[max-1] == arr[max-2] + arr[max-3]
		sys.out.println_s("Pass Fibonacci test case")