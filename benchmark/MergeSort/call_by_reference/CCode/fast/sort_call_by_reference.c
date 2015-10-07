#include "sort_call_by_reference.h"
void sortV2(long long** _items, long long _items_size, long long _start, long long _end){
	long long _pivot = 0;
	long long** _lhs = NULL;
	long long _lhs_size = 0;
	long long** _rhs = NULL;
	long long _rhs_size = 0;
	long long _i = 0;
	long long _l = 0;
	long long _r = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long** _15 = NULL;
	long long _15_size = 0;
	long long* _16 = NULL;
	long long _16_size = 0;
	long long* _17 = NULL;
	long long _17_size = 0;
	long long** _18 = NULL;
	long long _18_size = 0;
	long long _19 = 0;
	long long** _20 = NULL;
	long long _20_size = 0;
	long long* _21 = NULL;
	long long _21_size = 0;
	long long* _22 = NULL;
	long long _22_size = 0;
	long long** _23 = NULL;
	long long _23_size = 0;
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
	long long* _35 = NULL;
	long long _35_size = 0;
	long long _36 = 0;
	long long* _37 = NULL;
	long long _37_size = 0;
	long long _38 = 0;
	long long* _39 = NULL;
	long long _39_size = 0;
	long long _40 = 0;
	long long* _41 = NULL;
	long long _41_size = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long* _45 = NULL;
	long long _45_size = 0;
	long long _46 = 0;
	long long* _47 = NULL;
	long long _47_size = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	long long _51 = 0;
	long long _52 = 0;
	long long _53 = 0;
	long long* _54 = NULL;
	long long _54_size = 0;
	long long _55 = 0;
	long long* _56 = NULL;
	long long _56_size = 0;
	long long _57 = 0;
	long long _58 = 0;
	long long _59 = 0;
	long long _60 = 0;
	long long _61 = 0;
	long long _62 = 0;
	long long* _63 = NULL;
	long long _63_size = 0;
	long long _64 = 0;
	long long* _65 = NULL;
	long long _65_size = 0;
	long long _66 = 0;
	long long _67 = 0;
	long long _68 = 0;
	long long _69 = 0;
	long long _70 = 0;
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
	//deref %17 = %0 : &int[]
	_17 = *(_items);
	_17_size = _items_size;
	//invoke %16 = (%17, %1, %3) whiley/lang/Array:slice : function(int[],int,int) -> int[]
	_16 = slice(_17, _17_size, _start,_pivot);
	_16_size = _pivot - _start;
	//newobject %18 = %16 : &int[]
	long long* _16_value = _16;
	_18 = (long long**)&(_16_value);
	_18_size = _16_size;
	//assign %15 = %18  : &int[]
	_15 = _18;
	_15_size = _18_size;
	//assign %4 = %15  : &int[]
	_lhs = _15;
	_lhs_size = _15_size;
	//const %19 = 0 : int
	_19 = 0;
	//invoke %(%4, %19, %3) sort_call_by_reference:sortV2 : method(&int[],int,int) -> void
	sortV2(_lhs, _lhs_size ,_19 ,_pivot);
	//deref %22 = %0 : &int[]
	_22 = *(_items);
	_22_size = _items_size;
	//invoke %21 = (%22, %3, %2) whiley/lang/Array:slice : function(int[],int,int) -> int[]
	_21 = slice(_22, _22_size, _pivot,_end);
	_21_size = _end - _pivot;
	//newobject %23 = %21 : &int[]
	long long* _21_value = _21;
	_23 = (long long**)&(_21_value);
	_23_size = _21_size;
	//assign %20 = %23  : &int[]
	_20 = _23;
	_20_size = _23_size;
	//assign %5 = %20  : &int[]
	_rhs = _20;
	_rhs_size = _20_size;
	//const %24 = 0 : int
	_24 = 0;
	//sub %25 = %2, %3 : int
	_25=_end-_pivot;
	//invoke %(%5, %24, %25) sort_call_by_reference:sortV2 : method(&int[],int,int) -> void
	sortV2(_rhs, _rhs_size ,_24 ,_25);
	//const %27 = 0 : int
	_27 = 0;
	//assign %26 = %27  : int
	_26 = _27;
	//assign %6 = %26  : int
	_i = _26;
	//const %29 = 0 : int
	_29 = 0;
	//assign %28 = %29  : int
	_28 = _29;
	//assign %7 = %28  : int
	_l = _28;
	//const %31 = 0 : int
	_31 = 0;
	//assign %30 = %31  : int
	_30 = _31;
	//assign %8 = %30  : int
	_r = _30;
	//sub %32 = %2, %1 : int
	_32=_end-_start;
	//ifge %6, %32 goto blklab1 : int
	while(_i<_32){
		//sub %33 = %3, %1 : int
		_33=_pivot-_start;
		//ifge %7, %33 goto blklab1 : int
		if(_l>=_33){goto blklab1;}
		//sub %34 = %2, %3 : int
		_34=_end-_pivot;
		//ifge %8, %34 goto blklab1 : int
		if(_r>=_34){goto blklab1;}
		//deref %35 = %4 : &int[]
		_35 = *(_lhs);
		_35_size = _lhs_size;
		//indexof %36 = %35, %7 : int[]
		_36=_35[_l];
		//deref %37 = %5 : &int[]
		_37 = *(_rhs);
		_37_size = _rhs_size;
		//indexof %38 = %37, %8 : int[]
		_38=_37[_r];
		//ifgt %36, %38 goto blklab2 : int
		if(_36>_38){goto blklab2;}
		//deref %39 = %4 : &int[]
		_39 = *(_lhs);
		_39_size = _lhs_size;
		//indexof %40 = %39, %7 : int[]
		_40=_39[_l];
		//deref %41 = %4 : &int[]
		_41 = *(_lhs);
		_41_size = _lhs_size;
		//indexof %42 = %41, %7 : int[]
		_42=_41[_l];
		//update (*%0)[%6] = %42 : &int[] -> &int[]
		(*_items)[_i] = _42;
		//const %43 = 1 : int
		_43 = 1;
		//add %44 = %7, %43 : int
		_44=_l+_43;
		//assign %7 = %44  : int
		_l = _44;
		//goto blklab3
		goto blklab3;
//.blklab2
blklab2:;
		//deref %45 = %5 : &int[]
		_45 = *(_rhs);
		_45_size = _rhs_size;
		//indexof %46 = %45, %8 : int[]
		_46=_45[_r];
		//deref %47 = %5 : &int[]
		_47 = *(_rhs);
		_47_size = _rhs_size;
		//indexof %48 = %47, %8 : int[]
		_48=_47[_r];
		//update (*%0)[%6] = %48 : &int[] -> &int[]
		(*_items)[_i] = _48;
		//const %49 = 1 : int
		_49 = 1;
		//add %50 = %8, %49 : int
		_50=_r+_49;
		//assign %8 = %50  : int
		_r = _50;
//.blklab3
blklab3:;
		//const %51 = 1 : int
		_51 = 1;
		//add %52 = %6, %51 : int
		_52=_i+_51;
		//assign %6 = %52  : int
		_i = _52;
	}
//.blklab1
blklab1:;
	//sub %53 = %3, %1 : int
	_53=_pivot-_start;
	//ifge %7, %53 goto blklab4 : int
	while(_l<_53){
		//deref %54 = %4 : &int[]
		_54 = *(_lhs);
		_54_size = _lhs_size;
		//indexof %55 = %54, %7 : int[]
		_55=_54[_l];
		//deref %56 = %4 : &int[]
		_56 = *(_lhs);
		_56_size = _lhs_size;
		//indexof %57 = %56, %7 : int[]
		_57=_56[_l];
		//update (*%0)[%6] = %57 : &int[] -> &int[]
		(*_items)[_i] = _57;
		//const %58 = 1 : int
		_58 = 1;
		//add %59 = %6, %58 : int
		_59=_i+_58;
		//assign %6 = %59  : int
		_i = _59;
		//const %60 = 1 : int
		_60 = 1;
		//add %61 = %7, %60 : int
		_61=_l+_60;
		//assign %7 = %61  : int
		_l = _61;
	}
//.blklab4
blklab4:;
	//sub %62 = %2, %3 : int
	_62=_end-_pivot;
	//ifge %8, %62 goto blklab5 : int
	while(_r<_62){
		//deref %63 = %5 : &int[]
		_63 = *(_rhs);
		_63_size = _rhs_size;
		//indexof %64 = %63, %8 : int[]
		_64=_63[_r];
		//deref %65 = %5 : &int[]
		_65 = *(_rhs);
		_65_size = _rhs_size;
		//indexof %66 = %65, %8 : int[]
		_66=_65[_r];
		//update (*%0)[%6] = %66 : &int[] -> &int[]
		(*_items)[_i] = _66;
		//const %67 = 1 : int
		_67 = 1;
		//add %68 = %6, %67 : int
		_68=_i+_67;
		//assign %6 = %68  : int
		_i = _68;
		//const %69 = 1 : int
		_69 = 1;
		//add %70 = %8, %69 : int
		_70=_r+_69;
		//assign %8 = %70  : int
		_r = _70;
	}
//.blklab5
blklab5:;
//.blklab0
blklab0:;
	free(_16);
	free(_21);
	//return
}
int main(int argc, char** args){
	long long _max;
	long long _index = 0;
	long long* _arr = NULL;
	long long _arr_size = 0;
	long long** _ys = NULL;
	long long _ys_size = 0;
	long long _5;
	long long _6;
	long long** _7 = NULL;
	long long _7_size = 0;
	long long _8 = 0;
	long long* _9 = NULL;
	long long _9_size = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long* _12 = NULL;
	long long _12_size = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long* _16 = NULL;
	long long _16_size = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long** _21 = NULL;
	long long _21_size = 0;
	long long** _22 = NULL;
	long long _22_size = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long* _26 = NULL;
	long long _26_size = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long* _30 = NULL;
	long long _30_size = 0;
	long long _31 = 0;
	long long* _34 = NULL;
	long long _34_size = 0;
	long long _35 = 0;
	//fieldload %7 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_7 = convertArgsToIntArray(argc, args, _7_size);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	//invoke %6 = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_6 = parseInteger(_9);
	//assign %5 = %6  : null|int
	_5 = _6;
	//assign %1 = %5  : null|int
	_max = _5;
	//ifis %1, null goto blklab6 : null|int
	if(_max == NULL) { goto blklab6;}
	//const %11 = 0 : int
	_11 = 0;
	//assign %10 = %11  : int
	_10 = _11;
	//assign %2 = %10  : int
	_index = _10;
	//const %13 = 0 : int
	_13 = 0;
	//const %14 = 1 : int
	_14 = 1;
	//add %15 = %1, %14 : int
	_15=_max+_14;
	//listgen %16 = [13; 15] : int[]
	_16 = genArray(_13, _15);
	_16_size = _15;
	//assign %12 = %16  : int[]
	_12_size = _16_size;
	_12 = (long long*)_16;
	//assign %3 = %12  : int[]
	_arr_size = _12_size;
	_arr = (long long*)_12;
	//ifgt %2, %1 goto blklab7 : int
	while(_index<=_max){
		//sub %17 = %1, %2 : int
		_17=_max-_index;
		//sub %18 = %1, %2 : int
		_18=_max-_index;
		//update %3[%2] = %18 : int[] -> int[]
		_arr[_index] = _18;
		//const %19 = 1 : int
		_19 = 1;
		//add %20 = %2, %19 : int
		_20=_index+_19;
		//assign %2 = %20  : int
		_index = _20;
	}
//.blklab7
blklab7:;
	//newobject %22 = %3 : &int[]
	long long* _arr_value = _arr;
	_22 = (long long**)&(_arr_value);
	_22_size = _arr_size;
	//assign %21 = %22  : &int[]
	_21 = _22;
	_21_size = _22_size;
	//assign %4 = %21  : &int[]
	_ys = _21;
	_ys_size = _21_size;
	//const %23 = 0 : int
	_23 = 0;
	//const %24 = 1 : int
	_24 = 1;
	//add %25 = %1, %24 : int
	_25=_max+_24;
	//invoke %(%4, %23, %25) sort_call_by_reference:sortV2 : method(&int[],int,int) -> void
	sortV2(_ys, _ys_size ,_23 ,_25);
	//assert
	{
		//deref %26 = %4 : &int[]
		_26 = *(_ys);
		_26_size = _ys_size;
		//const %27 = 0 : int
		_27 = 0;
		//indexof %28 = %26, %27 : int[]
		_28=_26[_27];
		//const %29 = 0 : int
		_29 = 0;
		//ifeq %28, %29 goto blklab8 : int
		if(_28==_29){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//assert
	{
		//deref %30 = %4 : &int[]
		_30 = *(_ys);
		_30_size = _ys_size;
		//indexof %31 = %30, %1 : int[]
		_31=_30[_max];
		//ifeq %31, %1 goto blklab9 : int
		if(_31==_max){goto blklab9;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab9
blklab9:;
	//assert
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %33 = %32 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//deref %34 = %4 : &int[]
	_34 = *(_ys);
	_34_size = _ys_size;
	//indexof %35 = %34, %1 : int[]
	_35=_34[_max];
	//indirectinvoke %33 (%35) : method(any) -> void
	printf("%d\n", _35);
//.blklab6
blklab6:;
	//return
	exit(0);
}
