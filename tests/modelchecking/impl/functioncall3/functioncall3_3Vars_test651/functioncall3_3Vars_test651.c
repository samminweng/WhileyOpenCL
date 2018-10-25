#include "functioncall3_3Vars_test651.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	int64_t i;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	//const %3 = 0 : int
	_3 = 0;
	//assign %2 = %3  : int
	// isCopyEliminated = true
	i = _3;
	//loop (%0, %2, %4, %5, %6, %7)
	while(true){
		//lengthof %4 = %0 : int[]
		_4 = a_size;
		//ifge %2, %4 goto blklab0 : int
		if(i>=_4){goto blklab0;}
		//const %5 = 5 : int
		_5 = 5;
		//update %0[%2] = %5 : int[] -> int[]
		a[i] = _5;
		//const %6 = 1 : int
		_6 = 1;
		//add %7 = %2, %6 : int
		_7=i+_6;
		//assign %2 = %7  : int
		// isCopyEliminated = true
		i = _7;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_DEALLOC(_1);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
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
	//loop (%1, %2, %3, %4, %5, %16, %17, %18, %19, %20, %21)
	while(true){
		//const %16 = 10 : int
		_16 = 10;
		//ifge %4, %16 goto blklab2 : int
		if(j>=_16){goto blklab2;}
		//assign %3 = %2  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(c, b);
		//assign %2 = %3  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b, c);
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
		//assign %3 = %1  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(c, a);
		//assign %1 = %3  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(a, c);
		//assign %1 = %2  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(a, b, int64_t);
		//invoke (%19) = (%2) functioncall3_3Vars_test651:func : function(int[])->(int[])
		{
			_FUNCTIONCALL_COPY_PRE(_19, b, "true-MAYBE_RETURN-true" , "func");
			_DEALLOC(_19);
			void* tmp_a;
			_COPY_1DARRAY_PARAM(b, tmp_a, int64_t);
			// isCopyEliminated of '_2' = false
			_19 = _func_(tmp_a, b_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
			if(_19 != tmp_a ){
				free(tmp_a);
			}
			_19_dealloc = true;
		}
		//assign %1 = %19  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(a, _19);
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %4, %20 : int
		_21=j+_20;
		//assign %4 = %21  : int
		// isCopyEliminated = true
		j = _21;
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

