#include "ArrayAppend.h"
int64_t* _test_append_(_DECL_1DARRAY_PARAM(lhs), _DECL_1DARRAY_PARAM(rhs), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_1DARRAY(rs);
	int64_t i;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	//const %5 = 0 : int
	_5 = 0;
	//lengthof %6 = %0 : int[]
	_6 = lhs_size;
	//lengthof %7 = %1 : int[]
	_7 = rhs_size;
	//add %8 = %6, %7 : int
	_8=_6+_7;
	//arraygen %9 = [5; 8] : int[]
	_NEW_1DARRAY_int64_t(_9, _8, _5);
	//assign %3 = %9  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(rs, _9);
	//lengthof %10 = %0 : int[]
	_10 = lhs_size;
	//assign %4 = %10  : int
	// isCopyEliminated = true
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
		// isCopyEliminated = true
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
		// isCopyEliminated = true
		i = _20;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %3
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(rs);
	return rs;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(r);
	void* _2;
	size_t _2_size = 0;
	_DECL_1DARRAY(_3);
	_DECL_1DARRAY(_4);
	void* _5;
	//const %2 = [] : void[]
	_NEW_1DARRAY_int64_t(_2, 0, 0);
	//assign %1 = %2  : void[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _2);
	//const %4 = [32,84,104,105,115,32,105,115,32,97,32,116,101,115,116,32] : int[]
	_NEW_1DARRAY_int64_t(_4, 16, 0);
	_4[0] = 32; _4[1] = 84; _4[2] = 104; _4[3] = 105; _4[4] = 115; _4[5] = 32; _4[6] = 105; _4[7] = 115; _4[8] = 32; _4[9] = 97; _4[10] = 32; _4[11] = 116; _4[12] = 101; _4[13] = 115; _4[14] = 116; _4[15] = 32; 
	//invoke (%3) = (%1, %4) ArrayAppend:test_append : function(int[],int[])->(int[])
	{
		// isCopyEliminated of 'r at 0' = true
		// isCopyEliminated of '_4 at 1' = true
		_3 = _test_append_(r, r_size, _4, _4_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_3));
	}
	//assign %1 = %3  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _3);
	//fieldload %5 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %6 = %5 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %6 (%1) : method(int[])->()
	{
		println_s(r, r_size);
	}
	//return
	exit(0);
}

