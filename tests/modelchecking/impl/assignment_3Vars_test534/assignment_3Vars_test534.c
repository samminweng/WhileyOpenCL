#include "assignment_3Vars_test534.h"
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
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	_ADD_DEALLOC(_6);
	//assign %1 = %6  : int[]
	_DEALLOC(a);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _6);
	_TRANSFER_DEALLOC(a, _6);
	//const %7 = 2 : int
	_7 = 2;
	//const %8 = 5 : int
	_8 = 5;
	//arraygen %9 = [7; 8] : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY_int64_t(_9, _8, _7);
	_ADD_DEALLOC(_9);
	//assign %2 = %9  : int[]
	_DEALLOC(b);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _9);
	_TRANSFER_DEALLOC(b, _9);
	//const %10 = 3 : int
	_10 = 3;
	//const %11 = 5 : int
	_11 = 5;
	//arraygen %12 = [10; 11] : int[]
	_DEALLOC(_12);
	_NEW_1DARRAY_int64_t(_12, _11, _10);
	_ADD_DEALLOC(_12);
	//assign %3 = %12  : int[]
	_DEALLOC(c);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, _12);
	_TRANSFER_DEALLOC(c, _12);
	//assign %3 = %1  : int[]
	_DEALLOC(c);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, a);
	_TRANSFER_DEALLOC(c, a);
	//assign %2 = %3  : int[]
	_DEALLOC(b);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, c);
	_TRANSFER_DEALLOC(b, c);
	//assign %2 = %1  : int[]
	_DEALLOC(b);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, a);
	_TRANSFER_DEALLOC(b, a);
	//assign %3 = %2  : int[]
	_DEALLOC(c);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, b);
	_TRANSFER_DEALLOC(c, b);
	//assign %1 = %3  : int[]
	_DEALLOC(a);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, c);
	_TRANSFER_DEALLOC(a, c);
	//assign %1 = %2  : int[]
	_DEALLOC(a);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, b);
	_TRANSFER_DEALLOC(a, b);
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_6);
	_DEALLOC(_9);
	_DEALLOC(_12);
	exit(0);
}

