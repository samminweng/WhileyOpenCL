#include "Util.h"
#include "WyRT.h"
#define BLANK 0
#define CIRCLE 1
#define CROSS 2
#define GAME [0,1,2,3,4,5,6,7,8]
typedef int64_t nat;
typedef int64_t Square;
typedef struct{
	_DECL_1DARRAY_MEMBER(pieces);
	int64_t move;
} Board;
void printf_Board(Board* _board);
Board* copy_Board(Board* _board);
void free_Board(Board* _board);
Board* _EmptyBoard_();
int64_t _countOf_(_DECL_1DARRAY_PARAM(pieces), int64_t s);
int main(int argc, char** args);
