#include "While_Valid_1.h"
int64_t* reverse(_DECL_1DARRAY_PARAM(ls), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	uint16_t i = 0;
	_DECL_1DARRAY(r);
	int64_t item = 0;
	uint16_t _5 = 0;
	uint16_t _6 = 0;
	uint16_t _7 = 0;
	_DECL_1DARRAY(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	uint16_t _12 = 0;
	uint16_t _13 = 0;
	uint16_t _14 = 0;
	int64_t _15 = 0;
	int16_t _16 = 0;
	uint16_t _17 = 0;
	//lengthof %5 = %0 : int[]
	_5 = ls_size;
	//assign %2 = %5  : int
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//lengthof %7 = %0 : int[]
	_7 = ls_size;
	//arraygen %8 = [6; 7] : int[]
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	//assign %3 = %8  : int[]
	_COPY_1DARRAY_int64_t(r, _8);
	//loop (%2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %16, %17)
	while(true){
		//invariant
		{
			//lengthof %9 = %0 : int[]
			_9 = ls_size;
			//ifgt %2, %9 goto blklab3 : int
			if(i>_9){goto blklab3;}
			//lengthof %10 = %3 : int[]
			_10 = r_size;
			//lengthof %11 = %0 : int[]
			_11 = ls_size;
			//ifeq %10, %11 goto blklab2 : int
			if(_10==_11){goto blklab2;}
//.blklab3
blklab3:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab2
blklab2:;
		//invariant
		}
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
		item = _15;
		//const %16 = 1 : int
		_16 = 1;
		//sub %17 = %2, %16 : int
		_17=i-_16;
		//assign %2 = %17  : int
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
	_DECL_1DARRAY(rs);
	_DECL_1DARRAY(_2);
	uint16_t _3 = 0;
	uint16_t _4 = 0;
	uint16_t _5 = 0;
	uint16_t _6 = 0;
	uint16_t _7 = 0;
	_DECL_1DARRAY(_8);
	uint16_t _9 = 0;
	uint16_t _10 = 0;
	uint16_t _11 = 0;
	uint16_t _12 = 0;
	uint16_t _13 = 0;
	_DECL_1DARRAY(_14);
	void* _15;
	//const %3 = 1 : int
	_3 = 1;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 3 : int
	_5 = 3;
	//const %6 = 4 : int
	_6 = 4;
	//const %7 = 5 : int
	_7 = 5;
	//newlist %8 = (%3, %4, %5, %6, %7) : int[]
	_NEW_1DARRAY_int64_t(_8, 5, 0);
	_8[0] = _3; _8[1] = _4; _8[2] = _5; _8[3] = _6; _8[4] = _7; 
	//invoke (%2) = (%8) While_Valid_1:reverse : function(int[])->(int[])
	{
		void* _8_tmp;
		_2 = reverse(_COPY_1DARRAY_PARAM_int64_t(_8), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_2));
	}
	//assign %1 = %2  : int[]
	_COPY_1DARRAY_int64_t(rs, _2);
	//assert
	{
		//const %9 = 5 : int
		_9 = 5;
		//const %10 = 4 : int
		_10 = 4;
		//const %11 = 3 : int
		_11 = 3;
		//const %12 = 2 : int
		_12 = 2;
		//const %13 = 1 : int
		_13 = 1;
		//newlist %14 = (%9, %10, %11, %12, %13) : int[]
		_NEW_1DARRAY_int64_t(_14, 5, 0);
		_14[0] = _9; _14[1] = _10; _14[2] = _11; _14[3] = _12; _14[4] = _13; 
		//ifeq %1, %14 goto blklab4 : int[]
		_IFEQ_ARRAY(rs, _14, blklab4);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%1) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(rs);
	}
	//return
	exit(0);
}

