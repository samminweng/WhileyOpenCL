import whiley.lang.*
import whiley.io.File
import whiley.lang.Math

// Use dynamic programming to find moves for Alice
// The coins are an array, starting from 0 upto n
function findMoves(int[] moves, int n, int[] coins) -> int[]:
	int s = 0
	while s < n: // 0<= s < n
		int i = 0
		while i < n -s: // 0 <= i < n -s
			int j = i + s // j = i + s
			int y = moves[(i + 1)*n+j - 1]
			int x = moves[(i + 2)*n+j]
			int z = moves[i*n+j - 2]
			moves[i*n+j] = Math.max(coins[i] + Math.min(x, y), coins[j] + Math.min(y, z))
			i = i + 1
			// End of i,j loop
		s = s + 1
		// End of s loop
	return moves

method main(System.Console sys):
	int|null max = Int.parse(sys.args[0])
	if max != null:
	   int n = max
	   // Create an array of coins [0,1,2,3,4,0,1,2,3,4...]
	   int[] coins = [0;n]
	   int i = 0
	   while i < n:
	     coins[i] = i % 5 // Coin value [0 ~ 4]
	     i = i + 1
	   // Increase the move array size to (n+2) * (n+2)
	   // to avoid if/else check inside the loop
	   int[] moves = [0;(n+2)*(n+2)]
	   moves = findMoves(moves, n, coins) // Pass 'moves' and 'coints' array
	   //play(sys, moves, n)
	   int sum_alice = moves[n-1]
	   sys.out.print_s("The total amount of money (maximum) Alice gets is ")
	   sys.out.println(sum_alice)
	   sys.out.println_s("Pass CoinGame test case")
