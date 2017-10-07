#include "reverse.h"
int64_t* _reverse_(_DECL_1DARRAY_PARAM(ls), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	int64_t i;
	_DECL_1DARRAY(r);
	int64_t item;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	//lengthof %5 = %0 : int[]
	_5 = ls_size;
	//assign %2 = %5  : int
	// isCopyEliminated = true
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//lengthof %7 = %0 : int[]
	_7 = ls_size;
	//arraygen %8 = [6; 7] : int[]
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	//assign %3 = %8  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _8);
	//loop (%2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %16, %17)
	while(true){
		//const %12 = 0 : int
		_12 = 0;
		//ifle %2, %12 goto blklab0 : int
		if(i<=_12){goto blklab0;}
		//lengthof %13 = %0 : int[]
		_13 = ls_size;
		//sub %14 = %13, %2 : int
		_14=_13-i;
		//indexof %15 = %0, %14 : int[]
		_15=ls[_14];
		//assign %4 = %15  : int
		// isCopyEliminated = true
		item = _15;
		//const %16 = 1 : int
		_16 = 1;
		//sub %17 = %2, %16 : int
		_17=i-_16;
		//assign %2 = %17  : int
		// isCopyEliminated = true
		i = _17;
		//update %3[%2] = %4 : int[] -> int[]
		r[i] = item;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %3
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(r);
	return r;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(input);
	int64_t index;
	_DECL_1DARRAY(tmp);
	_DECL_1DARRAY(output);
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	_DECL_1DARRAY(_14);
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 10 : int
	_6 = 10;
	//arraygen %7 = [5; 6] : int[]
	_NEW_1DARRAY_int64_t(_7, _6, _5);
	//assign %1 = %7  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(input, _7);
	//const %8 = 0 : int
	_8 = 0;
	//assign %2 = %8  : int
	// isCopyEliminated = true
	index = _8;
	//loop (%1, %2, %9, %10, %11, %12, %13)
	while(true){
		//const %9 = 10 : int
		_9 = 10;
		//ifge %2, %9 goto blklab4 : int
		if(index>=_9){goto blklab4;}
		//const %10 = 10 : int
		_10 = 10;
		//sub %11 = %10, %2 : int
		_11=_10-index;
		//update %1[%2] = %11 : int[] -> int[]
		input[index] = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %2, %12 : int
		_13=index+_12;
		//assign %2 = %13  : int
		// isCopyEliminated = true
		index = _13;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//invoke (%14) = (%1) reverse:reverse : function(int[])->(int[])
	{
		// isCopyEliminated of '_1' = true
		_14 = _reverse_(input, input_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
	}
	//assign %3 = %14  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(tmp, _14);
	//assert
	{
		//const %15 = 0 : int
		_15 = 0;
		//indexof %16 = %1, %15 : int[]
		_16=input[_15];
		//const %17 = 10 : int
		_17 = 10;
		//ifeq %16, %17 goto blklab6 : int
		if(_16==_17){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//assign %4 = %3  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, tmp);
	//assert
	{
		//const %18 = 0 : int
		_18 = 0;
		//indexof %19 = %4, %18 : int[]
		_19=output[_18];
		//const %20 = 1 : int
		_20 = 1;
		//ifeq %19, %20 goto blklab7 : int
		if(_19==_20){goto blklab7;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab7
blklab7:;
	//assert
	}
	//return
	exit(0);
}

