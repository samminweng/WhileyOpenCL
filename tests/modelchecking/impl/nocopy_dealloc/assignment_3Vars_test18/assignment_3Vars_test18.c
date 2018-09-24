#include "assignment_3Vars_test18.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10;
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	//const %4 = 1 : int
	_4 = 1;
	//const %5 = 5 : int
	_5 = 5;
	//arraygen %6 = [4; 5] : int[]
	_NEW1DARRAY_DEALLOC(_6, _4, _5, int64_t);
	//assign %1 = %6  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _6);
	//const %7 = 2 : int
	_7 = 2;
	//const %8 = 5 : int
	_8 = 5;
	//arraygen %9 = [7; 8] : int[]
	_NEW1DARRAY_DEALLOC(_9, _7, _8, int64_t);
	//assign %2 = %9  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _9);
	//const %10 = 3 : int
	_10 = 3;
	//const %11 = 5 : int
	_11 = 5;
	//arraygen %12 = [10; 11] : int[]
	_NEW1DARRAY_DEALLOC(_12, _10, _11, int64_t);
	//assign %3 = %12  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _12);
	//assign %1 = %2  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, b);
	//assign %1 = %3  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, c);
	//assign %3 = %1  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, a);
	//assign %3 = %2  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, b);
	//assign %2 = %3  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, c);
	//assign %2 = %1  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, a);
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_6);
	_DEALLOC(_9);
	_DEALLOC(_12);
	exit(0);
}

