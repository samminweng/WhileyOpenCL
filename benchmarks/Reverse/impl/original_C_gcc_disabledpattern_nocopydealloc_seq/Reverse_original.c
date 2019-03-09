#include "Reverse_original.h"
int64_t* _reverse_(_DECL_1DARRAY_PARAM(arr), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(arr);
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	int64_t i;
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t item;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
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
	_5 = arr_size;
	//assign %2 = %5  : int
	// isCopyEliminated = true
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//lengthof %7 = %0 : int[]
	_7 = arr_size;
	//arraygen %8 = [6; 7] : int[]
	_NEW1DARRAY_DEALLOC(_8, _6, _7, int64_t);
	//assign %3 = %8  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _8);
	//loop (%2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %16, %17)
	while(true){
		//const %12 = 0 : int
		_12 = 0;
		//ifle %2, %12 goto blklab0 : int
		if(i<=_12){goto blklab0;}
		//lengthof %13 = %0 : int[]
		_13 = arr_size;
		//sub %14 = %13, %2 : int
		_14=_13-i;
		//indexof %15 = %0, %14 : int[]
		_15=arr[_14];
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
	_DEALLOC(arr);
	_DEALLOC(_1);
	_DEALLOC(_8);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(r);
	return r;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t max;
	int64_t size;
	int64_t repeats;
	int64_t index;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	int64_t* _7;
	_DECL_DEALLOC(_7);
	_DECL_2DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	int64_t _16;
	int64_t _17;
	int64_t _18;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	void* _20;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	void* _25;
	int64_t _27;
	int64_t _28;
	void* _29;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	void* _32;
	void* _34;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	//fieldload %8 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY(_8);
	_CONV_ARGS(_8);
	_8_dealloc = true;
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	_10_size = _8_size_size;
	_10_dealloc = false;
	//invoke (%7) = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_7, _10);
		_10_dealloc = false;
	}
	//assign %1 = %7  : null|int
	// isCopyEliminated = true
	_DEALLOC(n);
	n = _7;
	_TRANSFER_DEALLOC_POST(n, _7);
	//ifis %1, null goto blklab4 : null|int
	if(n == NULL) { goto blklab4;}
	//const %11 = 1 : int
	_11 = 1;
	//assign %2 = %11  : int
	// isCopyEliminated = true
	max = _11;
	//assign %3 = %1  : int
	// isCopyEliminated = true
	size = *n;
	//const %12 = 0 : int
	_12 = 0;
	//assign %4 = %12  : int
	// isCopyEliminated = true
	repeats = _12;
	//loop (%4, %5, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28)
	while(true){
		//ifge %4, %2 goto blklab5 : int
		if(repeats>=max){goto blklab5;}
		//const %13 = 0 : int
		_13 = 0;
		//assign %5 = %13  : int
		// isCopyEliminated = true
		index = _13;
		//const %14 = 0 : int
		_14 = 0;
		//arraygen %15 = [14; 3] : int[]
		_NEW1DARRAY_DEALLOC(_15, _14, size, int64_t);
		//assign %6 = %15  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(arr, _15);
		//loop (%5, %6, %16, %17, %18)
		while(true){
			//ifge %5, %3 goto blklab7 : int
			if(index>=size){goto blklab7;}
			//sub %16 = %3, %5 : int
			_16=size-index;
			//update %6[%5] = %16 : int[] -> int[]
			arr[index] = _16;
			//const %17 = 1 : int
			_17 = 1;
			//add %18 = %5, %17 : int
			_18=index+_17;
			//assign %5 = %18  : int
			// isCopyEliminated = true
			index = _18;
//.blklab8
blklab8:;
		}
//.blklab7
blklab7:;
		//invoke (%19) = (%6) Reverse_original:reverse : function(int[])->(int[])
		{
			_FUNCTIONCALL_NO_COPY_PRE(_19, arr, 0, "liveness: arr = false, readonly: arr = true, return:arr = NEVER_RETURN" , "reverse");
			_DEALLOC(_19);
			// isCopyEliminated of 'arr at 0' = true
			_19 = _reverse_(arr, arr_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
			_19_dealloc = true;
		}
		//assign %6 = %19  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(arr, _19);
		//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %21 = %20 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %22 = 1 : int
		_22 = 1;
		//sub %23 = %3, %22 : int
		_23=size-_22;
		//indexof %24 = %6, %23 : int[]
		_24=arr[_23];
		//indirectinvoke () = %21 (%24) : method(any)->()
		{
			printf("%"PRId64"\n", _24);
		}
		//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %26 = %25 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %26 (%4) : method(any)->()
		{
			printf("%"PRId64"\n", repeats);
		}
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %4, %27 : int
		_28=repeats+_27;
		//assign %4 = %28  : int
		// isCopyEliminated = true
		repeats = _28;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = [78,117,109,98,101,114,32,111,102,32,114,101,112,101,97,116,115,58,32] : int[]
	_DEALLOC(_31);
	_NEW_1DARRAY_int64_t(_31, 19, 0);
	_31[0] = 78; _31[1] = 117; _31[2] = 109; _31[3] = 98; _31[4] = 101; _31[5] = 114; _31[6] = 32; _31[7] = 111; _31[8] = 102; _31[9] = 32; _31[10] = 114; _31[11] = 101; _31[12] = 112; _31[13] = 101; _31[14] = 97; _31[15] = 116; _31[16] = 115; _31[17] = 58; _31[18] = 32; 
	_31_dealloc = true;
	//indirectinvoke () = %30 (%31) : method(int[])->()
	{
		printf_s(_31, _31_size);
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %33 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", repeats);
	}
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %36 = [80,97,115,115,32,82,101,118,101,114,115,101,32,116,101,115,116,32,99,97,115,101,32] : int[]
	_DEALLOC(_36);
	_NEW_1DARRAY_int64_t(_36, 23, 0);
	_36[0] = 80; _36[1] = 97; _36[2] = 115; _36[3] = 115; _36[4] = 32; _36[5] = 82; _36[6] = 101; _36[7] = 118; _36[8] = 101; _36[9] = 114; _36[10] = 115; _36[11] = 101; _36[12] = 32; _36[13] = 116; _36[14] = 101; _36[15] = 115; _36[16] = 116; _36[17] = 32; _36[18] = 99; _36[19] = 97; _36[20] = 115; _36[21] = 101; _36[22] = 32; 
	_36_dealloc = true;
	//indirectinvoke () = %35 (%36) : method(int[])->()
	{
		println_s(_36, _36_size);
	}
//.blklab4
blklab4:;
	//return
	_DEALLOC(n);
	_DEALLOC(arr);
	_DEALLOC(_7);
	_FREE_ARGS(_8);
	_DEALLOC(_10);
	_DEALLOC(_15);
	_DEALLOC(_19);
	_DEALLOC(_31);
	_DEALLOC(_36);
	exit(0);
}

