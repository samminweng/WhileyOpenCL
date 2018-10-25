#include "FunctionCall4.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(s), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(s);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(t);
	_DECL_DEALLOC(t);
	_DECL_1DARRAY(new_t);
	_DECL_DEALLOC(new_t);
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	//const %5 = 5 : int
	_5 = 5;
	//ifle %1, %5 goto blklab0 : int
	if(n<=_5){goto blklab0;}
	//assign %3 = %0  : int[]
	_ADD_DEALLOC(t, s, int64_t);
	//const %6 = 3 : int
	_6 = 3;
	//const %7 = 2 : int
	_7 = 2;
	//update %3[%7] = %6 : int[] -> int[]
	t[_7] = _6;
	//return %3
	_DEALLOC(s);
	_DEALLOC(_2);
	_DEALLOC(new_t);
	_DEALLOC(_13);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(t);
	return t;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %8 = 1 : int
	_8 = 1;
	//const %9 = 1 : int
	_9 = 1;
	//const %10 = 1 : int
	_10 = 1;
	//const %11 = 1 : int
	_11 = 1;
	//const %12 = 1 : int
	_12 = 1;
	//newlist %13 = (%8, %9, %10, %11, %12) : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 5, 0);
	_13[0] = _8; _13[1] = _9; _13[2] = _10; _13[3] = _11; _13[4] = _12; 
	_13_dealloc = true;
	//assign %4 = %13  : int[]
	_ADD_DEALLOC(new_t, _13, int64_t);
	//return %4
	_DEALLOC(s);
	_DEALLOC(_2);
	_DEALLOC(t);
	_DEALLOC(_13);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(new_t);
	return new_t;
//.blklab1
blklab1:;
	//return
}

