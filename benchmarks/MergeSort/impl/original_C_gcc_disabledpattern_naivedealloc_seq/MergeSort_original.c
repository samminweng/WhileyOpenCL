#include "MergeSort_original.h"
int64_t* _sortV1_(_DECL_1DARRAY_PARAM(items), _DECL_DEALLOC_PARAM(items), int64_t start, int64_t end, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t pivot = 0;
	_DECL_1DARRAY(lhs);
	_DECL_DEALLOC(lhs);
	_DECL_1DARRAY(rhs);
	_DECL_DEALLOC(rhs);
	int64_t l = 0;
	int64_t r = 0;
	int64_t i = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	int64_t _17 = 0;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	int64_t _42 = 0;
	int64_t _43 = 0;
	int64_t _44 = 0;
	int64_t _45 = 0;
	int64_t _46 = 0;
	int64_t _47 = 0;
	int64_t _48 = 0;
	int64_t _49 = 0;
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
	{
		_DEALLOC(_15);
_SLICE_ARRAY(_15, items, start, pivot);
		_ADD_DEALLOC(_15);
	}
	//assign %5 = %15  : int[]
	_DEALLOC(lhs);
	_COPY_1DARRAY_int64_t(lhs, _15);
	_ADD_DEALLOC(lhs);
	//const %17 = 0 : int
	_17 = 0;
	//invoke (%16) = (%5, %17, %4) MergeSort_original:sortV1 : function(int[],int,int)->(int[])
	{
		void* lhs_tmp;
		_DEALLOC(_16);
		_16 = _sortV1_(_COPY_1DARRAY_PARAM_int64_t(lhs), false, _17, pivot, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
		_CALLER_DEALLOC(_16, lhs, "true-true-false" , "sortV1");
	}
	//assign %5 = %16  : int[]
	_DEALLOC(lhs);
	_COPY_1DARRAY_int64_t(lhs, _16);
	_ADD_DEALLOC(lhs);
	//invoke (%18) = (%0, %4, %2) whiley/lang/Array:slice : function(int[],int,int)->(int[])
	{
		_DEALLOC(_18);
_SLICE_ARRAY(_18, items, pivot, end);
		_ADD_DEALLOC(_18);
	}
	//assign %6 = %18  : int[]
	_DEALLOC(rhs);
	_COPY_1DARRAY_int64_t(rhs, _18);
	_ADD_DEALLOC(rhs);
	//const %20 = 0 : int
	_20 = 0;
	//sub %21 = %2, %4 : int
	_21=end-pivot;
	//invoke (%19) = (%6, %20, %21) MergeSort_original:sortV1 : function(int[],int,int)->(int[])
	{
		void* rhs_tmp;
		_DEALLOC(_19);
		_19 = _sortV1_(_COPY_1DARRAY_PARAM_int64_t(rhs), false, _20, _21, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
		_CALLER_DEALLOC(_19, rhs, "true-true-false" , "sortV1");
	}
	//assign %6 = %19  : int[]
	_DEALLOC(rhs);
	_COPY_1DARRAY_int64_t(rhs, _19);
	_ADD_DEALLOC(rhs);
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
	_DEALLOC(_3);
	_DEALLOC(lhs);
	_DEALLOC(rhs);
	_DEALLOC(_15);
	_DEALLOC(_16);
	_DEALLOC(_18);
	_DEALLOC(_19);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t max = 0;
	int64_t index = 0;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	int64_t* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	int64_t _16 = 0;
	void* _17;
	int64_t _19 = 0;
	int64_t _20 = 0;
	void* _21;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	void* _26;
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_6);
	_CONV_ARGS(_6);
	_ADD_DEALLOC(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_8_size = _6_size_size;
	_REMOVE_DEALLOC(_8);
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_5, _8);
		_ADD_DEALLOC(_5);
		_REMOVE_DEALLOC(_8);
	}
	//assign %1 = %5  : null|int
	_DEALLOC(n);
	_NEW_INTEGER_POINTER(n, _5);
	_ADD_DEALLOC(n);
	//ifis %1, null goto blklab9 : null|int
	if(n == NULL) { goto blklab9;}
	//assign %2 = %1  : int
	max = *n;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	index = _9;
	//const %10 = 0 : int
	_10 = 0;
	//arraygen %11 = [10; 2] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY_int64_t(_11, max, _10);
	_ADD_DEALLOC(_11);
	//assign %4 = %11  : int[]
	_DEALLOC(arr);
	_COPY_1DARRAY_int64_t(arr, _11);
	_ADD_DEALLOC(arr);
	//loop (%3, %4, %12, %13, %14)
	while(true){
		//ifge %3, %2 goto blklab10 : int
		if(index>=max){goto blklab10;}
		//sub %12 = %2, %3 : int
		_12=max-index;
		//update %4[%3] = %12 : int[] -> int[]
		arr[index] = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %3, %13 : int
		_14=index+_13;
		//assign %3 = %14  : int
		index = _14;
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//const %16 = 0 : int
	_16 = 0;
	//invoke (%15) = (%4, %16, %2) MergeSort_original:sortV1 : function(int[],int,int)->(int[])
	{
		void* arr_tmp;
		_DEALLOC(_15);
		_15 = _sortV1_(_COPY_1DARRAY_PARAM_int64_t(arr), false, _16, max, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_15));
		_CALLER_DEALLOC(_15, arr, "true-true-false" , "sortV1");
	}
	//assign %4 = %15  : int[]
	_DEALLOC(arr);
	_COPY_1DARRAY_int64_t(arr, _15);
	_ADD_DEALLOC(arr);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = 0 : int
	_19 = 0;
	//indexof %20 = %4, %19 : int[]
	_20=arr[_19];
	//indirectinvoke () = %18 (%20) : method(any)->()
	{
		printf("%"PRId64"\n", _20);
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = 1 : int
	_23 = 1;
	//sub %24 = %2, %23 : int
	_24=max-_23;
	//indexof %25 = %4, %24 : int[]
	_25=arr[_24];
	//indirectinvoke () = %22 (%25) : method(any)->()
	{
		printf("%"PRId64"\n", _25);
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = [80,97,115,115,32,77,101,114,103,101,115,111,114,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_28);
	_NEW_1DARRAY_int64_t(_28, 24, 0);
	_28[0] = 80; _28[1] = 97; _28[2] = 115; _28[3] = 115; _28[4] = 32; _28[5] = 77; _28[6] = 101; _28[7] = 114; _28[8] = 103; _28[9] = 101; _28[10] = 115; _28[11] = 111; _28[12] = 114; _28[13] = 116; _28[14] = 32; _28[15] = 116; _28[16] = 101; _28[17] = 115; _28[18] = 116; _28[19] = 32; _28[20] = 99; _28[21] = 97; _28[22] = 115; _28[23] = 101; 
	_ADD_DEALLOC(_28);
	//indirectinvoke () = %27 (%28) : method(int[])->()
	{
		println_s(_28, _28_size);
	}
//.blklab9
blklab9:;
	//return
	_DEALLOC(n);
	_DEALLOC(arr);
	_DEALLOC(_5);
	_DEALLOC_2DARRAY_int64_t(_6);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_15);
	_DEALLOC(_28);
	exit(0);
}

