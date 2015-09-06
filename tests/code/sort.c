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
	long long _19 = 0;
	long long _20 = 0;
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
	//const %20 = 0 : int
	_20 = 0;
	//assign %19 = %20  : int
	_19 = _20;
	//assign %6 = %19  : int
	_l = _19;
	//const %22 = 0 : int
	_22 = 0;
	//assign %21 = %22  : int
	_21 = _22;
	//assign %7 = %21  : int
	_r = _21;
	//const %24 = 0 : int
	_24 = 0;
	//assign %23 = %24  : int
	_23 = _24;
	//assign %8 = %23  : int
	_i = _23;
	//lengthof %25 = %0 : [int]
	_25 = _items_size;
	//ifge %8, %25 goto blklab1 : int
	while(_i<_25){
		//lengthof %26 = %4 : [int]
		_26 = _lhs_size;
		//ifge %6, %26 goto blklab1 : int
		if(_l>=_26){goto blklab1;}
		//lengthof %27 = %5 : [int]
		_27 = _rhs_size;
		//ifge %7, %27 goto blklab1 : int
		if(_r>=_27){goto blklab1;}
		//iflt %8, %1 goto blklab2 : int
		if(_i<_start){goto blklab2;}
		//indexof %28 = %4, %6 : [int]
		_28=_lhs[_l];
		//indexof %29 = %5, %7 : [int]
		_29=_rhs[_r];
		//ifgt %28, %29 goto blklab4 : int
		if(_28>_29){goto blklab4;}
		//indexof %30 = %4, %6 : [int]
		_30=_lhs[_l];
		//indexof %31 = %4, %6 : [int]
		_31=_lhs[_l];
		//update %0[%8] = %31 : [int] -> [int]
		_items[_i] = _31;
		//const %32 = 1 : int
		_32 = 1;
		//add %33 = %6, %32 : int
		_33=_l+_32;
		//assign %6 = %33  : int
		_l = _33;
		//goto blklab5
		goto blklab5;
//.blklab4
blklab4:;
		//indexof %34 = %5, %7 : [int]
		_34=_rhs[_r];
		//indexof %35 = %5, %7 : [int]
		_35=_rhs[_r];
		//update %0[%8] = %35 : [int] -> [int]
		_items[_i] = _35;
		//const %36 = 1 : int
		_36 = 1;
		//add %37 = %7, %36 : int
		_37=_r+_36;
		//assign %7 = %37  : int
		_r = _37;
//.blklab5
blklab5:;
		//goto blklab3
		goto blklab3;
//.blklab2
blklab2:;
		//indexof %38 = %0, %8 : [int]
		_38=_items[_i];
		//indexof %39 = %0, %8 : [int]
		_39=_items[_i];
		//update %0[%8] = %39 : [int] -> [int]
		_items[_i] = _39;
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
	//ifge %6, %42 goto blklab6 : int
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
//.blklab6
blklab6:;
	//lengthof %49 = %5 : [int]
	_49 = _rhs_size;
	//ifge %7, %49 goto blklab7 : int
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
//.blklab7
blklab7:;
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
		//ifeq %1, %18 goto blklab8 : [int]
		if(isArrayEqual(_xs, _xs_size,_18, _18_size)==1){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//return
	exit(0);
}
