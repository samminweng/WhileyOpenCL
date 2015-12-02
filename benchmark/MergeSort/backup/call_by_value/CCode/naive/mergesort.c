#include "mergesort.h"
long long* sortV1(long long* _items, long long _items_size, long long _start, long long _end){
	long long _pivot = 0;
	long long* _lhs = NULL;
	long long _lhs_size = 0;
	long long* _rhs = NULL;
	long long _rhs_size = 0;
	long long _l = 0;
	long long _r = 0;
	long long _i = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	long long* _16 = NULL;
	long long _16_size = 0;
	long long* _17 = NULL;
	long long _17_size = 0;
	long long _18 = 0;
	long long* _19 = NULL;
	long long _19_size = 0;
	long long* _20 = NULL;
	long long _20_size = 0;
	long long* _21 = NULL;
	long long _21_size = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long _38 = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	long long _51 = 0;
	long long _52 = 0;
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	//const %9 = 1 : int
	_9 = 1;
	//add %10 = %1, %9 : int
	_10=_start+_9;
	//ifge %10, %2 goto blklab0 : int
	if(_10>=_end){goto blklab0;}
	//add %12 = %1, %2 : int
	_12=_start+_end;
	//const %13 = 2 : int
	_13 = 2;
	//div %14 = %12, %13 : int
	_14=_12/_13;
	//assign %11 = %14  : int
	_11 = _14;
	//assign %3 = %11  : int
	_pivot = _11;
	//invoke %16 = (%0, %1, %3) whiley/lang/Array:slice : function(int[],int,int) -> int[]
	_16 = slice(_items, _items_size, _start,_pivot);
	_16_size = _pivot - _start;
	//assign %15 = %16  : int[]
	_15_size = _16_size;
	_15 = clone(_16, _16_size);
	//assign %4 = %15  : int[]
	_lhs_size = _15_size;
	_lhs = clone(_15, _15_size);
	//const %18 = 0 : int
	_18 = 0;
	//invoke %17 = (%4, %18, %3) sort_call_by_value:sortV1 : function(int[],int,int) -> int[]
	_17_size=_lhs_size;
	_17 = sortV1(clone(_lhs, _lhs_size), _lhs_size ,_18 ,_pivot);
	//assign %4 = %17  : int[]
	_lhs_size = _17_size;
	_lhs = clone(_17, _17_size);
	//invoke %20 = (%0, %3, %2) whiley/lang/Array:slice : function(int[],int,int) -> int[]
	_20 = slice(_items, _items_size, _pivot,_end);
	_20_size = _end - _pivot;
	//assign %19 = %20  : int[]
	_19_size = _20_size;
	_19 = clone(_20, _20_size);
	//assign %5 = %19  : int[]
	_rhs_size = _19_size;
	_rhs = clone(_19, _19_size);
	//const %22 = 0 : int
	_22 = 0;
	//sub %23 = %2, %3 : int
	_23=_end-_pivot;
	//invoke %21 = (%5, %22, %23) sort_call_by_value:sortV1 : function(int[],int,int) -> int[]
	_21_size=_rhs_size;
	_21 = sortV1(clone(_rhs, _rhs_size), _rhs_size ,_22 ,_23);
	//assign %5 = %21  : int[]
	_rhs_size = _21_size;
	_rhs = clone(_21, _21_size);
	//const %25 = 0 : int
	_25 = 0;
	//assign %24 = %25  : int
	_24 = _25;
	//assign %6 = %24  : int
	_l = _24;
	//const %27 = 0 : int
	_27 = 0;
	//assign %26 = %27  : int
	_26 = _27;
	//assign %7 = %26  : int
	_r = _26;
	//const %29 = 0 : int
	_29 = 0;
	//assign %28 = %29  : int
	_28 = _29;
	//assign %8 = %28  : int
	_i = _28;
	//sub %30 = %2, %1 : int
	_30=_end-_start;
	//ifge %8, %30 goto blklab1 : int
	while(_i<_30){
		//sub %31 = %3, %1 : int
		_31=_pivot-_start;
		//ifge %6, %31 goto blklab1 : int
		if(_l>=_31){goto blklab1;}
		//sub %32 = %2, %3 : int
		_32=_end-_pivot;
		//ifge %7, %32 goto blklab1 : int
		if(_r>=_32){goto blklab1;}
		//indexof %33 = %4, %6 : int[]
		_33=_lhs[_l];
		//indexof %34 = %5, %7 : int[]
		_34=_rhs[_r];
		//ifgt %33, %34 goto blklab2 : int
		if(_33>_34){goto blklab2;}
		//indexof %35 = %4, %6 : int[]
		_35=_lhs[_l];
		//indexof %36 = %4, %6 : int[]
		_36=_lhs[_l];
		//update %0[%8] = %36 : int[] -> int[]
		_items[_i] = _36;
		//const %37 = 1 : int
		_37 = 1;
		//add %38 = %6, %37 : int
		_38=_l+_37;
		//assign %6 = %38  : int
		_l = _38;
		//goto blklab3
		goto blklab3;
//.blklab2
blklab2:;
		//indexof %39 = %5, %7 : int[]
		_39=_rhs[_r];
		//indexof %40 = %5, %7 : int[]
		_40=_rhs[_r];
		//update %0[%8] = %40 : int[] -> int[]
		_items[_i] = _40;
		//const %41 = 1 : int
		_41 = 1;
		//add %42 = %7, %41 : int
		_42=_r+_41;
		//assign %7 = %42  : int
		_r = _42;
//.blklab3
blklab3:;
		//const %43 = 1 : int
		_43 = 1;
		//add %44 = %8, %43 : int
		_44=_i+_43;
		//assign %8 = %44  : int
		_i = _44;
	}
//.blklab1
blklab1:;
	//sub %45 = %3, %1 : int
	_45=_pivot-_start;
	//ifge %6, %45 goto blklab4 : int
	while(_l<_45){
		//indexof %46 = %4, %6 : int[]
		_46=_lhs[_l];
		//indexof %47 = %4, %6 : int[]
		_47=_lhs[_l];
		//update %0[%8] = %47 : int[] -> int[]
		_items[_i] = _47;
		//const %48 = 1 : int
		_48 = 1;
		//add %49 = %8, %48 : int
		_49=_i+_48;
		//assign %8 = %49  : int
		_i = _49;
		//const %50 = 1 : int
		_50 = 1;
		//add %51 = %6, %50 : int
		_51=_l+_50;
		//assign %6 = %51  : int
		_l = _51;
	}
//.blklab4
blklab4:;
	//sub %52 = %2, %3 : int
	_52=_end-_pivot;
	//ifge %7, %52 goto blklab5 : int
	while(_r<_52){
		//indexof %53 = %5, %7 : int[]
		_53=_rhs[_r];
		//indexof %54 = %5, %7 : int[]
		_54=_rhs[_r];
		//update %0[%8] = %54 : int[] -> int[]
		_items[_i] = _54;
		//const %55 = 1 : int
		_55 = 1;
		//add %56 = %8, %55 : int
		_56=_i+_55;
		//assign %8 = %56  : int
		_i = _56;
		//const %57 = 1 : int
		_57 = 1;
		//add %58 = %7, %57 : int
		_58=_r+_57;
		//assign %7 = %58  : int
		_r = _58;
	}
//.blklab5
blklab5:;
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
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _30 = 0;
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
	//ifis %1, null goto blklab6 : null|int
	if(_max == NULL) { goto blklab6;}
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
	//ifgt %2, %1 goto blklab7 : int
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
//.blklab7
blklab7:;
	//const %21 = 0 : int
	_21 = 0;
	//const %22 = 1 : int
	_22 = 1;
	//add %23 = %1, %22 : int
	_23=_max+_22;
	//invoke %20 = (%3, %21, %23) sort_call_by_value:sortV1 : function(int[],int,int) -> int[]
	_20_size=_arr_size;
	_20 = sortV1(clone(_arr, _arr_size), _arr_size ,_21 ,_23);
	//assign %3 = %20  : int[]
	_arr_size = _20_size;
	_arr = clone(_20, _20_size);
	//assert
	{
		//const %24 = 0 : int
		_24 = 0;
		//indexof %25 = %3, %24 : int[]
		_25=_arr[_24];
		//const %26 = 0 : int
		_26 = 0;
		//ifeq %25, %26 goto blklab8 : int
		if(_25==_26){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//assert
	{
		//indexof %27 = %3, %1 : int[]
		_27=_arr[_max];
		//ifeq %27, %1 goto blklab9 : int
		if(_27==_max){goto blklab9;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab9
blklab9:;
	//assert
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %29 = %28 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//indexof %30 = %3, %1 : int[]
	_30=_arr[_max];
	//indirectinvoke %29 (%30) : method(any) -> void
	printf("%d\n", _30);
//.blklab6
blklab6:;
	//return
	exit(0);
}
