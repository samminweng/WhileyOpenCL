#include <stdio.h>
#include <stdbool.h>
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
#define N 6 // Max line leight
int V[N] = { 6, 5, 2, 7, 3, 5 }; // Coins
int M[N][N]; // Movements 
// M(i, j) = max { V[i] + min { M(i+2, j),   M(i+1, j-1) },
//                 V[j] + min { M(i+1, j-1), M(i,   j-2) } }
int X[N][N]; // X(i, j) = M[i+2][j]
int Y[N][N]; // Y(i, j) = M[i+1][j-1]
int Z[N][N]; // Z(i, j) = M[i][j-2]

void printMoves() {
	int m = 0, n = N - 1;
	bool alice = true;
	while (m <= n) {
		int P1 = M[m + 1][n]; // If take A[m], opponent can get...
		int P2 = M[m][n - 1]; // If take A[n]
		if (alice) {
			printf("Alice take coin no. ");
		} else {
			printf("Bob take coin no. ");
		}
		if (P1 <= P2) {
			printf("(%d, $%d)", m + 1, V[m]);
			m++;
		} else {
			printf("(%d, $%d)", n + 1, V[n]);
			n--;
		}
		if (alice) {
			printf(", ");
		} else {
			printf(".\n");
		}
		alice = !alice;
	}
	printf("\nThe total amount of money (maximum) Alice get is %d.\n",
			M[0][N - 1]);
}

int maxMoney() {
	int i, m, n;
	for (i = 0; i < N; i++) {
		//calculate x, y, z
		for (n = i, m = 0; m < N && n < N; m++, n++) {
			X[m][n] = 0;
			if (m + 2 < N) {
				X[m][n] = X[m][n] + M[m + 2][n];
			}
			Y[m][n] = 0;
			if (m + 1 < N && n - 1 >= 0) {
				Y[m][n] = Y[m][n] + M[m + 1][n - 1];
			}
			Z[m][n] = 0;
			if (n - 1 > 0) {
				Z[m][n] = Z[m][n]+ M[m][n - 2];
			}
		}
		// Split the loop into two separate loop
		for (n = i, m = 0; m < N && n < N; m++, n++) {
			// Find the coins.
			M[m][n] = max(V[m] + min(X[m][n],Y[m][n]),
					V[n] + min(Y[m][n],Z[m][n]));
			//For Debugging
			//printf("x=%d, y=%d, z=%d\n", x, y, z);
			//printf("m=%d, n=%d, M[m][n]=%d\n", m, n, M[m][n]);
		}

	}

	// Print out matrix
	for (m = 0; m < N; m++) {
		for (n = 0; n < N; n++) {
			printf(" %d ", M[m][n]);
		}
		printf("\n");
	}

	return M[0][N - 1];
}
int main() {
	maxMoney();
	printMoves();
}
