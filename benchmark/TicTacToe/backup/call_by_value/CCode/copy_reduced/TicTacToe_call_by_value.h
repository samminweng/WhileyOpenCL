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
void printf_Board(Board s);
Board EmptyBoard();
Board play(Board _b, nat _pos);
long long countOf(Square* _pieces, long long _pieces_size, Square _s);
int main(int argc, char** args);
