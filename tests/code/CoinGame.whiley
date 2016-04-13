import whiley.lang.*

function init(int n) -> int[]:
    int[] coins = [0;n]
    // Fill in Matrix
    int i = 0    
    while i < n:
        coins[i] = coins[i] + i
        i = i + 1
    return coins

function findMoves(int[] coins, int n) -> int:
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
	return moves[n -1 ]

method main(System.Console sys):
	int n = 10
	int[] coins = init(n)
	int sum_alice = findMoves(coins, n)
	sys.out.print_s("The total amount of money (maximum) Alice gets is ")
	sys.out.println(sum_alice)