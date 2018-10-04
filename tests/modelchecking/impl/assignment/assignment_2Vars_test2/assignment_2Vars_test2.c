#include "assignment_2Vars_test2.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	int64_t j;
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
	int64_t _12;
	int64_t _13;
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
	//const %10 = 0 : int
	_10 = 0;
	//assign %3 = %10  : int
	// isCopyEliminated = true
	j = _10;
	//loop (%1, %2, %3, %11, %12, %13)
	while(true){
		//const %11 = 10 : int
		_11 = 10;
		//ifge %3, %11 goto blklab0 : int
		if(j>=_11){goto blklab0;}
		//assign %2 = %1  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b, a);
		//assign %1 = %2  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(a, b);
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=j+_12;
		//assign %3 = %13  : int
		// isCopyEliminated = true
		j = _13;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(_6);
	_DEALLOC(_9);
	exit(0);
}

