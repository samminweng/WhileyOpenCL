import whiley.lang.*
/**
* The 'VectorMult' test case multiplies two unit vectors and gets the dot product. 
* The program splits each large vector into N sub-vectors, and performs dot product on 
* two sub vectors, and then sum up to the sub-total and put it to 'product' array. 
* After iterating over all sub-vectors, the program aggregates all sub-totals to get 
* the final dot product result. 
*/
method main(System.Console sys):
	int N = 16
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