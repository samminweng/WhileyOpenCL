import whiley.lang.*
import whiley.io.File

// Initialize the line of coins 
function init(int n) -> int[]:
    int[] coins = [0;n]
    // Fill in Matrix
    int i = 0    
    while i < n:
        coins[i] = coins[i] + i
        i = i + 1
    return coins
// Get Bob's sum (total - sum_alice) 
function getBobSum(int sum_alice, int[] coins, int n) -> int:
	int i = 0
	int sum = 0
	while i < n:
		sum = sum + coins[i]
		i = i + 1
	return sum - sum_alice

// Simulate how the game is played. Alice goes first and Bob second.
// method play(System.Console sys, int[] moves, int[] coins, int n):
// 	int left =0 // From the left
// 	int right = n-1 // From the right
// 	int i = 0
// 	int sum_alice = 0
// 	int sum_bob = 0
// 	while i< n:
// 		int coin = 0
// 		if (moves[(left+1)*n+right] <= moves[left*n+right-1]):
// 			coin = coins[left] // Pick coins[i]
// 			left = left + 1
// 		else:
// 			coin = coins[right] // Pick coins[j]
// 			right = right - 1

// 		if i%2 == 0:
// 			sys.out.print_s("Alice take coin ( ")
// 		else:
// 			sys.out.print_s("Bob take coin ( ")

// 		sys.out.print(i)
// 		sys.out.print_s(" , ")
// 		sys.out.print(coin)
// 		sys.out.print_s(" )")

// 		if i %2 == 0:
// 			sum_alice = sum_alice + coin
// 			sys.out.print_s(", ")
// 		else:
// 			sum_bob = sum_bob + coin
// 			sys.out.println_s(" ")
// 		i = i + 1
// 		//End of i loop
// 	assert sum_alice >= sum_bob
// 	sys.out.print_s("The total amount of money (maximum) Bob gets is ")
// 	sys.out.println(sum_bob)

// Use dynamic programming to find moves for 
function findMoves(int[] coins, int n) -> int[]:
	int[] moves = [0;n*n]
	int s = 0
	while s < n:
		int j = s
		int i = 0
		while j < n:
			int y = 0
			if (i + 1 < n && j - 1 >= 0):
				y = moves[(i + 1)*n+j - 1]
			
			int x = 0
			if (i + 2 < n):
				x = moves[(i + 2)*n+j]
			
			int z = 0
			if (j - 1 > 0):
				z = moves[i*n+j - 2]
			
			// Max(x, y)
			if(x > y):
				x = y
		
			// Max(y, z)
			if(z > y):
				z = y
			
			// Pick the coins.
			if (coins[i] + x > coins[j] + z):
				moves[i*n+j] =coins[i] + x// Pick V[i]
			else:
				moves[i*n+j] = coins[j] + z// Pick V[j]
			
			j = j + 1
			i = i + 1
			// End of i,j loop
		s = s + 1
		// End of s loop
	return moves

method main(System.Console sys):
	int|null max = Int.parse(sys.args[0])
	if max != null:
    	int n = max
    	int[] coins = init(n)
    	int[] moves = findMoves(coins, n)
    	int sum_alice = moves[n-1]
    	int sum_bob = getBobSum(sum_alice, coins, n)
    	assert sum_alice >= sum_bob//play(sys, moves, coins, n)
    	sys.out.print_s("The total amount of money (maximum) Alice gets is ")
    	sys.out.println(sum_alice)
    	sys.out.print_s("The total amount of money (maximum) Bob gets is ")
    	sys.out.println(sum_bob)