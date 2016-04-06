#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <stdlib.h>
#ifndef max
#define max( a, b ) ( ((a) > (b)) ? (a) : (b) )
#endif
#ifndef min
#define min( a, b ) ( ((a) < (b)) ? (a) : (b) )
#endif
/**
 *  Coin-in-A-line Game
 *  Coins are arranged in a line.
 *  Alice is playing the coin game against Bob.
 *  Alice or Bob may pick a coin from left or right side.
 *  The player with the most gold at the end wins.
 *  The below code is referred to http://articles.leetcode.com/coins-in-line/
 */
#define N 6 // Vector size
int V[N] = { 6, 5, 2, 7, 3, 5 }; // Example: Alice gets 18 and Bob gets 10.
//#define N 200 // Vector size
//int V[N];
int M[N][N]; // Movements
// M(i, j) = max { V[i] + min { M(i+2, j),   M(i+1, j-1) },
//                 V[j] + min { M(i+1, j-1), M(i,   j-2) } }
int X[N][N]; // X(i, j) = M[i+2][j]
int Y[N][N]; // Y(i, j) = M[i+1][j-1]
int Z[N][N]; // Z(i, j) = M[i][j-2]
int sum_alice = 0, sum_bob = 0; // Sums
// Randomize the V[N]
void init() {
	int i;
	//srand(time(NULL));
	printf("Number of coins = %d\n", N);
	for (i = 0; i < N; i++) {
		V[i] = i;
	}
}

void sumMoves() {
	int i = 0, j = N - 1;
	int alice = 1;
	while (i <= j) {
		int P1 = M[i + 1][j];
		int P2 = M[i][j - 1];
		int coin;
		if (P1 <= P2) {
			// Pick V[i]
			coin = V[i];
			i++;
		} else {
			// Pick V[j]
			coin = V[j];
			j--;
		}
		if (alice) {
			sum_alice += coin;
			alice = 0;
		} else {
			sum_bob += coin;
			alice = 1;
		}
	}

}

// Print out movements
void printMoves() {
	int i = 0, j = N - 1;
	bool alice = true;
	while (i <= j) {
		int P1 = M[i + 1][j]; // If take V[i], opponent can get...
		int P2 = M[i][j - 1]; // If take V[n]
		if (alice) {
			printf("Alice take coin ");
		} else {
			printf("Bob take coin ");
		}

		if (P1 <= P2) {
			printf("(%d, $%d)", i + 1, V[i]);
			i++;
		} else {
			printf("(%d, $%d)", j + 1, V[j]);
			j--;
		}
		if (alice) {
			printf(", ");
		} else {
			printf(".\n");
		}
		alice = !alice;
	}

}
// Find the optimal strategy
int maxMoney() {
	int s, i, j;
	for (s = 0; s < N; s++) {
		//calculate x, y, z
		for (i = 0, j = s; j<N; i++, j++) {
			__builtin_assume(i<N); __builtin_assume(j<N);
			X[i][j] = 0;
			if (i + 2 < N) {
				X[i][j] = M[i + 2][j];
			}
			Y[i][j] = 0;
			if (i + 1 < N && j - 1 >= 0) {
				Y[i][j] = M[i + 1][j - 1];
			}
			Z[i][j] = 0;
			if (j - 1 > 0) {
				Z[i][j] = M[i][j - 2];
			}
		}
		// Split the loop into two separate loop

		for (i = 0, j = s; i < N && j < N; i++, j++) {
			__builtin_assume(i<N); __builtin_assume(j<N);
			// Find the coins.
			if(V[i] + min(X[i][j],Y[i][j]) > V[j] + min(Y[i][j],Z[i][j])){
				M[i][j] = V[i] + min(X[i][j],Y[i][j]);
			}else{
				M[i][j] = V[j] + min(Y[i][j],Z[i][j]);
			}
			//M[i][j] = max(V[i] + min(X[i][j],Y[i][j]),
			//		V[j] + min(Y[i][j],Z[i][j]));

			//For Debugging
			//printf("x=%d, y=%d, z=%d\n", X[i][j], Y[i][j], Z[i][j]);
			//printf("i=%d, n=%d, M[i][n]=%d\n", i, j, M[i][j]);
		}

	}

	return M[0][N - 1];
}
int main() {
	//init();
	maxMoney();
	sumMoves();
	//printMoves();
	// Check if Alice's sum is correct
	if (sum_alice != M[0][N - 1]) {
		printf("Alice's sum is Wrong!!!");
		exit(-1);
	}
	// Alice always gets more coins than Bob
	if (sum_alice < sum_bob) {
		printf("Alice's sum <= Bob's sum!!!");
		exit(-1);
	}

	printf("\nThe total amount of money (maximum) Alice get is %d.", sum_alice);
	printf("\nThe total amount of money (maximum) Bob get is %d.", sum_bob);
}
