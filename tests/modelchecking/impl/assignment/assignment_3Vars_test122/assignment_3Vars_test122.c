#include "assignment_3Vars_test122.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t j;
	int64_t i;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	int64_t _10;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12;
	int64_t _13;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 5 : int
	_7 = 5;
	//arraygen %8 = [6; 7] : int[]
	_NEW1DARRAY_DEALLOC(_8, _6, _7, int64_t);
	//assign %1 = %8  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _8);
	//const %9 = 2 : int
	_9 = 2;
	//const %10 = 5 : int
	_10 = 5;
	//arraygen %11 = [9; 10] : int[]
	_NEW1DARRAY_DEALLOC(_11, _9, _10, int64_t);
	//assign %2 = %11  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _11);
	//const %12 = 3 : int
	_12 = 3;
	//const %13 = 5 : int
	_13 = 5;
	//arraygen %14 = [12; 13] : int[]
	_NEW1DARRAY_DEALLOC(_14, _12, _13, int64_t);
	//assign %3 = %14  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _14);
	//const %15 = 0 : int
	_15 = 0;
	//assign %4 = %15  : int
	// isCopyEliminated = true
	j = _15;
	//loop (%1, %2, %3, %4, %5, %16, %17, %18, %19, %20)
	while(true){
		//const %16 = 10 : int
		_16 = 10;
		//ifge %4, %16 goto blklab0 : int
		if(j>=_16){goto blklab0;}
		//assign %1 = %3  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(a, c, int64_t);
		//assign %1 = %2  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(a, b);
		//assign %2 = %1  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(b, a, int64_t);
		//const %17 = 0 : int
		_17 = 0;
		//indexof %18 = %2, %17 : int[]
		_18=b[_17];
		//assign %5 = %18  : int
		// isCopyEliminated = true
		i = _18;
		//assign %2 = %3  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b, c);
		//assign %3 = %2  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(c, b, int64_t);
		//assign %3 = %1  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(c, a);
		//const %19 = 1 : int
		_19 = 1;
		//add %20 = %4, %19 : int
		_20=j+_19;
		//assign %4 = %20  : int
		// isCopyEliminated = true
		j = _20;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_14);
	exit(0);
}

