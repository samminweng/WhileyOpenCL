#include "nomutate_noreturn_nolive.h"
long long* f(_DECL_1DARRAY_PARAM(ls)){
	_DECL_1DARRAY(new_ls);
	_DECL_1DARRAY(_2);
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	_DECL_1DARRAY(_6);
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 3 : int
	_5 = 3;
	//newlist %6 = (%3, %4, %5) : int[]
	_NEW_ARRAY(_6, 3);
	_6[0] = _3; _6[1] = _4; _6[2] = _5; 
	//assign %2 = %6  : int[]
	_1DARRAY_UPDATE(_2, _6);
	//assign %1 = %2  : int[]
	_1DARRAY_UPDATE(new_ls, _2);
	//return %1 : int[]
	return new_ls;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(b);
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(_3);
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_1DARRAY(_8);
	_DECL_1DARRAY(_9);
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	_DECL_1DARRAY(_13);
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	_DECL_1DARRAY(_17);
	//const %4 = 1 : int
	_4 = 1;
	//const %5 = 2 : int
	_5 = 2;
	//const %6 = 3 : int
	_6 = 3;
	//newlist %7 = (%4, %5, %6) : int[]
	_NEW_ARRAY(_7, 3);
	_7[0] = _4; _7[1] = _5; _7[2] = _6; 
	//assign %3 = %7  : int[]
	_1DARRAY_UPDATE(_3, _7);
	//assign %1 = %3  : int[]
	_1DARRAY_UPDATE(b, _3);
	//invoke %9 = (%1) nomutate_noreturn_nolive:f : function(int[]) -> int[]
	_1DARRAY_SIZE(_9, b);
	_9 = f(_1DARRAY_PARAM(b));
	//assign %8 = %9  : int[]
	_1DARRAY_UPDATE(_8, _9);
	//assign %2 = %8  : int[]
	_1DARRAY_UPDATE(a, _8);
	//assert
	{
		//const %10 = 0 : int
		_10 = 0;
		//const %11 = 2 : int
		_11 = 2;
		//const %12 = 3 : int
		_12 = 3;
		//newlist %13 = (%10, %11, %12) : int[]
		_NEW_ARRAY(_13, 3);
		_13[0] = _10; _13[1] = _11; _13[2] = _12; 
		//ifeq %2, %13 goto blklab0 : int[]
		_IFEQ_ARRAY(a, _13, blklab0);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//assert
	{
		//const %14 = 1 : int
		_14 = 1;
		//const %15 = 2 : int
		_15 = 2;
		//const %16 = 3 : int
		_16 = 3;
		//newlist %17 = (%14, %15, %16) : int[]
		_NEW_ARRAY(_17, 3);
		_17[0] = _14; _17[1] = _15; _17[2] = _16; 
		//ifeq %1, %17 goto blklab1 : int[]
		_IFEQ_ARRAY(b, _17, blklab1);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//return
	exit(0);
}
