#include "2parameter_test83.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t ra;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	//const %4 = 0 : int
	_4 = 0;
	//indexof %5 = %0, %4 : int[]
	_5=a[_4];
	//assign %3 = %5  : int
	// isCopyEliminated = true
	ra = _5;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//update %1[%7] = %6 : int[] -> int[]
	b[_7] = _6;
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %0, %8 : int[]
	_9=a[_8];
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %1, %10 : int[]
	_11=b[_10];
	//ifne %9, %11 goto blklab0 : int
	if(_9!=_11){goto blklab0;}
	//const %12 = 3 : int
	_12 = 3;
	//const %13 = 3 : int
	_13 = 3;
	//arraygen %14 = [12; 13] : int[]
	_NEW1DARRAY_DEALLOC(_14, _12, _13, int64_t);
	//return %14
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_14);
	return _14;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %1
	_DEALLOC(a);
	_DEALLOC(_2);
	_DEALLOC(_14);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 2 : int
	_5 = 2;
	//arraygen %6 = [4; 5] : int[]
	_NEW1DARRAY_DEALLOC(_6, _4, _5, int64_t);
	//assign %1 = %6  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _6);
	//const %7 = 2 : int
	_7 = 2;
	//const %8 = 2 : int
	_8 = 2;
	//arraygen %9 = [7; 8] : int[]
	_NEW1DARRAY_DEALLOC(_9, _7, _8, int64_t);
	//assign %2 = %9  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _9);
	//invoke (%10) = (%1, %2) 2parameter_test83:func : function(int[],int[])->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_10, b, "true-MAYBE_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_10, a, "false-NEVER_RETURN-false" , "func");
		_DEALLOC(_10);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_2' = true
		_10 = _func_(a, a_size, b, b_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		if( _10 == b ){
			_10_dealloc = b_dealloc;
			b_dealloc = false;
		} else {
			_10_dealloc = true;
		}
	}
	//assign %3 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _10);
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(r);
	_DEALLOC(_6);
	_DEALLOC(_9);
	_DEALLOC(_10);
	exit(0);
}

