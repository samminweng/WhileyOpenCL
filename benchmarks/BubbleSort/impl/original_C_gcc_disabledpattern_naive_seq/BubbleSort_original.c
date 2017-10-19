#include "BubbleSort_original.h"
int64_t* _bubbleSort_(_DECL_1DARRAY_PARAM(items), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	int64_t length;
	int64_t last_swapped;
	int64_t index;
	int64_t tmp;
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
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	//lengthof %6 = %0 : int[]
	_6 = items_size;
	//assign %2 = %6  : int
	length = _6;
	//const %7 = 0 : int
	_7 = 0;
	//assign %3 = %7  : int
	last_swapped = _7;
	//loop (%0, %2, %3, %4, %5, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
	while(true){
		//const %8 = 0 : int
		_8 = 0;
		//ifle %2, %8 goto blklab0 : int
		if(length<=_8){goto blklab0;}
		//const %9 = 0 : int
		_9 = 0;
		//assign %3 = %9  : int
		last_swapped = _9;
		//const %10 = 1 : int
		_10 = 1;
		//assign %4 = %10  : int
		index = _10;
		//loop (%0, %3, %4, %5, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
		while(true){
			//ifge %4, %2 goto blklab2 : int
			if(index>=length){goto blklab2;}
			//const %11 = 1 : int
			_11 = 1;
			//sub %12 = %4, %11 : int
			_12=index-_11;
			//indexof %13 = %0, %12 : int[]
			_13=items[_12];
			//indexof %14 = %0, %4 : int[]
			_14=items[index];
			//ifle %13, %14 goto blklab4 : int
			if(_13<=_14){goto blklab4;}
			//const %15 = 1 : int
			_15 = 1;
			//sub %16 = %4, %15 : int
			_16=index-_15;
			//indexof %17 = %0, %16 : int[]
			_17=items[_16];
			//assign %5 = %17  : int
			tmp = _17;
			//indexof %18 = %0, %4 : int[]
			_18=items[index];
			//const %19 = 1 : int
			_19 = 1;
			//sub %20 = %4, %19 : int
			_20=index-_19;
			//update %0[%20] = %18 : int[] -> int[]
			items[_20] = _18;
			//update %0[%4] = %5 : int[] -> int[]
			items[index] = tmp;
			//assign %3 = %4  : int
			last_swapped = index;
//.blklab4
blklab4:;
			//const %21 = 1 : int
			_21 = 1;
			//add %22 = %4, %21 : int
			_22=index+_21;
			//assign %4 = %22  : int
			index = _22;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//assign %2 = %3  : int
		length = last_swapped;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
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
	//ifis %1, null goto blklab5 : null|int
	if(n == NULL) { goto blklab5;}
	//assign %2 = %1  : int
	max = *n;
	//const %11 = 10000 : int
	_11 = 10000;
	//assign %3 = %11  : int
	size = _11;
	//const %12 = 0 : int
	_12 = 0;
	//assign %4 = %12  : int
	repeats = _12;
	//loop (%4, %5, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26)
	while(true){
		//ifge %4, %2 goto blklab6 : int
		if(repeats>=max){goto blklab6;}
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
			//ifge %5, %3 goto blklab8 : int
			if(index>=size){goto blklab8;}
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
//.blklab9
blklab9:;
		}
//.blklab8
blklab8:;
		//invoke (%19) = (%6) BubbleSort_original:bubbleSort : function(int[])->(int[])
		{
			void* tmp_arr_0;
			_COPY_1DARRAY_PARAM(arr, tmp_arr_0, int64_t);
			_19 = _bubbleSort_(tmp_arr_0, arr_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
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
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %29 = [78,117,109,98,101,114,32,111,102,32,114,101,112,101,97,116,115,32] : int[]
	_NEW_1DARRAY_int64_t(_29, 18, 0);
	_29[0] = 78; _29[1] = 117; _29[2] = 109; _29[3] = 98; _29[4] = 101; _29[5] = 114; _29[6] = 32; _29[7] = 111; _29[8] = 102; _29[9] = 32; _29[10] = 114; _29[11] = 101; _29[12] = 112; _29[13] = 101; _29[14] = 97; _29[15] = 116; _29[16] = 115; _29[17] = 32; 
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
	//const %34 = [80,97,115,115,32,66,117,98,98,108,101,83,111,114,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_34, 25, 0);
	_34[0] = 80; _34[1] = 97; _34[2] = 115; _34[3] = 115; _34[4] = 32; _34[5] = 66; _34[6] = 117; _34[7] = 98; _34[8] = 98; _34[9] = 108; _34[10] = 101; _34[11] = 83; _34[12] = 111; _34[13] = 114; _34[14] = 116; _34[15] = 32; _34[16] = 116; _34[17] = 101; _34[18] = 115; _34[19] = 116; _34[20] = 32; _34[21] = 99; _34[22] = 97; _34[23] = 115; _34[24] = 101; 
	//indirectinvoke () = %33 (%34) : method(int[])->()
	{
		println_s(_34, _34_size);
	}
//.blklab5
blklab5:;
	//return
	exit(0);
}

