#include "reverse.h"
long long* reverse(_DECL_1DARRAY_PARAM(ls), _DECL_DEALLOC_PARAM(ls)){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	long long i = 0;
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	long long item = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	//lengthof %5 = %0 : int[]
	_5 = ls_size;
	//assign %2 = %5  : int
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//lengthof %7 = %0 : int[]
	_7 = ls_size;
	//arraygen %8 = [6; 7] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY(_8, _7, _6);
	_ADD_DEALLOC(_8);
	//assign %3 = %8  : int[]
	_DEALLOC(r);
	_UPDATE_1DARRAY(r, _8);
	_TRANSFER_DEALLOC(r, _8);
	//loop (%2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %16, %17)
	while(true){
		//invariant
		{
			//lengthof %9 = %0 : int[]
			_9 = ls_size;
			//ifgt %2, %9 goto blklab3 : int
			if(i>_9){goto blklab3;}
			//lengthof %10 = %3 : int[]
			_10 = r_size;
			//lengthof %11 = %0 : int[]
			_11 = ls_size;
			//ifeq %10, %11 goto blklab2 : int
			if(_10==_11){goto blklab2;}
//.blklab3
blklab3:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab2
blklab2:;
		//invariant
		}
		//const %12 = 0 : int
		_12 = 0;
		//ifle %2, %12 goto blklab0 : int
		if(i<=_12){goto blklab0;}
		//lengthof %13 = %0 : int[]
		_13 = ls_size;
		//sub %14 = %13, %2 : int
		_14=_13-i;
		//indexof %15 = %0, %14 : int[]
		_15=ls[_14];
		//assign %4 = %15  : int
		item = _15;
		//const %16 = 1 : int
		_16 = 1;
		//sub %17 = %2, %16 : int
		_17=i-_16;
		//assign %2 = %17  : int
		i = _17;
		//update %3[%2] = %4 : int[] -> int[]
		r[i] = item;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %3
	_DEALLOC(ls);
	_DEALLOC(_1);
	_DEALLOC(_8);
	return r;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(rs);
	_DECL_DEALLOC(rs);
	long long max = 0;
	long long index = 0;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	void* _32;
	_DECL_1DARRAY(_34);
	_DECL_DEALLOC(_34);
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 2 : int
	_7 = 2;
	//const %8 = 3 : int
	_8 = 3;
	//const %9 = 4 : int
	_9 = 4;
	//const %10 = 5 : int
	_10 = 5;
	//newlist %11 = (%6, %7, %8, %9, %10) : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY(_11, 5, 0);
	_11[0] = _6; _11[1] = _7; _11[2] = _8; _11[3] = _9; _11[4] = _10; 
	_ADD_DEALLOC(_11);
	//invoke (%5) = (%11) reverse:reverse : function(int[])->(int[])
	{
		_UPDATE_1DARRAY_SIZE(_5, _11);
		_DEALLOC(_5);
		_5 = reverse(_1DARRAY_PARAM(_11), false);
		_ADD_DEALLOC(_5);
	}
	//assign %1 = %5  : int[]
	_DEALLOC(rs);
	_UPDATE_1DARRAY(rs, _5);
	_TRANSFER_DEALLOC(rs, _5);
	//assert
	{
		//const %12 = 5 : int
		_12 = 5;
		//const %13 = 4 : int
		_13 = 4;
		//const %14 = 3 : int
		_14 = 3;
		//const %15 = 2 : int
		_15 = 2;
		//const %16 = 1 : int
		_16 = 1;
		//newlist %17 = (%12, %13, %14, %15, %16) : int[]
		_DEALLOC(_17);
		_NEW_1DARRAY(_17, 5, 0);
		_17[0] = _12; _17[1] = _13; _17[2] = _14; _17[3] = _15; _17[4] = _16; 
		_ADD_DEALLOC(_17);
		//ifeq %1, %17 goto blklab4 : int[]
		_IFEQ_ARRAY(rs, _17, blklab4);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//const %18 = 10 : int
	_18 = 10;
	//assign %2 = %18  : int
	max = _18;
	//const %19 = 0 : int
	_19 = 0;
	//assign %3 = %19  : int
	index = _19;
	//const %20 = 0 : int
	_20 = 0;
	//const %21 = 1 : int
	_21 = 1;
	//add %22 = %2, %21 : int
	_22=max+_21;
	//arraygen %23 = [20; 22] : int[]
	_DEALLOC(_23);
	_NEW_1DARRAY(_23, _22, _20);
	_ADD_DEALLOC(_23);
	//assign %4 = %23  : int[]
	_DEALLOC(arr);
	_UPDATE_1DARRAY(arr, _23);
	_TRANSFER_DEALLOC(arr, _23);
	//loop (%3, %4, %24, %25, %26)
	while(true){
		//ifgt %3, %2 goto blklab5 : int
		if(index>max){goto blklab5;}
		//sub %24 = %2, %3 : int
		_24=max-index;
		//update %4[%3] = %24 : int[] -> int[]
		arr[index] = _24;
		//const %25 = 1 : int
		_25 = 1;
		//add %26 = %3, %25 : int
		_26=index+_25;
		//assign %3 = %26  : int
		index = _26;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//invoke (%27) = (%4) reverse:reverse : function(int[])->(int[])
	{
		_UPDATE_1DARRAY_SIZE(_27, arr);
		_DEALLOC(_27);
		_27 = reverse(_1DARRAY_PARAM(arr), false);
		_ADD_DEALLOC(_27);
	}
	//assign %4 = %27  : int[]
	_DEALLOC(arr);
	_UPDATE_1DARRAY(arr, _27);
	_TRANSFER_DEALLOC(arr, _27);
	//assert
	{
		//const %28 = 0 : int
		_28 = 0;
		//indexof %29 = %4, %28 : int[]
		_29=arr[_28];
		//const %30 = 0 : int
		_30 = 0;
		//ifeq %29, %30 goto blklab7 : int
		if(_29==_30){goto blklab7;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab7
blklab7:;
	//assert
	}
	//assert
	{
		//indexof %31 = %4, %2 : int[]
		_31=arr[max];
		//ifeq %31, %2 goto blklab8 : int
		if(_31==max){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %34 = [80,97,115,115,32,114,101,118,101,114,115,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_34);
	_NEW_1DARRAY(_34, 22, 0);
	_34[0] = 80; _34[1] = 97; _34[2] = 115; _34[3] = 115; _34[4] = 32; _34[5] = 114; _34[6] = 101; _34[7] = 118; _34[8] = 101; _34[9] = 114; _34[10] = 115; _34[11] = 101; _34[12] = 32; _34[13] = 116; _34[14] = 101; _34[15] = 115; _34[16] = 116; _34[17] = 32; _34[18] = 99; _34[19] = 97; _34[20] = 115; _34[21] = 101; 
	_ADD_DEALLOC(_34);
	//indirectinvoke () = %33 (%34) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_34));
	//return
	_DEALLOC(rs);
	_DEALLOC(arr);
	_DEALLOC(_5);
	_DEALLOC(_11);
	_DEALLOC(_17);
	_DEALLOC(_23);
	_DEALLOC(_27);
	_DEALLOC(_34);
	exit(0);
}

