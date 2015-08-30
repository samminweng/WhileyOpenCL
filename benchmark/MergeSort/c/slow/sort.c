#include "sort.h"
long long* sort(long long* _items, long long _items_size){
	long long _pivot = 0;
	long long* _lhs = NULL;
	long long _lhs_size = 0;
	long long* _rhs = NULL;
	long long _rhs_size = 0;
	long long _l = 0;
	long long _r = 0;
	long long _i = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long* _13 = NULL;
	long long _13_size = 0;
	long long* _14 = NULL;
	long long _14_size = 0;
	long long _15 = 0;
	long long* _16 = NULL;
	long long _16_size = 0;
	long long* _17 = NULL;
	long long _17_size = 0;
	long long* _18 = NULL;
	long long _18_size = 0;
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
	//lengthof %7 = %0 : [int]
	_7 = _items_size;
	//const %8 = 1 : int
	_8 = 1;
	//ifle %7, %8 goto blklab0 : int
	if(_7<=_8){goto blklab0;}
	//lengthof %10 = %0 : [int]
	_10 = _items_size;
	//const %11 = 2 : int
	_11 = 2;
	//div %12 = %10, %11 : int
	_12=_10/_11;
	//assign %9 = %12  : int
	_9 = _12;
	//assign %1 = %9  : int
	_pivot = _9;
	//const %15 = 0 : int
	_15 = 0;
	//sublist %16 = %0, %15, %1 : [int]
	_16_size = _pivot - _15;
	_16 = sublist(clone(_items, _items_size), _15, _pivot);
	//invoke %14 = (%16) sort:sort : function([int]) -> [int]
	_14_size=_16_size;
	_14=sort(clone(_16, _16_size), _16_size);
	//assign %13 = %14  : [int]
	_13_size = _14_size;
	_13 = clone(_14, _14_size);
	//assign %2 = %13  : [int]
	_lhs_size = _13_size;
	_lhs = clone(_13, _13_size);
	//lengthof %19 = %0 : [int]
	_19 = _items_size;
	//sublist %20 = %0, %1, %19 : [int]
	_20_size = _19 - _pivot;
	_20 = sublist(clone(_items, _items_size), _pivot, _19);
	//invoke %18 = (%20) sort:sort : function([int]) -> [int]
	_18_size=_20_size;
	_18=sort(clone(_20, _20_size), _20_size);
	//assign %17 = %18  : [int]
	_17_size = _18_size;
	_17 = clone(_18, _18_size);
	//assign %3 = %17  : [int]
	_rhs_size = _17_size;
	_rhs = clone(_17, _17_size);
	//const %22 = 0 : int
	_22 = 0;
	//assign %21 = %22  : int
	_21 = _22;
	//assign %4 = %21  : int
	_l = _21;
	//const %24 = 0 : int
	_24 = 0;
	//assign %23 = %24  : int
	_23 = _24;
	//assign %5 = %23  : int
	_r = _23;
	//const %26 = 0 : int
	_26 = 0;
	//assign %25 = %26  : int
	_25 = _26;
	//assign %6 = %25  : int
	_i = _25;
	//lengthof %27 = %0 : [int]
	_27 = _items_size;
	//ifge %6, %27 goto blklab1 : int
	while(_i<_27){
		//lengthof %28 = %2 : [int]
		_28 = _lhs_size;
		//ifge %4, %28 goto blklab1 : int
		if(_l>=_28){goto blklab1;}
		//lengthof %29 = %3 : [int]
		_29 = _rhs_size;
		//ifge %5, %29 goto blklab1 : int
		if(_r>=_29){goto blklab1;}
		//indexof %30 = %2, %4 : [int]
		_30=_lhs[_l];
		//indexof %31 = %3, %5 : [int]
		_31=_rhs[_r];
		//ifgt %30, %31 goto blklab2 : int
		if(_30>_31){goto blklab2;}
		//indexof %32 = %2, %4 : [int]
		_32=_lhs[_l];
		//indexof %33 = %2, %4 : [int]
		_33=_lhs[_l];
		//update %0[%6] = %33 : [int] -> [int]
		_items[_i] = _33;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %4, %34 : int
		_35=_l+_34;
		//assign %4 = %35  : int
		_l = _35;
		//goto blklab3
		goto blklab3;
//.blklab2
blklab2:;
		//indexof %36 = %3, %5 : [int]
		_36=_rhs[_r];
		//indexof %37 = %3, %5 : [int]
		_37=_rhs[_r];
		//update %0[%6] = %37 : [int] -> [int]
		_items[_i] = _37;
		//const %38 = 1 : int
		_38 = 1;
		//add %39 = %5, %38 : int
		_39=_r+_38;
		//assign %5 = %39  : int
		_r = _39;
//.blklab3
blklab3:;
		//const %40 = 1 : int
		_40 = 1;
		//add %41 = %6, %40 : int
		_41=_i+_40;
		//assign %6 = %41  : int
		_i = _41;
	}
//.blklab1
blklab1:;
	//lengthof %42 = %2 : [int]
	_42 = _lhs_size;
	//ifge %4, %42 goto blklab4 : int
	while(_l<_42){
		//indexof %43 = %2, %4 : [int]
		_43=_lhs[_l];
		//indexof %44 = %2, %4 : [int]
		_44=_lhs[_l];
		//update %0[%6] = %44 : [int] -> [int]
		_items[_i] = _44;
		//const %45 = 1 : int
		_45 = 1;
		//add %46 = %6, %45 : int
		_46=_i+_45;
		//assign %6 = %46  : int
		_i = _46;
		//const %47 = 1 : int
		_47 = 1;
		//add %48 = %4, %47 : int
		_48=_l+_47;
		//assign %4 = %48  : int
		_l = _48;
	}
//.blklab4
blklab4:;
	//lengthof %49 = %3 : [int]
	_49 = _rhs_size;
	//ifge %5, %49 goto blklab5 : int
	while(_r<_49){
		//indexof %50 = %3, %5 : [int]
		_50=_rhs[_r];
		//indexof %51 = %3, %5 : [int]
		_51=_rhs[_r];
		//update %0[%6] = %51 : [int] -> [int]
		_items[_i] = _51;
		//const %52 = 1 : int
		_52 = 1;
		//add %53 = %6, %52 : int
		_53=_i+_52;
		//assign %6 = %53  : int
		_i = _53;
		//const %54 = 1 : int
		_54 = 1;
		//add %55 = %5, %54 : int
		_55=_r+_54;
		//assign %5 = %55  : int
		_r = _55;
	}
//.blklab5
blklab5:;
//.blklab0
blklab0:;
	//return %0 : [int]
	return _items;
	//return
	exit(0);
}
int main(int argc, char** args){
	long long _max;
	long long* _ys = NULL;
	long long _ys_size = 0;
	long long _index = 0;
	long long _4;
	long long _5;
	long long** _6 = NULL;
	long long _6_size = 0;
	long long _7 = 0;
	long long* _8 = NULL;
	long long _8_size = 0;
	long long* _9 = NULL;
	long long _9_size = 0;
	void* _10 = NULL;
	long long _10_size = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long* _14 = NULL;
	long long _14_size = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long* _18 = NULL;
	long long _18_size = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	//fieldload %6 = %0 args : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
	_6 = convertArgsToIntArray(argc, args, _6_size);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : [[int]]
	_8=_6[_7];
	//invoke %5 = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_5 = parseInteger(_8);
	//assign %4 = %5  : null|int
	_4 = _5;
	//assign %1 = %4  : null|int
	_max = _4;
	//ifis %1, null goto blklab6 : null|int
	if(_max == NULL) { goto blklab6;}
	//newlist %10 = () : [void]
	_10_size = 0;
	_10 = malloc(_10_size);
	//assign %9 = %10  : [void]
	_9_size = _10_size;
	_9 = clone((long long*)_10, _10_size);
	//assign %2 = %9  : [int]
	_ys_size = _9_size;
	_ys = clone(_9, _9_size);
	//const %12 = 0 : int
	_12 = 0;
	//assign %11 = %12  : int
	_11 = _12;
	//assign %3 = %11  : int
	_index = _11;
	//ifgt %3, %1 goto blklab7 : int
	while(_index<=_max){
		//sub %13 = %1, %3 : int
		_13=_max-_index;
		//newlist %14 = (%13) : [int]
		_14_size = 1;
		_14 = (long long*)malloc(_14_size*sizeof(long long));
		_14[0] = _13;
		//append %15 = %2, %14 : [int]
		_15_size = _ys_size+_14_size;
		_15=append(_ys, _ys_size, _14, _14_size);

		//assign %2 = %15  : [int]
		_ys_size = _15_size;
		_ys = clone(_15, _15_size);
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %3, %16 : int
		_17=_index+_16;
		//assign %3 = %17  : int
		_index = _17;
	}
//.blklab7
blklab7:;
	//invoke %18 = (%2) sort:sort : function([int]) -> [int]
	_18_size=_ys_size;
	_18=sort(clone(_ys, _ys_size), _ys_size);
	//assign %2 = %18  : [int]
	_ys_size = _18_size;
	_ys = clone(_18, _18_size);
	//const %19 = 0 : int
	_19 = 0;
	//assign %3 = %19  : int
	_index = _19;
	//ifgt %3, %1 goto blklab8 : int
	while(_index<=_max){
		//assert
		{
			//indexof %20 = %2, %3 : [int]
			_20=_ys[_index];
			//ifeq %20, %3 goto blklab9 : int
			if(_20==_index){goto blklab9;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab9
blklab9:;
		//assert
		}
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %3, %21 : int
		_22=_index+_21;
		//assign %3 = %22  : int
		_index = _22;
	}
//.blklab8
blklab8:;
	//fieldload %23 = %0 out : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
	//fieldload %24 = %23 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	//indirectinvoke %24 (%2) : method(any) -> void
	indirect_printf_array(_ys, _ys_size);

//.blklab6
blklab6:;
	//return
	exit(0);
}
