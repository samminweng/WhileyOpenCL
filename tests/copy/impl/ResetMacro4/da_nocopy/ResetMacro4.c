#include "ResetMacro4.h"
int64_t* _add_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	int64_t length;
	_DECL_1DARRAY(r);
	int64_t i;
	int64_t aa;
	int64_t bb;
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	//lengthof %8 = %0 : int[]
	_8 = a_size;
	//assign %3 = %8  : int
	// isCopyEliminated = true
	length = _8;
	//const %9 = 0 : int
	_9 = 0;
	//arraygen %10 = [9; 3] : int[]
	_NEW_1DARRAY_int64_t(_10, length, _9);
	//assign %4 = %10  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _10);
	//const %11 = 0 : int
	_11 = 0;
	//assign %5 = %11  : int
	// isCopyEliminated = true
	i = _11;
	//loop (%0, %1, %5, %6, %7, %12, %13, %14, %15, %16, %17)
	while(true){
		//ifge %5, %3 goto blklab0 : int
		if(i>=length){goto blklab0;}
		//indexof %12 = %0, %5 : int[]
		_12=a[i];
		//assign %6 = %12  : int
		// isCopyEliminated = true
		aa = _12;
		//indexof %13 = %1, %5 : int[]
		_13=b[i];
		//assign %7 = %13  : int
		// isCopyEliminated = true
		bb = _13;
		//add %14 = %6, %7 : int
		_14=aa+bb;
		//update %0[%5] = %14 : int[] -> int[]
		a[i] = _14;
		//const %15 = 0 : int
		_15 = 0;
		//update %1[%5] = %15 : int[] -> int[]
		b[i] = _15;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %5, %16 : int
		_17=i+_16;
		//assign %5 = %17  : int
		// isCopyEliminated = true
		i = _17;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	int64_t i;
	_DECL_1DARRAY(sum);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	_DECL_1DARRAY(_11);
	int64_t _12;
	int64_t _13;
	void* _14;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 10 : int
	_5 = 10;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	//assign %1 = %6  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _6);
	//const %7 = 0 : int
	_7 = 0;
	//assign %2 = %7  : int
	// isCopyEliminated = true
	i = _7;
	//loop (%1, %2, %8, %9, %10)
	while(true){
		//const %8 = 10 : int
		_8 = 10;
		//ifge %2, %8 goto blklab2 : int
		if(i>=_8){goto blklab2;}
		//update %1[%2] = %2 : int[] -> int[]
		a[i] = i;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %2, %9 : int
		_10=i+_9;
		//assign %2 = %10  : int
		// isCopyEliminated = true
		i = _10;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//invoke (%11) = (%1, %1) ResetMacro4:add : function(int[],int[])->(int[])
	{
		void* tmp_a_0;
		_COPY_1DARRAY_PARAM(a, tmp_a_0, int64_t);
		void* tmp_a_1;
		_COPY_1DARRAY_PARAM(a, tmp_a_1, int64_t);
		// isCopyEliminated of '_1' = false
		// isCopyEliminated of '_1' = false
		_11 = _add_(tmp_a_0, a_size, tmp_a_1, a_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_11));
	}
	//assign %3 = %11  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(sum, _11);
	//const %12 = 0 : int
	_12 = 0;
	//assign %2 = %12  : int
	// isCopyEliminated = true
	i = _12;
	//loop (%2, %13, %14, %15, %16, %17, %18, %19, %20, %21)
	while(true){
		//const %13 = 10 : int
		_13 = 10;
		//ifge %2, %13 goto blklab4 : int
		if(i>=_13){goto blklab4;}
		//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indexof %16 = %3, %2 : int[]
		_16=sum[i];
		//indirectinvoke () = %15 (%16) : method(any)->()
		{
			printf("%"PRId64"\n", _16);
		}
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %2, %20 : int
		_21=i+_20;
		//assign %2 = %21  : int
		// isCopyEliminated = true
		i = _21;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return
	exit(0);
}

