#include "Util.h"
//0
const long long BLANK=0;
//1
const long long CIRCLE=1;
//2
const long long CROSS=2;
//9
const long long SQUARESIZE=9;

//nat
typedef long long nat;
//Square
typedef long long Square;
//Board
struct Board{
Square* pieces;
nat move;
};

Board EmptyBoard();
long long countOf(Square* _pieces, long long _pieces_size, Square _s);
int main(int argc, char** argv);

