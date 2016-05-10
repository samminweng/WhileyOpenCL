#include "Util.h"
#define BLANK 0
#define CIRCLE 1
#define CROSS 2
#define GAME [0,1,2,3,4,5,6,7,8]
typedef long long nat;
typedef long long Square;
typedef struct{
	_DECL_1DARRAY_MEMBER(pieces);
	long long move;
} Board;
void printf_Board(Board* _board);
Board* copy_Board(Board* _board);
void free_Board(Board* _board);
Board* EmptyBoard();
long long countOf(_DECL_1DARRAY_PARAM(pieces), _DECL_OWNERSHIP_PARAM(pieces), long long s);
