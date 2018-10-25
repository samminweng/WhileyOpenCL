#include "CallerMacro2.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(x);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t _3;
	//const %3 = 0 : int
	_3 = 0;
	//update %0[%3] = %1 : int[] -> int[]
	x[_3] = num;
	//return %0
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//return
}

int64_t* _g3_(int64_t x, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_NEW1DARRAY_DEALLOC(_6, _4, _5, int64_t);
	//assign %2 = %6  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _6);
	//const %8 = 11 : int
	_8 = 11;
	//invoke (%7) = (%2, %8) CallerMacro2:func : function(int[],int)->(int[])
	{
		_CALLER_DEALLOC(_7, a, "true-ALWAYS_RETURN-true" , "func");
		_DEALLOC(_7);
		void* tmp_x;
		_COPY_1DARRAY_PARAM(a, tmp_x, int64_t);
		// isCopyEliminated of '_2' = false
		_7 = _func_(tmp_x, a_size, _8, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_7));
		_CALLER_DEALLOC_POST(_7, tmp_x);
	}
	//assign %3 = %7  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _7);
	//const %9 = 0 : int
	_9 = 0;
	//ifle %0, %9 goto blklab0 : int
	if(x<=_9){goto blklab0;}
	//return %2
	_DEALLOC(_1);
	_DEALLOC(b);
	_DEALLOC(_6);
	_DEALLOC(_7);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_DEALLOC(_1);
	_DEALLOC(a);
	_DEALLOC(_6);
	_DEALLOC(_7);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
//.blklab1
blklab1:;
	//return
}

