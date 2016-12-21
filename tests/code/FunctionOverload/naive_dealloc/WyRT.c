// This file stores built-in functions in wyrt modules.
#include "WyRT.h"

int64_t* Int_toString(int64_t item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(r);

	int64_t value = item;
	size_t i=0;
	// Calculate the length of item
	do{
		// Increment the size
		r_size++;
	}while((value = value/10)>0);

	// Create an integer array
	r = malloc(r_size*sizeof(int64_t));
	i=r_size;
	// Convert an integer to 'r' integer array
	do{
		i--;
		// Get remain
		r[i] = item%10+'0';
	}while((item = item/10)>0);

	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(r);
	return r;
}

int64_t* Array_Append(_DECL_1DARRAY_PARAM(lhs), _DECL_1DARRAY_PARAM(rhs), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(rs);
	_DECL_DEALLOC(rs);
	int64_t i = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//lengthof %6 = %0 : int[]
	_6 = lhs_size;
	//lengthof %7 = %1 : int[]
	_7 = rhs_size;
	//add %8 = %6, %7 : int
	_8=_6+_7;
	//arraygen %9 = [5; 8] : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY_int64_t(_9, _8, _5);
	_ADD_DEALLOC(_9);
	//assign %3 = %9  : int[]
	_DEALLOC(rs);
	_UPDATE_1DARRAY(rs, _9);
	_TRANSFER_DEALLOC(rs, _9);
	//lengthof %10 = %0 : int[]
	_10 = lhs_size;
	//assign %4 = %10  : int
	i = _10;
	//loop (%3, %4, %11, %12, %13, %14)
	while(true){
		//const %11 = 0 : int
		_11 = 0;
		//ifle %4, %11 goto blklab0 : int
		if(i<=_11){goto blklab0;}
		//const %12 = 1 : int
		_12 = 1;
		//sub %13 = %4, %12 : int
		_13=i-_12;
		//assign %4 = %13  : int
		i = _13;
		//indexof %14 = %0, %4 : int[]
		_14=lhs[i];
		//update %3[%4] = %14 : int[] -> int[]
		rs[i] = _14;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//loop (%3, %4, %15, %16, %17, %18, %19, %20)
	while(true){
		//lengthof %15 = %1 : int[]
		_15 = rhs_size;
		//ifge %4, %15 goto blklab2 : int
		if(i>=_15){goto blklab2;}
		//indexof %16 = %1, %4 : int[]
		_16=rhs[i];
		//lengthof %17 = %0 : int[]
		_17 = lhs_size;
		//add %18 = %4, %17 : int
		_18=i+_17;
		//update %3[%18] = %16 : int[] -> int[]
		rs[_18] = _16;
		//const %19 = 1 : int
		_19 = 1;
		//add %20 = %4, %19 : int
		_20=i+_19;
		//assign %4 = %20  : int
		i = _20;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %3
	_DEALLOC(_2);
	_DEALLOC(_9);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(rs);
	return rs;
	//return
}
