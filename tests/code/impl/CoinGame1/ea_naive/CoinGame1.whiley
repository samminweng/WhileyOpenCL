import whiley.lang.*
import whiley.io.File
import whiley.lang.Math
// The 'coins' array can be skipped 
// because the coin value is the same as the index
// Initialize the line of coins
/*function init(int n) -> int[]:
    int[] coins = [0;n]
    // Fill in Matrix
    int i = 0    
    while i < n:
        coins[i] = coins[i] + i
        i = i + 1
    return coins
*/

// Simulate how the game is played. Alice goes first and Bob second.
// Note coin value is the same as the array index, e.g. [0, 1, 2, 3, 4]
/*method play(System.Console sys, int[] moves, int n):
	int left =0 // From the left
	int right = n-1 // From the right
	int i = 0
	int sum_alice = 0
	int sum_bob = 0
	while i< n:
		int coin = 0
		if (moves[(left+1)*n+right] <= moves[left*n+right-1]):
			coin = left // Pick coins[left]
			left = left + 1
		else:
			coin = right // Pick coins[right]
			right = right - 1

		if i%2 == 0:
			sys.out.print_s("Alice take coin ( ")
		else:
			sys.out.print_s("Bob take coin ( ")

		sys.out.print(i)
		sys.out.print_s(" , ")
		sys.out.print(coin)
		sys.out.print_s(" )")

		if i %2 == 0:
			sum_alice = sum_alice + coin
			sys.out.print_s(", ")
		else:
			sum_bob = sum_bob + coin
			sys.out.println_s(" ")
		i = i + 1
		//End of i loop
	assert sum_alice >= sum_bob
	sys.out.print_s("The total amount of money (maximum) Bob gets is ")
	sys.out.println(sum_bob)
*/

// Use dynamic programming to find moves for Alice
// The coins are an array, starting from 0 upto n
function findMoves(int[] moves, int n) -> int[]:
	int s = 0
	while s < n: // i0: s => 0<=s < n
		int j = s
		int i = 0 // i1: i => 0 <=i < n -s 
		while j < n:  // j = i + s 
			int y = 0
			if (i + 1 < n && j - 1 >= 0):
				y = moves[(i + 1)*n+j - 1]
			
			int x = 0
			if (i + 2 < n):
				x = moves[(i + 2)*n+j]
			
			int z = 0
			if (j - 1 > 0):
				z = moves[i*n+j - 2]
			
			moves[i*n+j] = Math.max(i + Math.min(x, y), j + Math.min(y, z))
			
			j = j + 1
			i = i + 1
			// End of i,j loop
		s = s + 1
		// End of s loop
	return moves

method main(System.Console sys):
	int n = 10
	int[] moves = [0;n*n]
	moves = findMoves(moves, n) // Pass 'moves' array to the function 
	//play(sys, moves, n) 
	int sum_alice = moves[n-1]
	assert sum_alice == 25
	sys.out.print_s("The total amount of money (maximum) Alice gets is ")
	sys.out.println(sum_alice)
	sys.out.println_s("Pass CoinGame test case")
