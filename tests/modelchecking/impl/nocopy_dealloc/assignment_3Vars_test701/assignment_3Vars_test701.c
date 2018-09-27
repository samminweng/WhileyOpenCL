#include "assignment_3Vars_test701.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t i;
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	int64_t _14;
	int64_t _15;
	//const %5 = 1 : int
	_5 = 1;
	//const %6 = 5 : int
	_6 = 5;
	//arraygen %7 = [5; 6] : int[]
	_NEW1DARRAY_DEALLOC(_7, _5, _6, int64_t);
	//assign %1 = %7  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _7);
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 5 : int
	_9 = 5;
	//arraygen %10 = [8; 9] : int[]
	_NEW1DARRAY_DEALLOC(_10, _8, _9, int64_t);
	//assign %2 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _10);
	//const %11 = 3 : int
	_11 = 3;
	//const %12 = 5 : int
	_12 = 5;
	//arraygen %13 = [11; 12] : int[]
	_NEW1DARRAY_DEALLOC(_13, _11, _12, int64_t);
	//assign %3 = %13  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _13);
	//assign %3 = %2  : int[]
	// isCopyEliminated = false
	_ADD_DEALLOC(c, b, int64_t);
	//assign %1 = %2  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, b);
	//assign %2 = %1  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, a);
	//const %14 = 0 : int
	_14 = 0;
	//indexof %15 = %2, %14 : int[]
	_15=b[_14];
	//assign %4 = %15  : int
	// isCopyEliminated = true
	i = _15;
	//assign %1 = %3  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, c);
	//assign %3 = %1  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, a);
	//assign %2 = %3  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, c);
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_7);
	_DEALLOC(_10);
	_DEALLOC(_13);
	exit(0);
}

