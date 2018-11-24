#include "testcase7.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), int64_t i, int64_t j, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_3);
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
	int64_t _14;
	int64_t _15;
	//indexof %4 = %0, %1 : int[]
	_4=a[i];
	//indexof %5 = %0, %2 : int[]
	_5=a[j];
	//ifge %4, %5 goto blklab0 : int
	if(_4>=_5){goto blklab0;}
	//const %6 = 0 : int
	_6 = 0;
	//assign %1 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%0, %1, %7, %8, %9)
	while(true){
		//ifge %1, %2 goto blklab2 : int
		if(i>=j){goto blklab2;}
		//indexof %7 = %0, %2 : int[]
		_7=a[j];
		//update %0[%1] = %7 : int[] -> int[]
		a[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %1, %8 : int
		_9=i+_8;
		//assign %1 = %9  : int
		// isCopyEliminated = true
		i = _9;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %10 = 1 : int
	_10 = 1;
	//add %11 = %2, %10 : int
	_11=j+_10;
	//assign %1 = %11  : int
	// isCopyEliminated = true
	i = _11;
	//loop (%0, %1, %12, %13, %14, %15)
	while(true){
		//lengthof %12 = %0 : int[]
		_12 = a_size;
		//ifge %1, %12 goto blklab4 : int
		if(i>=_12){goto blklab4;}
		//indexof %13 = %0, %2 : int[]
		_13=a[j];
		//update %0[%1] = %13 : int[] -> int[]
		a[i] = _13;
		//const %14 = 1 : int
		_14 = 1;
		//add %15 = %1, %14 : int
		_15=i+_14;
		//assign %1 = %15  : int
		// isCopyEliminated = true
		i = _15;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(b);
	_DECL_1DARRAY(c);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	int64_t _10;
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_1DARRAY(_13);
	int64_t _14;
	int64_t _15;
	void* _16;
	int64_t _18;
	int64_t _19;
	void* _20;
	int64_t _22;
	int64_t _23;
	void* _24;
	int64_t _26;
	int64_t _27;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 2 : int
	_5 = 2;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	//assign %1 = %6  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _6);
	//const %7 = 2 : int
	_7 = 2;
	//const %8 = 2 : int
	_8 = 2;
	//arraygen %9 = [7; 8] : int[]
	_NEW_1DARRAY_int64_t(_9, _8, _7);
	//assign %2 = %9  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _9);
	//const %10 = 2 : int
	_10 = 2;
	//const %11 = 2 : int
	_11 = 2;
	//arraygen %12 = [10; 11] : int[]
	_NEW_1DARRAY_int64_t(_12, _11, _10);
	//assign %3 = %12  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, _12);
	//const %14 = 2 : int
	_14 = 2;
	//const %15 = 3 : int
	_15 = 3;
	//invoke (%13) = (%2, %14, %15) testcase7:func : function(int[],int,int)->(int[])
	{
		void* tmp_a;
		_COPY_1DARRAY_PARAM(b, tmp_a, int64_t);
		// isCopyEliminated of '_2' = false
		_13 = _func_(tmp_a, b_size, _14, _15, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_13));
	}
	//assign %1 = %13  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _13);
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = 0 : int
	_18 = 0;
	//indexof %19 = %1, %18 : int[]
	_19=a[_18];
	//indirectinvoke () = %17 (%19) : method(any)->()
	{
		printf("%"PRId64"\n", _19);
	}
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = 0 : int
	_22 = 0;
	//indexof %23 = %2, %22 : int[]
	_23=b[_22];
	//indirectinvoke () = %21 (%23) : method(any)->()
	{
		printf("%"PRId64"\n", _23);
	}
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = 0 : int
	_26 = 0;
	//indexof %27 = %3, %26 : int[]
	_27=c[_26];
	//indirectinvoke () = %25 (%27) : method(any)->()
	{
		printf("%"PRId64"\n", _27);
	}
	//return
	exit(0);
}

