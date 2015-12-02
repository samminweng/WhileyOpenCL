#include "reverse_call_by_value.h"
long long* reverse(long long* _ls, long long _ls_size){
	long long _i = 0;
	long long* _r = NULL;
	long long _r_size = 0;
	long long _item = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long* _6 = NULL;
	long long _6_size = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long* _9 = NULL;
	long long _9_size = 0;
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
	//lengthof %5 = %0 : int[]
	_5 = _ls_size;
	//assign %4 = %5  : int
	_4 = _5;
	//assign %1 = %4  : int
	_i = _4;
	//const %7 = 0 : int
	_7 = 0;
	//lengthof %8 = %0 : int[]
	_8 = _ls_size;
	//listgen %9 = [7; 8] : int[]
	_9 = genArray(_7, _8);
	_9_size = _8;
	//assign %6 = %9  : int[]
	_6_size = _9_size;
	_6 = _9;
	//assign %2 = %6  : int[]
	_r_size = _6_size;
	_r = _6;
	//const %13 = 0 : int
	_13 = 0;
	//ifle %1, %13 goto blklab0 : int
	while(_i>_13){
	//invariant
	{
		//lengthof %10 = %0 : int[]
		_10 = _ls_size;
		//ifgt %1, %10 goto blklab2 : int
		if(_i>_10){goto blklab2;}
		//lengthof %11 = %2 : int[]
		_11 = _r_size;
		//lengthof %12 = %0 : int[]
		_12 = _ls_size;
		//ifeq %11, %12 goto blklab1 : int
		if(_11==_12){goto blklab1;}
//.blklab2
blklab2:;
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
		//return
		
	//invariant
	}
		//lengthof %15 = %0 : int[]
		_15 = _ls_size;
		//sub %16 = %15, %1 : int
		_16=_15-_i;
		//indexof %17 = %0, %16 : int[]
		_17=_ls[_16];
		//assign %14 = %17  : int
		_14 = _17;
		//assign %3 = %14  : int
		_item = _14;
		//const %18 = 1 : int
		_18 = 1;
		//sub %19 = %1, %18 : int
		_19=_i-_18;
		//assign %1 = %19  : int
		_i = _19;
		//update %2[%1] = %3 : int[] -> int[]
		_r[_i] = _item;
	}
//.blklab0
blklab0:;
	//return %2 : int[]
	return _r;
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
	_6_size = argc - 1;
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
	_11 = _15;
	//assign %3 = %11  : int[]
	_arr_size = _11_size;
	_arr = _11;
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
	//invoke %20 = (%3) reverse_call_by_value:reverse : function(int[]) -> int[]
	_20_size=_arr_size;
	_20 = reverse(_arr, _arr_size);
	//assign %3 = %20  : int[]
	_arr_size = _20_size;
	_arr = _20;
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
	//return
	exit(0);
}
