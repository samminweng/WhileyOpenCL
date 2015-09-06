#include "sort.h"
long long* sort(long long* _items, long long _items_size, long long _start, long long _end){
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
	long long* _18 = NULL;
	long long _18_size = 0;
	long long* _19 = NULL;
	long long _19_size = 0;
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
	//invoke %16 = (%0, %1, %3) sort:sort : function([int],int,int) -> [int]
	_16_size=_items_size;
	_16=sort(clone(_items, _items_size), _items_size ,_start ,_pivot);
	//assign %15 = %16  : [int]
	_15_size = _16_size;
	_15 = clone(_16, _16_size);
	//assign %4 = %15  : [int]
	_lhs_size = _15_size;
	_lhs = clone(_15, _15_size);
	//invoke %18 = (%0, %3, %2) sort:sort : function([int],int,int) -> [int]
	_18_size=_items_size;
	_18=sort(clone(_items, _items_size), _items_size ,_pivot ,_end);
	//assign %17 = %18  : [int]
	_17_size = _18_size;
	_17 = clone(_18, _18_size);
	//assign %5 = %17  : [int]
	_rhs_size = _17_size;
	_rhs = clone(_17, _17_size);
	//sublist %19 = %0, %1, %3 : [int]
	_19_size = _pivot - _start;
	_19 = sublist(clone(_items, _items_size), _start, _pivot);
	//assign %4 = %19  : [int]
	_lhs_size = _19_size;
	_lhs = clone(_19, _19_size);
	//sublist %20 = %0, %3, %2 : [int]
	_20_size = _end - _pivot;
	_20 = sublist(clone(_items, _items_size), _pivot, _end);
	//assign %5 = %20  : [int]
	_rhs_size = _20_size;
	_rhs = clone(_20, _20_size);
	//const %22 = 0 : int
	_22 = 0;
	//assign %21 = %22  : int
	_21 = _22;
	//assign %6 = %21  : int
	_l = _21;
	//const %24 = 0 : int
	_24 = 0;
	//assign %23 = %24  : int
	_23 = _24;
	//assign %7 = %23  : int
	_r = _23;
	//const %26 = 0 : int
	_26 = 0;
	//assign %25 = %26  : int
	_25 = _26;
	//assign %8 = %25  : int
	_i = _25;
	//lengthof %27 = %0 : [int]
	_27 = _items_size;
	//ifge %8, %27 goto blklab1 : int
	while(_i<_27){
		//lengthof %28 = %4 : [int]
		_28 = _lhs_size;
		//ifge %6, %28 goto blklab1 : int
		if(_l>=_28){goto blklab1;}
		//lengthof %29 = %5 : [int]
		_29 = _rhs_size;
		//ifge %7, %29 goto blklab1 : int
		if(_r>=_29){goto blklab1;}
		//indexof %30 = %4, %6 : [int]
		_30=_lhs[_l];
		//indexof %31 = %5, %7 : [int]
		_31=_rhs[_r];
		//ifgt %30, %31 goto blklab2 : int
		if(_30>_31){goto blklab2;}
		//indexof %32 = %4, %6 : [int]
		_32=_lhs[_l];
		//indexof %33 = %4, %6 : [int]
		_33=_lhs[_l];
		//update %0[%8] = %33 : [int] -> [int]
		_items[_i] = _33;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %6, %34 : int
		_35=_l+_34;
		//assign %6 = %35  : int
		_l = _35;
		//goto blklab3
		goto blklab3;
//.blklab2
blklab2:;
		//indexof %36 = %5, %7 : [int]
		_36=_rhs[_r];
		//indexof %37 = %5, %7 : [int]
		_37=_rhs[_r];
		//update %0[%8] = %37 : [int] -> [int]
		_items[_i] = _37;
		//const %38 = 1 : int
		_38 = 1;
		//add %39 = %7, %38 : int
		_39=_r+_38;
		//assign %7 = %39  : int
		_r = _39;
//.blklab3
blklab3:;
		//const %40 = 1 : int
		_40 = 1;
		//add %41 = %8, %40 : int
		_41=_i+_40;
		//assign %8 = %41  : int
		_i = _41;
	}
//.blklab1
blklab1:;
	//lengthof %42 = %4 : [int]
	_42 = _lhs_size;
	//ifge %6, %42 goto blklab4 : int
	while(_l<_42){
		//indexof %43 = %4, %6 : [int]
		_43=_lhs[_l];
		//indexof %44 = %4, %6 : [int]
		_44=_lhs[_l];
		//update %0[%8] = %44 : [int] -> [int]
		_items[_i] = _44;
		//const %45 = 1 : int
		_45 = 1;
		//add %46 = %8, %45 : int
		_46=_i+_45;
		//assign %8 = %46  : int
		_i = _46;
		//const %47 = 1 : int
		_47 = 1;
		//add %48 = %6, %47 : int
		_48=_l+_47;
		//assign %6 = %48  : int
		_l = _48;
	}
//.blklab4
blklab4:;
	//lengthof %49 = %5 : [int]
	_49 = _rhs_size;
	//ifge %7, %49 goto blklab5 : int
	while(_r<_49){
		//indexof %50 = %5, %7 : [int]
		_50=_rhs[_r];
		//indexof %51 = %5, %7 : [int]
		_51=_rhs[_r];
		//update %0[%8] = %51 : [int] -> [int]
		_items[_i] = _51;
		//const %52 = 1 : int
		_52 = 1;
		//add %53 = %8, %52 : int
		_53=_i+_52;
		//assign %8 = %53  : int
		_i = _53;
		//const %54 = 1 : int
		_54 = 1;
		//add %55 = %7, %54 : int
		_55=_r+_54;
		//assign %7 = %55  : int
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
	long long* _xs = NULL;
	long long _xs_size = 0;
	long long* _2 = NULL;
	long long _2_size = 0;
	void* _3 = NULL;
	long long _3_size = 0;
	long long* _4 = NULL;
	long long _4_size = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long* _18 = NULL;
	long long _18_size = 0;
	//newlist %3 = () : [void]
	_3_size = 0;
	_3 = malloc(_3_size);
	//assign %2 = %3  : [void]
	_2_size = _3_size;
	_2 = clone((long long*)_3, _3_size);
	//assign %1 = %2  : [int]
	_xs_size = _2_size;
	_xs = clone(_2, _2_size);
	//const %5 = 4 : int
	_5 = 4;
	//const %6 = 3 : int
	_6 = 3;
	//const %7 = 5 : int
	_7 = 5;
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 1 : int
	_9 = 1;
	//newlist %10 = (%5, %6, %7, %8, %9) : [int]
	_10_size = 5;
	_10 = (long long*)malloc(_10_size*sizeof(long long));
	_10[0] = _5;	_10[1] = _6;	_10[2] = _7;	_10[3] = _8;	_10[4] = _9;
	//const %11 = 0 : int
	_11 = 0;
	//const %12 = 5 : int
	_12 = 5;
	//invoke %4 = (%10, %11, %12) sort:sort : function([int],int,int) -> [int]
	_4_size=_10_size;
	_4=sort(clone(_10, _10_size), _10_size ,_11 ,_12);
	//assign %1 = %4  : [int]
	_xs_size = _4_size;
	_xs = clone(_4, _4_size);
	//assert
	{
		//const %13 = 1 : int
		_13 = 1;
		//const %14 = 2 : int
		_14 = 2;
		//const %15 = 3 : int
		_15 = 3;
		//const %16 = 4 : int
		_16 = 4;
		//const %17 = 5 : int
		_17 = 5;
		//newlist %18 = (%13, %14, %15, %16, %17) : [int]
		_18_size = 5;
		_18 = (long long*)malloc(_18_size*sizeof(long long));
		_18[0] = _13;		_18[1] = _14;		_18[2] = _15;		_18[3] = _16;		_18[4] = _17;
		//ifeq %1, %18 goto blklab6 : [int]
		if(isArrayEqual(_xs, _xs_size,_18, _18_size)==1){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//return
	exit(0);
}
