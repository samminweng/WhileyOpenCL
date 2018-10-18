#include "functioncall2_3Vars_test135.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(x);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(d);
	_DECL_DEALLOC(d);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10;
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13;
	int64_t _14;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 3 : int
	_8 = 3;
	//arraygen %9 = [7; 8] : int[]
	_NEW1DARRAY_DEALLOC(_9, _7, _8, int64_t);
	//assign %3 = %9  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _9);
	//const %10 = 1 : int
	_10 = 1;
	//const %11 = 3 : int
	_11 = 3;
	//arraygen %12 = [10; 11] : int[]
	_NEW1DARRAY_DEALLOC(_12, _10, _11, int64_t);
	//assign %4 = %12  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _12);
	//const %13 = 0 : int
	_13 = 0;
	//update %0[%13] = %1 : int[] -> int[]
	x[_13] = num;
	//assign %5 = %3  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, a);
	//assign %6 = %4  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(d, b);
	//const %14 = 9 : int
	_14 = 9;
	//ifle %1, %14 goto blklab0 : int
	if(num<=_14){goto blklab0;}
	//return %5
	_DEALLOC(x);
	_DEALLOC(_2);
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(d);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %6
	_DEALLOC(x);
	_DEALLOC(_2);
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(d);
	return d;
//.blklab1
blklab1:;
	//return
}

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
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	int64_t _20;
	int64_t _21;
	int64_t _22;
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
	//loop (%1, %2, %3, %4, %5, %16, %17, %18, %19, %20, %21, %22)
	while(true){
		//const %16 = 100 : int
		_16 = 100;
		//ifge %4, %16 goto blklab2 : int
		if(j>=_16){goto blklab2;}
		//assign %1 = %3  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(a, c);
		//assign %1 = %2  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(a, b, int64_t);
		//assign %3 = %1  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(c, a, int64_t);
		//const %17 = 0 : int
		_17 = 0;
		//indexof %18 = %2, %17 : int[]
		_18=b[_17];
		//assign %5 = %18  : int
		// isCopyEliminated = true
		i = _18;
		//assign %2 = %1  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b, a);
		//assign %2 = %3  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b, c);
		//assign %3 = %2  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(c, b, int64_t);
		//const %20 = 11 : int
		_20 = 11;
		//invoke (%19) = (%2, %20) functioncall2_3Vars_test135:func : function(int[],int)->(int[])
		{
			_CALLEE_DEALLOC(_19, b, "true-false-true" , "func");
			_DEALLOC(_19);
			void* tmp_x;
			_COPY_1DARRAY_PARAM(b, tmp_x, int64_t);
			// isCopyEliminated of '_2' = false
			_19 = _func_(tmp_x, b_size, _20, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
			_CALLEE_DEALLOC_POST(_19, tmp_x);
		}
		//assign %1 = %19  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(a, _19);
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %4, %21 : int
		_22=j+_21;
		//assign %4 = %22  : int
		// isCopyEliminated = true
		j = _22;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_19);
	exit(0);
}

