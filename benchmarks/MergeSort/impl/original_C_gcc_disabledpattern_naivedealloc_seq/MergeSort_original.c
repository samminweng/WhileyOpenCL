#include "MergeSort_original.h"
int64_t* _sortV1_(_DECL_1DARRAY_PARAM(items), _DECL_DEALLOC_PARAM(items), int64_t start, int64_t end, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t pivot;
	_DECL_1DARRAY(lhs);
	_DECL_DEALLOC(lhs);
	_DECL_1DARRAY(rhs);
	_DECL_DEALLOC(rhs);
	int64_t l;
	int64_t r;
	int64_t i;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	int64_t _17;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	int64_t _39;
	int64_t _40;
	int64_t _41;
	int64_t _42;
	int64_t _43;
	int64_t _44;
	int64_t _45;
	int64_t _46;
	int64_t _47;
	int64_t _48;
	int64_t _49;
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
		void* tmp_lhs_0;
		_COPY_1DARRAY_PARAM(lhs, tmp_lhs_0, int64_t);
		_DEALLOC(_16);
		_16 = _sortV1_(tmp_lhs_0, lhs_size, false, _17, pivot, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
		_CALLER_DEALLOC(lhs, "true-true-false" , "sortV1");
		_CALLER_DEALLOC_POST(_16, tmp_lhs_0);
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
		void* tmp_rhs_0;
		_COPY_1DARRAY_PARAM(rhs, tmp_rhs_0, int64_t);
		_DEALLOC(_19);
		_19 = _sortV1_(tmp_rhs_0, rhs_size, false, _20, _21, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
		_CALLER_DEALLOC(rhs, "true-true-false" , "sortV1");
		_CALLER_DEALLOC_POST(_19, tmp_rhs_0);
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
	int64_t max;
	int64_t repeats;
	int64_t size;
	int64_t index;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	int64_t* _7;
	_DECL_DEALLOC(_7);
	_DECL_2DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	int64_t _16;
	int64_t _17;
	int64_t _18;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	int64_t _20;
	void* _21;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	void* _28;
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	void* _31;
	void* _33;
	_DECL_1DARRAY(_35);
	_DECL_DEALLOC(_35);
	//fieldload %8 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_8);
	_CONV_ARGS(_8);
	_ADD_DEALLOC(_8);
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	_10_size = _8_size_size;
	_REMOVE_DEALLOC(_10);
	//invoke (%7) = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_7, _10);
		_ADD_DEALLOC(_7);
		_REMOVE_DEALLOC(_10);
	}
	//assign %1 = %7  : null|int
	_DEALLOC(n);
	_NEW_INTEGER_POINTER(n, _7);
	_ADD_DEALLOC(n);
	//ifis %1, null goto blklab9 : null|int
	if(n == NULL) { goto blklab9;}
	//assign %2 = %1  : int
	max = *n;
	//const %11 = 0 : int
	_11 = 0;
	//assign %3 = %11  : int
	repeats = _11;
	//loop (%3, %4, %5, %6, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
	while(true){
		//ifge %3, %2 goto blklab10 : int
		if(repeats>=max){goto blklab10;}
		//const %12 = 10000 : int
		_12 = 10000;
		//assign %4 = %12  : int
		size = _12;
		//const %13 = 0 : int
		_13 = 0;
		//assign %5 = %13  : int
		index = _13;
		//const %14 = 0 : int
		_14 = 0;
		//arraygen %15 = [14; 4] : int[]
		_DEALLOC(_15);
		_NEW_1DARRAY_int64_t(_15, size, _14);
		_ADD_DEALLOC(_15);
		//assign %6 = %15  : int[]
		_DEALLOC(arr);
		_COPY_1DARRAY_int64_t(arr, _15);
		_ADD_DEALLOC(arr);
		//loop (%5, %6, %16, %17, %18)
		while(true){
			//ifge %5, %4 goto blklab12 : int
			if(index>=size){goto blklab12;}
			//sub %16 = %4, %5 : int
			_16=size-index;
			//update %6[%5] = %16 : int[] -> int[]
			arr[index] = _16;
			//const %17 = 1 : int
			_17 = 1;
			//add %18 = %5, %17 : int
			_18=index+_17;
			//assign %5 = %18  : int
			index = _18;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %20 = 0 : int
		_20 = 0;
		//invoke (%19) = (%6, %20, %2) MergeSort_original:sortV1 : function(int[],int,int)->(int[])
		{
			void* tmp_arr_0;
			_COPY_1DARRAY_PARAM(arr, tmp_arr_0, int64_t);
			_DEALLOC(_19);
			_19 = _sortV1_(tmp_arr_0, arr_size, false, _20, max, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
			_CALLER_DEALLOC(arr, "true-true-false" , "sortV1");
			_CALLER_DEALLOC_POST(_19, tmp_arr_0);
		}
		//assign %6 = %19  : int[]
		_DEALLOC(arr);
		_COPY_1DARRAY_int64_t(arr, _19);
		_ADD_DEALLOC(arr);
		//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %22 = %21 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %23 = 1 : int
		_23 = 1;
		//sub %24 = %2, %23 : int
		_24=max-_23;
		//indexof %25 = %6, %24 : int[]
		_25=arr[_24];
		//indirectinvoke () = %22 (%25) : method(any)->()
		{
			printf("%"PRId64"\n", _25);
		}
		//const %26 = 1 : int
		_26 = 1;
		//add %27 = %3, %26 : int
		_27=repeats+_26;
		//assign %3 = %27  : int
		repeats = _27;
		//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %30 = [78,117,109,98,101,114,32,111,102,32,114,101,112,101,97,116,115,32] : int[]
		_DEALLOC(_30);
		_NEW_1DARRAY_int64_t(_30, 18, 0);
		_30[0] = 78; _30[1] = 117; _30[2] = 109; _30[3] = 98; _30[4] = 101; _30[5] = 114; _30[6] = 32; _30[7] = 111; _30[8] = 102; _30[9] = 32; _30[10] = 114; _30[11] = 101; _30[12] = 112; _30[13] = 101; _30[14] = 97; _30[15] = 116; _30[16] = 115; _30[17] = 32; 
		_ADD_DEALLOC(_30);
		//indirectinvoke () = %29 (%30) : method(int[])->()
		{
			printf_s(_30, _30_size);
		}
		//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %32 = %31 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %32 (%3) : method(any)->()
		{
			printf("%"PRId64"\n", repeats);
		}
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %34 = %33 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %35 = [80,97,115,115,32,77,101,114,103,101,115,111,114,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_35);
	_NEW_1DARRAY_int64_t(_35, 24, 0);
	_35[0] = 80; _35[1] = 97; _35[2] = 115; _35[3] = 115; _35[4] = 32; _35[5] = 77; _35[6] = 101; _35[7] = 114; _35[8] = 103; _35[9] = 101; _35[10] = 115; _35[11] = 111; _35[12] = 114; _35[13] = 116; _35[14] = 32; _35[15] = 116; _35[16] = 101; _35[17] = 115; _35[18] = 116; _35[19] = 32; _35[20] = 99; _35[21] = 97; _35[22] = 115; _35[23] = 101; 
	_ADD_DEALLOC(_35);
	//indirectinvoke () = %34 (%35) : method(int[])->()
	{
		println_s(_35, _35_size);
	}
//.blklab9
blklab9:;
	//return
	_DEALLOC(n);
	_DEALLOC(arr);
	_DEALLOC(_7);
	_FREE_ARGS(_8);
	_DEALLOC(_10);
	_DEALLOC(_15);
	_DEALLOC(_19);
	_DEALLOC(_30);
	_DEALLOC(_35);
	exit(0);
}

