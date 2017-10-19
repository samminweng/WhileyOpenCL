#include "Reverse_original.h"
int64_t* _reverse_(_DECL_1DARRAY_PARAM(arr), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
	_5 = arr_size;
	//assign %2 = %5  : int
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//lengthof %7 = %0 : int[]
	_7 = arr_size;
	//arraygen %8 = [6; 7] : int[]
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	//assign %3 = %8  : int[]
	_COPY_1DARRAY_int64_t(r, _8);
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
	int64_t* n;
	int64_t max;
	int64_t size;
	int64_t repeats;
	int64_t index;
	_DECL_1DARRAY(arr);
	int64_t* _7;
	_DECL_2DARRAY(_8);
	int64_t _9;
	_DECL_1DARRAY(_10);
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	int64_t _16;
	int64_t _17;
	int64_t _18;
	_DECL_1DARRAY(_19);
	void* _20;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	void* _27;
	_DECL_1DARRAY(_29);
	void* _30;
	void* _32;
	_DECL_1DARRAY(_34);
	//fieldload %8 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_8);
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	_10_size = _8_size_size;
	//invoke (%7) = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_7, _10);
	}
	//assign %1 = %7  : null|int
	_NEW_INTEGER_POINTER(n, _7);
	//ifis %1, null goto blklab4 : null|int
	if(n == NULL) { goto blklab4;}
	//assign %2 = %1  : int
	max = *n;
	//const %11 = 10000000 : int
	_11 = 10000000;
	//assign %3 = %11  : int
	size = _11;
	//const %12 = 0 : int
	_12 = 0;
	//assign %4 = %12  : int
	repeats = _12;
	//loop (%4, %5, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26)
	while(true){
		//ifge %4, %2 goto blklab5 : int
		if(repeats>=max){goto blklab5;}
		//const %13 = 0 : int
		_13 = 0;
		//assign %5 = %13  : int
		index = _13;
		//const %14 = 0 : int
		_14 = 0;
		//arraygen %15 = [14; 3] : int[]
		_NEW_1DARRAY_int64_t(_15, size, _14);
		//assign %6 = %15  : int[]
		_COPY_1DARRAY_int64_t(arr, _15);
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
			index = _18;
//.blklab8
blklab8:;
		}
//.blklab7
blklab7:;
		//invoke (%19) = (%6) Reverse_original:reverse : function(int[])->(int[])
		{
			void* tmp_arr_0;
			_COPY_1DARRAY_PARAM(arr, tmp_arr_0, int64_t);
			_19 = _reverse_(tmp_arr_0, arr_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
		}
		//assign %6 = %19  : int[]
		_COPY_1DARRAY_int64_t(arr, _19);
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
		//const %25 = 1 : int
		_25 = 1;
		//add %26 = %4, %25 : int
		_26=repeats+_25;
		//assign %4 = %26  : int
		repeats = _26;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %29 = [78,117,109,98,101,114,32,111,102,32,114,101,112,101,97,116,115,58,32] : int[]
	_NEW_1DARRAY_int64_t(_29, 19, 0);
	_29[0] = 78; _29[1] = 117; _29[2] = 109; _29[3] = 98; _29[4] = 101; _29[5] = 114; _29[6] = 32; _29[7] = 111; _29[8] = 102; _29[9] = 32; _29[10] = 114; _29[11] = 101; _29[12] = 112; _29[13] = 101; _29[14] = 97; _29[15] = 116; _29[16] = 115; _29[17] = 58; _29[18] = 32; 
	//indirectinvoke () = %28 (%29) : method(int[])->()
	{
		printf_s(_29, _29_size);
	}
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %31 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", repeats);
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %34 = [80,97,115,115,32,82,101,118,101,114,115,101,32,116,101,115,116,32,99,97,115,101,32] : int[]
	_NEW_1DARRAY_int64_t(_34, 23, 0);
	_34[0] = 80; _34[1] = 97; _34[2] = 115; _34[3] = 115; _34[4] = 32; _34[5] = 82; _34[6] = 101; _34[7] = 118; _34[8] = 101; _34[9] = 114; _34[10] = 115; _34[11] = 101; _34[12] = 32; _34[13] = 116; _34[14] = 101; _34[15] = 115; _34[16] = 116; _34[17] = 32; _34[18] = 99; _34[19] = 97; _34[20] = 115; _34[21] = 101; _34[22] = 32; 
	//indirectinvoke () = %33 (%34) : method(int[])->()
	{
		println_s(_34, _34_size);
	}
//.blklab4
blklab4:;
	//return
	exit(0);
}

