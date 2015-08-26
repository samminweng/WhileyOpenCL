#include "swap.h"
long long* swap(long long* _xs, long long _xs_size, long long _i0, long long _i1){
	long long _v0 = 0;
	long long _v1 = 0;
	long long _sum = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	//indexof %7 = %0, %1 : [int]
	_7=_xs[_i0];
	//assign %6 = %7  : int
	_6 = _7;
	//assign %3 = %6  : int
	_v0 = _6;
	//indexof %9 = %0, %2 : [int]
	_9=_xs[_i1];
	//assign %8 = %9  : int
	_8 = _9;
	//assign %4 = %8  : int
	_v1 = _8;
	//add %11 = %3, %4 : int
	_11=_v0+_v1;
	//assign %10 = %11  : int
	_10 = _11;
	//assign %5 = %10  : int
	_sum = _10;
	//update %0[%1] = %4 : [int] -> [int]
	_xs[_i0] = _v1;
	//update %0[%2] = %3 : [int] -> [int]
	_xs[_i1] = _v0;
	//return %0 : [int]
	return _xs;
	//return
	;
}
int main(int argc, char** argv){
	long long* _xs = NULL;
	long long _xs_size = 0;
	long long* _ys = NULL;
	long long _ys_size = 0;
	long long* _3 = NULL;
	long long _3_size = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	long long* _11 = NULL;
	long long _11_size = 0;
	long long* _12 = NULL;
	long long _12_size = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long* _21 = NULL;
	long long _21_size = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long* _28 = NULL;
	long long _28_size = 0;
	long long* _29 = NULL;
	long long _29_size = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long* _38 = NULL;
	long long _38_size = 0;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 1 : int
	_5 = 1;
	//const %6 = 2 : int
	_6 = 2;
	//const %7 = 3 : int
	_7 = 3;
	//const %8 = 4 : int
	_8 = 4;
	//const %9 = 5 : int
	_9 = 5;
	//newlist %10 = (%4, %5, %6, %7, %8, %9) : [int]
	_10_size = 6;
	_10 = (long long*)malloc(_10_size*sizeof(long long));
	_10[0] = _4;	_10[1] = _5;	_10[2] = _6;	_10[3] = _7;	_10[4] = _8;	_10[5] = _9;
	//assign %3 = %10  : [int]
	_3 = (long long*)_10;
	_3_size = _10_size;
	//assign %1 = %3  : [int]
	_xs = (long long*)_3;
	_xs_size = _3_size;
	//const %13 = 3 : int
	_13 = 3;
	//const %14 = 5 : int
	_14 = 5;
	//invoke %12 = (%1, %13, %14) swap:swap : function([int],int,int) -> [int]
	_12_size=_xs_size;
	_12=swap(clone(_xs, _xs_size), _xs_size ,_13 ,_14);
	//assign %11 = %12  : [int]
	_11 = (long long*)_12;
	_11_size = _12_size;
	//assign %2 = %11  : [int]
	_ys = (long long*)_11;
	_ys_size = _11_size;
	//assert
	{
		//const %15 = 0 : int
		_15 = 0;
		//const %16 = 1 : int
		_16 = 1;
		//const %17 = 2 : int
		_17 = 2;
		//const %18 = 5 : int
		_18 = 5;
		//const %19 = 4 : int
		_19 = 4;
		//const %20 = 3 : int
		_20 = 3;
		//newlist %21 = (%15, %16, %17, %18, %19, %20) : [int]
		_21_size = 6;
		_21 = (long long*)malloc(_21_size*sizeof(long long));
		_21[0] = _15;		_21[1] = _16;		_21[2] = _17;		_21[3] = _18;		_21[4] = _19;		_21[5] = _20;
		//ifeq %2, %21 goto blklab0 : [int]
		if(isArrayEqual(_ys, _ys_size,_21, _21_size)==1){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab0
blklab0:;
	//assert
	}
	//assert
	{
		//const %22 = 0 : int
		_22 = 0;
		//const %23 = 1 : int
		_23 = 1;
		//const %24 = 2 : int
		_24 = 2;
		//const %25 = 3 : int
		_25 = 3;
		//const %26 = 4 : int
		_26 = 4;
		//const %27 = 5 : int
		_27 = 5;
		//newlist %28 = (%22, %23, %24, %25, %26, %27) : [int]
		_28_size = 6;
		_28 = (long long*)malloc(_28_size*sizeof(long long));
		_28[0] = _22;		_28[1] = _23;		_28[2] = _24;		_28[3] = _25;		_28[4] = _26;		_28[5] = _27;
		//ifeq %1, %28 goto blklab1 : [int]
		if(isArrayEqual(_xs, _xs_size,_28, _28_size)==1){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab1
blklab1:;
	//assert
	}
	//const %30 = 3 : int
	_30 = 3;
	//const %31 = 5 : int
	_31 = 5;
	//invoke %29 = (%1, %30, %31) swap:swap : function([int],int,int) -> [int]
	_29_size=_xs_size;
	_29=swap(_xs, _xs_size ,_30 ,_31);
	//assign %1 = %29  : [int]
	_xs = (long long*)_29;
	_xs_size = _29_size;
	//assert
	{
		//const %32 = 0 : int
		_32 = 0;
		//const %33 = 1 : int
		_33 = 1;
		//const %34 = 2 : int
		_34 = 2;
		//const %35 = 5 : int
		_35 = 5;
		//const %36 = 4 : int
		_36 = 4;
		//const %37 = 3 : int
		_37 = 3;
		//newlist %38 = (%32, %33, %34, %35, %36, %37) : [int]
		_38_size = 6;
		_38 = (long long*)malloc(_38_size*sizeof(long long));
		_38[0] = _32;		_38[1] = _33;		_38[2] = _34;		_38[3] = _35;		_38[4] = _36;		_38[5] = _37;
		//ifeq %1, %38 goto blklab2 : [int]
		if(isArrayEqual(_xs, _xs_size,_38, _38_size)==1){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab2
blklab2:;
	//assert
	}
	//return
	;
}
