import whiley.lang.*
/**
*
* The 'VectorMult' test case multiplies two unit vectors (u, v) and gets the dot product.
* This program splits a large vector into N sub-vectors, and takes each sub vecotors 
* from 'u' and 'v' vectors and multiplies the  

multiplies two sub vectors
* to get the sproduct and update it to 'p' vector. After iterating all sub vectors, the 
* program sums up all the product to get the final result.
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