#include "MergeSort.h"
long long* sortV1(_DECL_1DARRAY_PARAM(items), _DECL_OWNERSHIP_PARAM(items), long long start, long long end){
	_DECL_1DARRAY(_3);
	_DECL_OWNERSHIP(_3);
	long long pivot = 0;
	_DECL_1DARRAY(lhs);
	_DECL_OWNERSHIP(lhs);
	_DECL_1DARRAY(rhs);
	_DECL_OWNERSHIP(rhs);
	long long l = 0;
	long long r = 0;
	long long i = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_OWNERSHIP(_15);
	_DECL_1DARRAY(_16);
	_DECL_OWNERSHIP(_16);
	long long _17 = 0;
	_DECL_1DARRAY(_18);
	_DECL_OWNERSHIP(_18);
	_DECL_1DARRAY(_19);
	_DECL_OWNERSHIP(_19);
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
	//const %10 = 1 : int
	_10 = 1;
	//add %11 = %1, %10 : int
	_11=start+_10;
	//ifge %11, %2 goto blklab0 : int
	if(_11>=end){goto blklab0;}
	//add %12 = %1, %2 : int
	_12=start+end;
	//const %13 = 2 : int
	_13 = 2;
	//div %14 = %12, %13 : int
	_14=_12/_13;
	//assign %4 = %14  : int
	pivot = _14;
	//invoke (%15) = (%0, %1, %4) whiley/lang/Array:slice : function(int[],int,int)->(int[])
	_FREE(_15);
_SLICE_ARRAY(_15, items, start, pivot);
	_ADD_OWNERSHIP(_15);
	//assign %5 = %15  : int[]
	_FREE(lhs);
	_1DARRAY_COPY(lhs, _15);
	_ADD_OWNERSHIP(lhs);
	_ADD_OWNERSHIP(_15);
	//const %17 = 0 : int
	_17 = 0;
	//invoke (%16) = (%5, %17, %4) MergeSort:sortV1 : function(int[],int,int)->(int[])
	_FREE(_16);
	_REMOVE_OWNERSHIP(lhs);
	_1DARRAY_SIZE(_16, lhs);
	_16 = sortV1(_1DARRAY_COPY_PARAM(lhs), true, _17, pivot);
	_ADD_OWNERSHIP(_16);
	//assign %5 = %16  : int[]
	_FREE(lhs);
	_1DARRAY_COPY(lhs, _16);
	_ADD_OWNERSHIP(lhs);
	_ADD_OWNERSHIP(_16);
	//invoke (%18) = (%0, %4, %2) whiley/lang/Array:slice : function(int[],int,int)->(int[])
	_FREE(_18);
_SLICE_ARRAY(_18, items, pivot, end);
	_ADD_OWNERSHIP(_18);
	//assign %6 = %18  : int[]
	_FREE(rhs);
	_1DARRAY_COPY(rhs, _18);
	_ADD_OWNERSHIP(rhs);
	_ADD_OWNERSHIP(_18);
	//const %20 = 0 : int
	_20 = 0;
	//sub %21 = %2, %4 : int
	_21=end-pivot;
	//invoke (%19) = (%6, %20, %21) MergeSort:sortV1 : function(int[],int,int)->(int[])
	_FREE(_19);
	_REMOVE_OWNERSHIP(rhs);
	_1DARRAY_SIZE(_19, rhs);
	_19 = sortV1(_1DARRAY_COPY_PARAM(rhs), true, _20, _21);
	_ADD_OWNERSHIP(_19);
	//assign %6 = %19  : int[]
	_FREE(rhs);
	_1DARRAY_COPY(rhs, _19);
	_ADD_OWNERSHIP(rhs);
	_ADD_OWNERSHIP(_19);
	//const %22 = 0 : int
	_22 = 0;
	//assign %7 = %22  : int
	l = _22;
	//const %23 = 0 : int
	_23 = 0;
	//assign %8 = %23  : int
	r = _23;
	//const %24 = 0 : int
	_24 = 0;
	//assign %9 = %24  : int
	i = _24;
	//loop (%0, %7, %8, %9, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37)
	while(true){
		//sub %25 = %2, %1 : int
		_25=end-start;
		//ifge %9, %25 goto blklab1 : int
		if(i>=_25){goto blklab1;}
		//sub %26 = %4, %1 : int
		_26=pivot-start;
		//ifge %7, %26 goto blklab1 : int
		if(l>=_26){goto blklab1;}
		//sub %27 = %2, %4 : int
		_27=end-pivot;
		//ifge %8, %27 goto blklab1 : int
		if(r>=_27){goto blklab1;}
		//indexof %28 = %5, %7 : int[]
		_28=lhs[l];
		//indexof %29 = %6, %8 : int[]
		_29=rhs[r];
		//ifgt %28, %29 goto blklab3 : int
		if(_28>_29){goto blklab3;}
		//indexof %30 = %5, %7 : int[]
		_30=lhs[l];
		//update %0[%9] = %30 : int[] -> int[]
		items[i] = _30;
		//const %31 = 1 : int
		_31 = 1;
		//add %32 = %7, %31 : int
		_32=l+_31;
		//assign %7 = %32  : int
		l = _32;
		//goto blklab4
		goto blklab4;
//.blklab3
blklab3:;
		//indexof %33 = %6, %8 : int[]
		_33=rhs[r];
		//update %0[%9] = %33 : int[] -> int[]
		items[i] = _33;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %8, %34 : int
		_35=r+_34;
		//assign %8 = %35  : int
		r = _35;
//.blklab4
blklab4:;
		//const %36 = 1 : int
		_36 = 1;
		//add %37 = %9, %36 : int
		_37=i+_36;
		//assign %9 = %37  : int
		i = _37;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//loop (%0, %7, %9, %38, %39, %40, %41, %42, %43)
	while(true){
		//sub %38 = %4, %1 : int
		_38=pivot-start;
		//ifge %7, %38 goto blklab5 : int
		if(l>=_38){goto blklab5;}
		//indexof %39 = %5, %7 : int[]
		_39=lhs[l];
		//update %0[%9] = %39 : int[] -> int[]
		items[i] = _39;
		//const %40 = 1 : int
		_40 = 1;
		//add %41 = %9, %40 : int
		_41=i+_40;
		//assign %9 = %41  : int
		i = _41;
		//const %42 = 1 : int
		_42 = 1;
		//add %43 = %7, %42 : int
		_43=l+_42;
		//assign %7 = %43  : int
		l = _43;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//loop (%0, %8, %9, %44, %45, %46, %47, %48, %49)
	while(true){
		//sub %44 = %2, %4 : int
		_44=end-pivot;
		//ifge %8, %44 goto blklab7 : int
		if(r>=_44){goto blklab7;}
		//indexof %45 = %6, %8 : int[]
		_45=rhs[r];
		//update %0[%9] = %45 : int[] -> int[]
		items[i] = _45;
		//const %46 = 1 : int
		_46 = 1;
		//add %47 = %9, %46 : int
		_47=i+_46;
		//assign %9 = %47  : int
		i = _47;
		//const %48 = 1 : int
		_48 = 1;
		//add %49 = %8, %48 : int
		_49=r+_48;
		//assign %8 = %49  : int
		r = _49;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
//.blklab0
blklab0:;
	//return %0
	_FREE(_3);
	_FREE(lhs);
	_FREE(rhs);
	_FREE(_15);
	_FREE(_16);
	_FREE(_18);
	_FREE(_19);
	return items;
	//return
}

int main(int argc, char** args){
	long long max;
	long long index = 0;
	_DECL_1DARRAY(arr);
	_DECL_OWNERSHIP(arr);
	long long _4;
	_DECL_2DARRAY(_5);
	_DECL_OWNERSHIP(_5);
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	_DECL_1DARRAY(_12);
	_DECL_OWNERSHIP(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	_DECL_1DARRAY(_16);
	_DECL_OWNERSHIP(_16);
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	void* _24;
	_DECL_1DARRAY(_26);
	_DECL_OWNERSHIP(_26);
	void* _27;
	//fieldload %5 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_5);
	_ADD_OWNERSHIP(_5);
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %5, %6 : int[][]
	_7=_5[_6];
	//invoke (%4) = (%7) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_4, _7);
	//assign %1 = %4  : null|int
	max = _4;
	//ifis %1, null goto blklab9 : null|int
	if(max == NULL) { goto blklab9;}
	//const %8 = 0 : int
	_8 = 0;
	//assign %2 = %8  : int
	index = _8;
	//const %9 = 0 : int
	_9 = 0;
	//const %10 = 1 : int
	_10 = 1;
	//add %11 = %1, %10 : int
	_11=max+_10;
	//arraygen %12 = [9; 11] : int[]
	_FREE(_12);
	_GEN_1DARRAY(_12, _11, _9);
	_ADD_OWNERSHIP(_12);
	//assign %3 = %12  : int[]
	_FREE(arr);
	_1DARRAY_COPY(arr, _12);
	_ADD_OWNERSHIP(arr);
	_ADD_OWNERSHIP(_12);
	//loop (%2, %3, %13, %14, %15)
	while(true){
		//ifgt %2, %1 goto blklab10 : int
		if(index>max){goto blklab10;}
		//sub %13 = %1, %2 : int
		_13=max-index;
		//update %3[%2] = %13 : int[] -> int[]
		arr[index] = _13;
		//const %14 = 1 : int
		_14 = 1;
		//add %15 = %2, %14 : int
		_15=index+_14;
		//assign %2 = %15  : int
		index = _15;
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//const %17 = 0 : int
	_17 = 0;
	//const %18 = 1 : int
	_18 = 1;
	//add %19 = %1, %18 : int
	_19=max+_18;
	//invoke (%16) = (%3, %17, %19) MergeSort:sortV1 : function(int[],int,int)->(int[])
	_FREE(_16);
	_REMOVE_OWNERSHIP(arr);
	_1DARRAY_SIZE(_16, arr);
	_16 = sortV1(_1DARRAY_COPY_PARAM(arr), true, _17, _19);
	_ADD_OWNERSHIP(_16);
	//assign %3 = %16  : int[]
	_FREE(arr);
	_1DARRAY_COPY(arr, _16);
	_ADD_OWNERSHIP(arr);
	_ADD_OWNERSHIP(_16);
	//assert
	{
		//const %20 = 0 : int
		_20 = 0;
		//indexof %21 = %3, %20 : int[]
		_21=arr[_20];
		//const %22 = 0 : int
		_22 = 0;
		//ifeq %21, %22 goto blklab12 : int
		if(_21==_22){goto blklab12;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab12
blklab12:;
	//assert
	}
	//assert
	{
		//indexof %23 = %3, %1 : int[]
		_23=arr[max];
		//ifeq %23, %1 goto blklab13 : int
		if(_23==max){goto blklab13;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab13
blklab13:;
	//assert
	}
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [80,97,115,115,32,77,101,114,103,101,83,111,114,116,32,116,101,115,116,32,99,97,115,101,32,119,105,116,104,32,105,110,112,117,116,32,61,32] : int[]
	_FREE(_26);
	_NEW_ARRAY(_26, 38);
	_26[0] = 80; _26[1] = 97; _26[2] = 115; _26[3] = 115; _26[4] = 32; _26[5] = 77; _26[6] = 101; _26[7] = 114; _26[8] = 103; _26[9] = 101; _26[10] = 83; _26[11] = 111; _26[12] = 114; _26[13] = 116; _26[14] = 32; _26[15] = 116; _26[16] = 101; _26[17] = 115; _26[18] = 116; _26[19] = 32; _26[20] = 99; _26[21] = 97; _26[22] = 115; _26[23] = 101; _26[24] = 32; _26[25] = 119; _26[26] = 105; _26[27] = 116; _26[28] = 104; _26[29] = 32; _26[30] = 105; _26[31] = 110; _26[32] = 112; _26[33] = 117; _26[34] = 116; _26[35] = 32; _26[36] = 61; _26[37] = 32; 
	_ADD_OWNERSHIP(_26);
	//indirectinvoke () = %25 (%26) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_26));
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %28 (%1) : method(any)->()
	printf("%d\n", max);
//.blklab9
blklab9:;
	//return
	_FREE(arr);
	_FREE2DArray(_5);
	_FREE(_7);
	_FREE(_12);
	_FREE(_16);
	_FREE(_26);
	exit(0);
}

