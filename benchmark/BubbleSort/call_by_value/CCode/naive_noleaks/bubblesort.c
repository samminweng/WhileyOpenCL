#include "bubblesort.h"
long long* bubbleSort(long long* _items, long long _items_size){
	long long _length = 0;
	long long _last_swapped = 0;
	long long _index = 0;
	long long _tmp = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	//lengthof %6 = %0 : int[]
	_6 = _items_size;
	//assign %5 = %6  : int
	_5 = _6;
	//assign %1 = %5  : int
	_length = _5;
	//const %8 = 0 : int
	_8 = 0;
	//assign %7 = %8  : int
	_7 = _8;
	//assign %2 = %7  : int
	_last_swapped = _7;
	//const %9 = 0 : int
	_9 = 0;
	//ifle %1, %9 goto blklab0 : int
	while(_length>_9){
		//const %10 = 0 : int
		_10 = 0;
		//assign %2 = %10  : int
		_last_swapped = _10;
		//const %12 = 1 : int
		_12 = 1;
		//assign %11 = %12  : int
		_11 = _12;
		//assign %3 = %11  : int
		_index = _11;
		//ifge %3, %1 goto blklab1 : int
		while(_index<_length){
			//const %13 = 1 : int
			_13 = 1;
			//sub %14 = %3, %13 : int
			_14=_index-_13;
			//indexof %15 = %0, %14 : int[]
			_15=_items[_14];
			//indexof %16 = %0, %3 : int[]
			_16=_items[_index];
			//ifle %15, %16 goto blklab2 : int
			if(_15<=_16){goto blklab2;}
			//const %18 = 1 : int
			_18 = 1;
			//sub %19 = %3, %18 : int
			_19=_index-_18;
			//indexof %20 = %0, %19 : int[]
			_20=_items[_19];
			//assign %17 = %20  : int
			_17 = _20;
			//assign %4 = %17  : int
			_tmp = _17;
			//indexof %21 = %0, %3 : int[]
			_21=_items[_index];
			//const %22 = 1 : int
			_22 = 1;
			//sub %23 = %3, %22 : int
			_23=_index-_22;
			//indexof %24 = %0, %3 : int[]
			_24=_items[_index];
			//update %0[%23] = %24 : int[] -> int[]
			_items[_23] = _24;
			//update %0[%3] = %4 : int[] -> int[]
			_items[_index] = _tmp;
			//assign %2 = %3  : int
			_last_swapped = _index;
//.blklab2
blklab2:;
			//const %25 = 1 : int
			_25 = 1;
			//add %26 = %3, %25 : int
			_26=_index+_25;
			//assign %3 = %26  : int
			_index = _26;
		}
//.blklab1
blklab1:;
		//assign %1 = %2  : int
		_length = _last_swapped;
	}
//.blklab0
blklab0:;
	//return %0 : int[]
	return _items;
	//return
	
}
int main(int argc, char** args){
	long long _max;
	long long _index = 0;
	long long* _arr = NULL;
	long long _arr_size = 0;
	long long _4;
	long long _5;
	long long** _6 = NULL;
	long long _6_size = 0;
	long long _7 = 0;
	long long* _8 = NULL;
	long long _8_size = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long* _11 = NULL;
	long long _11_size = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long* _20 = NULL;
	long long _20_size = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _27 = 0;
	//fieldload %6 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_6 = convertArgsToIntArray(argc, args);
	_6_size = argc -1;
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	//invoke %5 = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_5 = parseInteger(_8);
	//assign %4 = %5  : null|int
	_4 = _5;
	//assign %1 = %4  : null|int
	_max = _4;
	//ifis %1, null goto blklab3 : null|int
	if(_max == NULL) { goto blklab3;}
	//const %10 = 0 : int
	_10 = 0;
	//assign %9 = %10  : int
	_9 = _10;
	//assign %2 = %9  : int
	_index = _9;
	//const %12 = 0 : int
	_12 = 0;
	//const %13 = 1 : int
	_13 = 1;
	//add %14 = %1, %13 : int
	_14=_max+_13;
	//listgen %15 = [12; 14] : int[]
	_15 = genArray(_12, _14);
	_15_size = _14;
	//assign %11 = %15  : int[]
	_11_size = _15_size;
	_11 = clone(_15, _15_size);
	//assign %3 = %11  : int[]
	_arr_size = _11_size;
	_arr = clone(_11, _11_size);
	//ifgt %2, %1 goto blklab4 : int
	while(_index<=_max){
		//sub %16 = %1, %2 : int
		_16=_max-_index;
		//sub %17 = %1, %2 : int
		_17=_max-_index;
		//update %3[%2] = %17 : int[] -> int[]
		_arr[_index] = _17;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %2, %18 : int
		_19=_index+_18;
		//assign %2 = %19  : int
		_index = _19;
	}
//.blklab4
blklab4:;
	//invoke %20 = (%3) bubblesort:bubbleSort : function(int[]) -> int[]
	_20_size=_arr_size;
	_20 = bubbleSort(clone(_arr, _arr_size), _arr_size);
	//assign %3 = %20  : int[]
	free(_arr);
	_arr_size = _20_size;
	_arr = clone(_20, _20_size);
	//assert
	{
		//const %21 = 0 : int
		_21 = 0;
		//indexof %22 = %3, %21 : int[]
		_22=_arr[_21];
		//const %23 = 0 : int
		_23 = 0;
		//ifeq %22, %23 goto blklab5 : int
		if(_22==_23){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//assert
	{
		//indexof %24 = %3, %1 : int[]
		_24=_arr[_max];
		//ifeq %24, %1 goto blklab6 : int
		if(_24==_max){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %26 = %25 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//indexof %27 = %3, %1 : int[]
	_27=_arr[_max];
	//indirectinvoke %26 (%27) : method(any) -> void
	printf("%d\n", _27);
//.blklab3
blklab3:;
	freeDoublePointer(_6, _6_size);
	free(_15);
	free(_11);
	free(_20);
	free(_arr);
	//return
	exit(0);
}
