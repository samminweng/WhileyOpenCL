#include "sort.h"
void sort(long long** _items, long long _items_size, long long _start, long long _end){
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
	long long _17 = 0;
	long long* _18 = NULL;
	long long _18_size = 0;
	long long** _19 = NULL;
	long long _19_size = 0;
	long long _20 = 0;
	long long* _21 = NULL;
	long long _21_size = 0;
	long long _22 = 0;
	long long** _23 = NULL;
	long long _23_size = 0;
	long long* _24 = NULL;
	long long _24_size = 0;
	long long* _25 = NULL;
	long long _25_size = 0;
	long long _26 = 0;
	long long* _27 = NULL;
	long long _27_size = 0;
	long long** _28 = NULL;
	long long _28_size = 0;
	long long _29 = 0;
	long long* _30 = NULL;
	long long _30_size = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long* _38 = NULL;
	long long _38_size = 0;
	long long _39 = 0;
	long long* _40 = NULL;
	long long _40_size = 0;
	long long _41 = 0;
	long long* _42 = NULL;
	long long _42_size = 0;
	long long _43 = 0;
	long long* _44 = NULL;
	long long _44_size = 0;
	long long _45 = 0;
	long long* _46 = NULL;
	long long _46_size = 0;
	long long _47 = 0;
	long long* _48 = NULL;
	long long _48_size = 0;
	long long _49 = 0;
	long long* _50 = NULL;
	long long _50_size = 0;
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
	long long* _62 = NULL;
	long long _62_size = 0;
	long long _63 = 0;
	long long* _64 = NULL;
	long long _64_size = 0;
	long long _65 = 0;
	long long* _66 = NULL;
	long long _66_size = 0;
	long long _67 = 0;
	long long _68 = 0;
	long long _69 = 0;
	long long _70 = 0;
	long long _71 = 0;
	long long* _72 = NULL;
	long long _72_size = 0;
	long long _73 = 0;
	long long* _74 = NULL;
	long long _74_size = 0;
	long long _75 = 0;
	long long* _76 = NULL;
	long long _76_size = 0;
	long long _77 = 0;
	long long _78 = 0;
	long long _79 = 0;
	long long _80 = 0;
	long long _81 = 0;
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
	//deref %16 = %0 : &[int]
	_16 = *(_items);
	_16_size = _items_size;
	//const %17 = 0 : int
	_17 = 0;
	//sublist %18 = %16, %17, %3 : [int]
	_18_size = _pivot - _17;
	_18 = sublist(_16, _17, _pivot);
	//newobject %19 = %18 : &[int]
	long long* _18_value = clone(_18, _18_size);
	_19 = (long long**)&(_18_value);
	_19_size = _18_size;
	//assign %15 = %19  : &[int]
	_15 = _19;
	_15_size = _19_size;
	//assign %4 = %15  : &[int]
	_lhs = _15;
	_lhs_size = _15_size;
	//const %20 = 0 : int
	_20 = 0;
	//deref %21 = %4 : &[int]
	_21 = *(_lhs);
	_21_size = _lhs_size;
	//lengthof %22 = %21 : [int]
	_22 = _21_size;
	//invoke %(%4, %20, %22) sort:sort : method(&[int],int,int) -> void
	sort(_lhs, _lhs_size ,_20 ,_22);
	//deref %24 = %0 : &[int]
	_24 = *(_items);
	_24_size = _items_size;
	//deref %25 = %0 : &[int]
	_25 = *(_items);
	_25_size = _items_size;
	//lengthof %26 = %25 : [int]
	_26 = _25_size;
	//sublist %27 = %24, %3, %26 : [int]
	_27_size = _26 - _pivot;
	_27 = sublist(_24, _pivot, _26);
	//newobject %28 = %27 : &[int]
	long long* _27_value = clone(_27, _27_size);
	_28 = (long long**)&(_27_value);
	_28_size = _27_size;
	//assign %23 = %28  : &[int]
	_23 = _28;
	_23_size = _28_size;
	//assign %5 = %23  : &[int]
	_rhs = _23;
	_rhs_size = _23_size;
	//const %29 = 0 : int
	_29 = 0;
	//deref %30 = %5 : &[int]
	_30 = *(_rhs);
	_30_size = _rhs_size;
	//lengthof %31 = %30 : [int]
	_31 = _30_size;
	//invoke %(%5, %29, %31) sort:sort : method(&[int],int,int) -> void
	sort(_rhs, _rhs_size ,_29 ,_31);
	//const %33 = 0 : int
	_33 = 0;
	//assign %32 = %33  : int
	_32 = _33;
	//assign %6 = %32  : int
	_i = _32;
	//const %35 = 0 : int
	_35 = 0;
	//assign %34 = %35  : int
	_34 = _35;
	//assign %7 = %34  : int
	_l = _34;
	//const %37 = 0 : int
	_37 = 0;
	//assign %36 = %37  : int
	_36 = _37;
	//assign %8 = %36  : int
	_r = _36;
	//deref %38 = %0 : &[int]
	_38 = *(_items);
	_38_size = _items_size;
	//lengthof %39 = %38 : [int]
	_39 = _38_size;
	//ifge %6, %39 goto blklab1 : int
	while(_i<_39){
		//deref %40 = %4 : &[int]
		_40 = *(_lhs);
		_40_size = _lhs_size;
		//lengthof %41 = %40 : [int]
		_41 = _40_size;
		//ifge %7, %41 goto blklab1 : int
		if(_l>=_41){goto blklab1;}
		//deref %42 = %5 : &[int]
		_42 = *(_rhs);
		_42_size = _rhs_size;
		//lengthof %43 = %42 : [int]
		_43 = _42_size;
		//ifge %8, %43 goto blklab1 : int
		if(_r>=_43){goto blklab1;}
		//deref %44 = %4 : &[int]
		_44 = *(_lhs);
		_44_size = _lhs_size;
		//indexof %45 = %44, %7 : [int]
		_45=_44[_l];
		//deref %46 = %5 : &[int]
		_46 = *(_rhs);
		_46_size = _rhs_size;
		//indexof %47 = %46, %8 : [int]
		_47=_46[_r];
		//ifgt %45, %47 goto blklab2 : int
		if(_45>_47){goto blklab2;}
		//deref %48 = %4 : &[int]
		_48 = *(_lhs);
		_48_size = _lhs_size;
		//indexof %49 = %48, %7 : [int]
		_49=_48[_l];
		//deref %50 = %4 : &[int]
		_50 = *(_lhs);
		_50_size = _lhs_size;
		//indexof %51 = %50, %7 : [int]
		_51=_50[_l];
		//update (*%0)[%6] = %51 : &[int] -> &[int]
		(*_items)[_i] = _51;
		//const %52 = 1 : int
		_52 = 1;
		//add %53 = %7, %52 : int
		_53=_l+_52;
		//assign %7 = %53  : int
		_l = _53;
		//goto blklab3
		goto blklab3;
//.blklab2
blklab2:;
		//deref %54 = %5 : &[int]
		_54 = *(_rhs);
		_54_size = _rhs_size;
		//indexof %55 = %54, %8 : [int]
		_55=_54[_r];
		//deref %56 = %5 : &[int]
		_56 = *(_rhs);
		_56_size = _rhs_size;
		//indexof %57 = %56, %8 : [int]
		_57=_56[_r];
		//update (*%0)[%6] = %57 : &[int] -> &[int]
		(*_items)[_i] = _57;
		//const %58 = 1 : int
		_58 = 1;
		//add %59 = %8, %58 : int
		_59=_r+_58;
		//assign %8 = %59  : int
		_r = _59;
//.blklab3
blklab3:;
		//const %60 = 1 : int
		_60 = 1;
		//add %61 = %6, %60 : int
		_61=_i+_60;
		//assign %6 = %61  : int
		_i = _61;
	}
//.blklab1
blklab1:;
	//deref %62 = %4 : &[int]
	_62 = *(_lhs);
	_62_size = _lhs_size;
	//lengthof %63 = %62 : [int]
	_63 = _62_size;
	//ifge %7, %63 goto blklab4 : int
	while(_l<_63){
		//deref %64 = %4 : &[int]
		_64 = *(_lhs);
		_64_size = _lhs_size;
		//indexof %65 = %64, %7 : [int]
		_65=_64[_l];
		//deref %66 = %4 : &[int]
		_66 = *(_lhs);
		_66_size = _lhs_size;
		//indexof %67 = %66, %7 : [int]
		_67=_66[_l];
		//update (*%0)[%6] = %67 : &[int] -> &[int]
		(*_items)[_i] = _67;
		//const %68 = 1 : int
		_68 = 1;
		//add %69 = %6, %68 : int
		_69=_i+_68;
		//assign %6 = %69  : int
		_i = _69;
		//const %70 = 1 : int
		_70 = 1;
		//add %71 = %7, %70 : int
		_71=_l+_70;
		//assign %7 = %71  : int
		_l = _71;
	}
//.blklab4
blklab4:;
	//deref %72 = %5 : &[int]
	_72 = *(_rhs);
	_72_size = _rhs_size;
	//lengthof %73 = %72 : [int]
	_73 = _72_size;
	//ifge %8, %73 goto blklab5 : int
	while(_r<_73){
		//deref %74 = %5 : &[int]
		_74 = *(_rhs);
		_74_size = _rhs_size;
		//indexof %75 = %74, %8 : [int]
		_75=_74[_r];
		//deref %76 = %5 : &[int]
		_76 = *(_rhs);
		_76_size = _rhs_size;
		//indexof %77 = %76, %8 : [int]
		_77=_76[_r];
		//update (*%0)[%6] = %77 : &[int] -> &[int]
		(*_items)[_i] = _77;
		//const %78 = 1 : int
		_78 = 1;
		//add %79 = %6, %78 : int
		_79=_i+_78;
		//assign %6 = %79  : int
		_i = _79;
		//const %80 = 1 : int
		_80 = 1;
		//add %81 = %8, %80 : int
		_81=_r+_80;
		//assign %8 = %81  : int
		_r = _81;
	}
//.blklab5
blklab5:;
//.blklab0
blklab0:;
	//return
	
}
int main(int argc, char** args){
	long long _max;
	long long* _arr = NULL;
	long long _arr_size = 0;
	long long _index = 0;
	long long** _ys = NULL;
	long long _ys_size = 0;
	long long _5;
	long long _6;
	long long** _7 = NULL;
	long long _7_size = 0;
	long long _8 = 0;
	long long* _9 = NULL;
	long long _9_size = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	void* _11 = NULL;
	long long _11_size = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	long long* _16 = NULL;
	long long _16_size = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long** _19 = NULL;
	long long _19_size = 0;
	long long** _20 = NULL;
	long long _20_size = 0;
	long long _21 = 0;
	long long* _22 = NULL;
	long long _22_size = 0;
	long long _23 = 0;
	long long* _24 = NULL;
	long long _24_size = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long* _28 = NULL;
	long long _28_size = 0;
	long long _29 = 0;
	long long* _32 = NULL;
	long long _32_size = 0;
	long long _33 = 0;
	//fieldload %7 = %0 args : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
	_7 = convertArgsToIntArray(argc, args, _7_size);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : [[int]]
	_9=_7[_8];
	//invoke %6 = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_6 = parseInteger(_9);
	//assign %5 = %6  : null|int
	_5 = _6;
	//assign %1 = %5  : null|int
	_max = _5;
	//ifis %1, null goto blklab6 : null|int
	if(_max == NULL) { goto blklab6;}
	//newlist %11 = () : [void]
	_11_size = 0;
	_11 = malloc(_11_size);
	//assign %10 = %11  : [void]
	_10_size = _11_size;
	_10 = clone((long long*)_11, _11_size);
	//assign %2 = %10  : [int]
	_arr_size = _10_size;
	_arr = clone(_10, _10_size);
	//const %13 = 0 : int
	_13 = 0;
	//assign %12 = %13  : int
	_12 = _13;
	//assign %3 = %12  : int
	_index = _12;
	//ifgt %3, %1 goto blklab7 : int
	while(_index<=_max){
		//sub %14 = %1, %3 : int
		_14=_max-_index;
		//newlist %15 = (%14) : [int]
		_15_size = 1;
		_15 = (long long*)malloc(_15_size*sizeof(long long));
		_15[0] = _14;
		//append %16 = %2, %15 : [int]
		_16_size = _arr_size+_15_size;
		_16=append(_arr, _arr_size, _15, _15_size);

		//assign %2 = %16  : [int]
		_arr_size = _16_size;
		_arr = clone(_16, _16_size);
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=_index+_17;
		//assign %3 = %18  : int
		_index = _18;
	}
//.blklab7
blklab7:;
	//newobject %20 = %2 : &[int]
	long long* _arr_value = clone(_arr, _arr_size);
	_20 = (long long**)&(_arr_value);
	_20_size = _arr_size;
	//assign %19 = %20  : &[int]
	_19 = _20;
	_19_size = _20_size;
	//assign %4 = %19  : &[int]
	_ys = _19;
	_ys_size = _19_size;
	//const %21 = 0 : int
	_21 = 0;
	//deref %22 = %4 : &[int]
	_22 = *(_ys);
	_22_size = _ys_size;
	//lengthof %23 = %22 : [int]
	_23 = _22_size;
	//invoke %(%4, %21, %23) sort:sort : method(&[int],int,int) -> void
	sort(_ys, _ys_size ,_21 ,_23);
	//assert
	{
		//deref %24 = %4 : &[int]
		_24 = *(_ys);
		_24_size = _ys_size;
		//const %25 = 0 : int
		_25 = 0;
		//indexof %26 = %24, %25 : [int]
		_26=_24[_25];
		//const %27 = 0 : int
		_27 = 0;
		//ifeq %26, %27 goto blklab8 : int
		if(_26==_27){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//assert
	{
		//deref %28 = %4 : &[int]
		_28 = *(_ys);
		_28_size = _ys_size;
		//indexof %29 = %28, %1 : [int]
		_29=_28[_max];
		//ifeq %29, %1 goto blklab9 : int
		if(_29==_max){goto blklab9;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab9
blklab9:;
	//assert
	}
	//fieldload %30 = %0 out : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
	//fieldload %31 = %30 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	//deref %32 = %4 : &[int]
	_32 = *(_ys);
	_32_size = _ys_size;
	//indexof %33 = %32, %1 : [int]
	_33=_32[_max];
	//indirectinvoke %31 (%33) : method(any) -> void
	indirect_printf(_33);

//.blklab6
blklab6:;
	//return
	
}
