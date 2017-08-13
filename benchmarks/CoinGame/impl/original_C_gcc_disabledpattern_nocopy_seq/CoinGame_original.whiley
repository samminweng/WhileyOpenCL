import whiley.lang.*
import whiley.io.File
import whiley.lang.Math

// Use dynamic programming to find moves for Alice
// The coins are an array, starting from 0 upto n
function findMoves(int[] moves, int n) -> int[]:
	int s = 0
	while s < n: // i0: s => 0<=s < n
		int i = 0 // i1: i => 0 <=i < n -s
		while i < n -s:  // j = i + s
			int j = i + s
			int y = moves[(i + 1)*n+j - 1]
			int x = moves[(i + 2)*n+j]
			int z = moves[i*n+j - 2]
			moves[i*n+j] = Math.max(i + Math.min(x, y), j + Math.min(y, z))
			//j = j + 1
			i = i + 1
			// End of i,j loop
		s = s + 1
		// End of s loop
	return moves

method main(System.Console sys):
	int|null max = Int.parse(sys.args[0])
	if max != null:
    		int n = max
			// Increase the move array size to (n+2) * (n+2)
			// to avoid if/else check inside the loop
    		int[] moves = [0;(n+2)*(n+2)]
    		moves = findMoves(moves, n) // Pass 'moves' array to the function
    		//play(sys, moves, n)
    		int sum_alice = moves[n-1]
    		sys.out.print_s("The total amount of money (maximum) Alice gets is ")
    		sys.out.println(sum_alice)
    		sys.out.println_s("Pass CoinGame test case")
