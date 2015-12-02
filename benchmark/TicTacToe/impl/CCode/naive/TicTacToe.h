#include "Util.h"
#define BLANK 0
#define CIRCLE 1
#define CROSS 2
#define GAME [0,1,2,3,4,5,6,7,8]
typedef long long nat;
typedef long long Square;
typedef struct{
	Square* pieces;
	long long pieces_size;
	nat move;
} Board;
void printf_Board(Board _board);
Board copy_Board(Board _board);
void free_Board(Board _board);
Board EmptyBoard();
Board play(Board b, nat pos);
long long countOf(Square* pieces, long long pieces_size, Square s);
int main(int argc, char** args);
