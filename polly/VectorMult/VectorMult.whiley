import whiley.lang.*
/**
*
* The 'VectorMult' test case multiplies each entry from two unit vectors (u, v), updates 
* the product to another vector (p) at the corresponding index and then sums up all entries
* in 'p' vector to gets the final dot product.
* 
* Instead of creating a large-sized vector, this program reuses the vectors and repeats
* the dot products for N times to calculate the dot product of N X N vectors. For example,
* the below prgram uses three 16-sized vectors and repeats the dot product 16 times, to 
* calculates the dot products of 256-sized vectors.
*  
*/
constant N is 16
method main(System.Console sys):
	int[] p = [0;N]
	int r = 0
	while r < N:
		int i = 0
		while i < N:
			// u and v are vecotrs 
			int[] u = [1;N] //int[] u = [1, 1, 1, 1, 1] 
			int[] v = [1;N] //int[] v = [1, 1, 1, 1, 1]
			p[r] = p[r] + u[i]*v[i]
			i = i + 1
		r = r + 1
	// Sum up product vector
	//sys.out.print_s("Sum up the product vector")
	int sum =0
	r=0
	while r<N:
		sum = sum + p[r]
		r = r + 1
	assert sum == N*N
	sys.out.print_s("Pass the ")
	sys.out.print(N)
	sys.out.print_s(" X ")
	sys.out.print(N)
	sys.out.print_s(" multiplication test case with dot Product = ")
	sys.out.println(sum)