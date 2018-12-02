#include "specialcase6.h"
int64_t* _fill_(_DECL_1DARRAY_PARAM(a), int64_t v, int64_t i, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	int64_t _6;
	int64_t _7;
	//lengthof %4 = %0 : int[]
	_4 = a_size;
	//ifge %2, %4 goto blklab0 : int
	if(i>=_4){goto blklab0;}
	//update %0[%2] = %1 : int[] -> int[]
	a[i] = v;
	//const %6 = 1 : int
	_6 = 1;
	//add %7 = %2, %6 : int
	_7=i+_6;
	//invoke (%5) = (%0, %1, %7) specialcase6:fill : function(int[],int,int)->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_5, a, 0, "liveness: a = false, readonly: a = false, return:a = MAYBE_RETURN" , "fill");
		_DEALLOC(_5);
		// isCopyEliminated of 'a at 0' = true
		_5 = _fill_(a, a_size, v, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_5));
		if( _5 == a ){
			_5_dealloc = a_dealloc;
			a_dealloc = false;
		} else {
			_5_dealloc = true;
		}
	}
	//return %5
	_DEALLOC(a);
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_5);
	return _5;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %0
	_DEALLOC(_3);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 7 : int
	_4 = 7;
	//arraygen %5 = [3; 4] : int[]
	_NEW1DARRAY_DEALLOC(_5, _3, _4, int64_t);
	//assign %1 = %5  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _5);
	//const %7 = 8 : int
	_7 = 8;
	//const %8 = 0 : int
	_8 = 0;
	//invoke (%6) = (%1, %7, %8) specialcase6:fill : function(int[],int,int)->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_6, a, 0, "liveness: a = false, readonly: a = false, return:a = MAYBE_RETURN" , "fill");
		_DEALLOC(_6);
		// isCopyEliminated of 'a at 0' = true
		_6 = _fill_(a, a_size, _7, _8, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		if( _6 == a ){
			_6_dealloc = a_dealloc;
			a_dealloc = false;
		} else {
			_6_dealloc = true;
		}
	}
	//assign %2 = %6  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _6);
	//assert
	{
		//lengthof %9 = %2 : int[]
		_9 = b_size;
		//const %10 = 7 : int
		_10 = 7;
		//ifeq %9, %10 goto blklab2 : int
		if(_9==_10){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//assert
	{
		//const %11 = 0 : int
		_11 = 0;
		//indexof %12 = %2, %11 : int[]
		_12=b[_11];
		//const %13 = 8 : int
		_13 = 8;
		//ifeq %12, %13 goto blklab3 : int
		if(_12==_13){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//assert
	{
		//const %14 = 6 : int
		_14 = 6;
		//indexof %15 = %2, %14 : int[]
		_15=b[_14];
		//const %16 = 8 : int
		_16 = 8;
		//ifeq %15, %16 goto blklab4 : int
		if(_15==_16){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(_5);
	_DEALLOC(_6);
	exit(0);
}

