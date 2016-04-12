#include "mergesort.h"
long long* sortV1(_DECL_1DARRAY_PARAM(items), long long start, long long end){
	_DECL_1DARRAY(_3);
	long long pivot = 0;
	_DECL_1DARRAY(lhs);
	_DECL_1DARRAY(rhs);
	long long l = 0;
	long long r = 0;
	long long i = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_1DARRAY(_16);
	long long _17 = 0;
	_DECL_1DARRAY(_18);
	_DECL_1DARRAY(_19);
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
_SLICE_ARRAY(_15, items, start, pivot);
	//assign %5 = %15  : int[]
	_1DARRAY_COPY(lhs, _15);
	//const %17 = 0 : int
	_17 = 0;
	//invoke (%16) = (%5, %17, %4) mergesort:sortV1 : function(int[],int,int)->(int[])
	_1DARRAY_SIZE(_16, lhs);
	_16 = sortV1(_1DARRAY_COPY_PARAM(lhs), _17, pivot);
	//assign %5 = %16  : int[]
	_1DARRAY_COPY(lhs, _16);
	//invoke (%18) = (%0, %4, %2) whiley/lang/Array:slice : function(int[],int,int)->(int[])
_SLICE_ARRAY(_18, items, pivot, end);
	//assign %6 = %18  : int[]
	_1DARRAY_COPY(rhs, _18);
	//const %20 = 0 : int
	_20 = 0;
	//sub %21 = %2, %4 : int
	_21=end-pivot;
	//invoke (%19) = (%6, %20, %21) mergesort:sortV1 : function(int[],int,int)->(int[])
	_1DARRAY_SIZE(_19, rhs);
	_19 = sortV1(_1DARRAY_COPY_PARAM(rhs), _20, _21);
	//assign %6 = %19  : int[]
	_1DARRAY_COPY(rhs, _19);
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
	return items;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(ys);
	long long max = 0;
	long long index = 0;
	_DECL_1DARRAY(arr);
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_1DARRAY(_11);
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	_DECL_1DARRAY(_19);
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	_DECL_1DARRAY(_24);
	_DECL_1DARRAY(_25);
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	_DECL_1DARRAY(_32);
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	_DECL_1DARRAY(_37);
	_DECL_1DARRAY(_38);
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	_DECL_1DARRAY(_45);
	long long _46 = 0;
	long long _47 = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	_DECL_1DARRAY(_51);
	_DECL_1DARRAY(_52);
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	long long _59 = 0;
	_DECL_1DARRAY(_60);
	long long _61 = 0;
	long long _62 = 0;
	long long _63 = 0;
	long long _64 = 0;
	long long _65 = 0;
	_DECL_1DARRAY(_66);
	long long _67 = 0;
	long long _68 = 0;
	long long _69 = 0;
	_DECL_1DARRAY(_70);
	long long _71 = 0;
	long long _72 = 0;
	long long _73 = 0;
	long long _74 = 0;
	long long _75 = 0;
	long long _76 = 0;
	long long _77 = 0;
	long long _78 = 0;
	long long _79 = 0;
	long long _80 = 0;
	long long _81 = 0;
	long long _82 = 0;
	long long _83 = 0;
	long long _84 = 0;
	_DECL_1DARRAY(_85);
	void* _86;
	_DECL_1DARRAY(_88);
	//const %5 = 3 : int
	_5 = 3;
	//const %6 = 4 : int
	_6 = 4;
	//const %7 = 7 : int
	_7 = 7;
	//const %8 = 1 : int
	_8 = 1;
	//const %9 = 2 : int
	_9 = 2;
	//newlist %10 = (%5, %6, %7, %8, %9) : int[]
	_NEW_ARRAY(_10, 5);
	_10[0] = _5; _10[1] = _6; _10[2] = _7; _10[3] = _8; _10[4] = _9; 
	//assign %1 = %10  : int[]
	_1DARRAY_COPY(ys, _10);
	//const %12 = 0 : int
	_12 = 0;
	//const %13 = 5 : int
	_13 = 5;
	//invoke (%11) = (%1, %12, %13) mergesort:sortV1 : function(int[],int,int)->(int[])
	_1DARRAY_SIZE(_11, ys);
	_11 = sortV1(_1DARRAY_COPY_PARAM(ys), _12, _13);
	//assign %1 = %11  : int[]
	_1DARRAY_COPY(ys, _11);
	//assert
	{
		//const %14 = 1 : int
		_14 = 1;
		//const %15 = 2 : int
		_15 = 2;
		//const %16 = 3 : int
		_16 = 3;
		//const %17 = 4 : int
		_17 = 4;
		//const %18 = 7 : int
		_18 = 7;
		//newlist %19 = (%14, %15, %16, %17, %18) : int[]
		_NEW_ARRAY(_19, 5);
		_19[0] = _14; _19[1] = _15; _19[2] = _16; _19[3] = _17; _19[4] = _18; 
		//ifeq %1, %19 goto blklab9 : int[]
		_IFEQ_ARRAY(ys, _19, blklab9);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab9
blklab9:;
	//assert
	}
	//const %20 = 3 : int
	_20 = 3;
	//const %21 = 4 : int
	_21 = 4;
	//const %22 = 7 : int
	_22 = 7;
	//const %23 = 2 : int
	_23 = 2;
	//newlist %24 = (%20, %21, %22, %23) : int[]
	_NEW_ARRAY(_24, 4);
	_24[0] = _20; _24[1] = _21; _24[2] = _22; _24[3] = _23; 
	//assign %1 = %24  : int[]
	_1DARRAY_COPY(ys, _24);
	//const %26 = 0 : int
	_26 = 0;
	//const %27 = 4 : int
	_27 = 4;
	//invoke (%25) = (%1, %26, %27) mergesort:sortV1 : function(int[],int,int)->(int[])
	_1DARRAY_SIZE(_25, ys);
	_25 = sortV1(_1DARRAY_COPY_PARAM(ys), _26, _27);
	//assign %1 = %25  : int[]
	_1DARRAY_COPY(ys, _25);
	//assert
	{
		//const %28 = 2 : int
		_28 = 2;
		//const %29 = 3 : int
		_29 = 3;
		//const %30 = 4 : int
		_30 = 4;
		//const %31 = 7 : int
		_31 = 7;
		//newlist %32 = (%28, %29, %30, %31) : int[]
		_NEW_ARRAY(_32, 4);
		_32[0] = _28; _32[1] = _29; _32[2] = _30; _32[3] = _31; 
		//ifeq %1, %32 goto blklab10 : int[]
		_IFEQ_ARRAY(ys, _32, blklab10);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab10
blklab10:;
	//assert
	}
	//const %33 = 1 : int
	_33 = 1;
	//const %34 = 2 : int
	_34 = 2;
	//const %35 = 3 : int
	_35 = 3;
	//const %36 = 4 : int
	_36 = 4;
	//newlist %37 = (%33, %34, %35, %36) : int[]
	_NEW_ARRAY(_37, 4);
	_37[0] = _33; _37[1] = _34; _37[2] = _35; _37[3] = _36; 
	//assign %1 = %37  : int[]
	_1DARRAY_COPY(ys, _37);
	//const %39 = 0 : int
	_39 = 0;
	//const %40 = 4 : int
	_40 = 4;
	//invoke (%38) = (%1, %39, %40) mergesort:sortV1 : function(int[],int,int)->(int[])
	_1DARRAY_SIZE(_38, ys);
	_38 = sortV1(_1DARRAY_COPY_PARAM(ys), _39, _40);
	//assign %1 = %38  : int[]
	_1DARRAY_COPY(ys, _38);
	//assert
	{
		//const %41 = 1 : int
		_41 = 1;
		//const %42 = 2 : int
		_42 = 2;
		//const %43 = 3 : int
		_43 = 3;
		//const %44 = 4 : int
		_44 = 4;
		//newlist %45 = (%41, %42, %43, %44) : int[]
		_NEW_ARRAY(_45, 4);
		_45[0] = _41; _45[1] = _42; _45[2] = _43; _45[3] = _44; 
		//ifeq %1, %45 goto blklab11 : int[]
		_IFEQ_ARRAY(ys, _45, blklab11);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//const %46 = 1 : int
	_46 = 1;
	//const %47 = 2 : int
	_47 = 2;
	//const %48 = 3 : int
	_48 = 3;
	//const %49 = 4 : int
	_49 = 4;
	//const %50 = 5 : int
	_50 = 5;
	//newlist %51 = (%46, %47, %48, %49, %50) : int[]
	_NEW_ARRAY(_51, 5);
	_51[0] = _46; _51[1] = _47; _51[2] = _48; _51[3] = _49; _51[4] = _50; 
	//assign %1 = %51  : int[]
	_1DARRAY_COPY(ys, _51);
	//const %53 = 0 : int
	_53 = 0;
	//const %54 = 5 : int
	_54 = 5;
	//invoke (%52) = (%1, %53, %54) mergesort:sortV1 : function(int[],int,int)->(int[])
	_1DARRAY_SIZE(_52, ys);
	_52 = sortV1(_1DARRAY_COPY_PARAM(ys), _53, _54);
	//assign %1 = %52  : int[]
	_1DARRAY_COPY(ys, _52);
	//assert
	{
		//const %55 = 1 : int
		_55 = 1;
		//const %56 = 2 : int
		_56 = 2;
		//const %57 = 3 : int
		_57 = 3;
		//const %58 = 4 : int
		_58 = 4;
		//const %59 = 5 : int
		_59 = 5;
		//newlist %60 = (%55, %56, %57, %58, %59) : int[]
		_NEW_ARRAY(_60, 5);
		_60[0] = _55; _60[1] = _56; _60[2] = _57; _60[3] = _58; _60[4] = _59; 
		//ifeq %1, %60 goto blklab12 : int[]
		_IFEQ_ARRAY(ys, _60, blklab12);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab12
blklab12:;
	//assert
	}
	//const %61 = 10 : int
	_61 = 10;
	//assign %2 = %61  : int
	max = _61;
	//const %62 = 0 : int
	_62 = 0;
	//assign %3 = %62  : int
	index = _62;
	//const %63 = 0 : int
	_63 = 0;
	//const %64 = 1 : int
	_64 = 1;
	//add %65 = %2, %64 : int
	_65=max+_64;
	//arraygen %66 = [63; 65] : int[]
	_GEN_1DARRAY(_66, _65, _63);
	//assign %4 = %66  : int[]
	_1DARRAY_COPY(arr, _66);
	//loop (%3, %4, %67, %68, %69)
	while(true){
		//ifgt %3, %2 goto blklab13 : int
		if(index>max){goto blklab13;}
		//sub %67 = %2, %3 : int
		_67=max-index;
		//update %4[%3] = %67 : int[] -> int[]
		arr[index] = _67;
		//const %68 = 1 : int
		_68 = 1;
		//add %69 = %3, %68 : int
		_69=index+_68;
		//assign %3 = %69  : int
		index = _69;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//const %71 = 0 : int
	_71 = 0;
	//const %72 = 1 : int
	_72 = 1;
	//add %73 = %2, %72 : int
	_73=max+_72;
	//invoke (%70) = (%4, %71, %73) mergesort:sortV1 : function(int[],int,int)->(int[])
	_1DARRAY_SIZE(_70, arr);
	_70 = sortV1(_1DARRAY_COPY_PARAM(arr), _71, _73);
	//assign %4 = %70  : int[]
	_1DARRAY_COPY(arr, _70);
	//assert
	{
		//const %74 = 0 : int
		_74 = 0;
		//const %75 = 1 : int
		_75 = 1;
		//const %76 = 2 : int
		_76 = 2;
		//const %77 = 3 : int
		_77 = 3;
		//const %78 = 4 : int
		_78 = 4;
		//const %79 = 5 : int
		_79 = 5;
		//const %80 = 6 : int
		_80 = 6;
		//const %81 = 7 : int
		_81 = 7;
		//const %82 = 8 : int
		_82 = 8;
		//const %83 = 9 : int
		_83 = 9;
		//const %84 = 10 : int
		_84 = 10;
		//newlist %85 = (%74, %75, %76, %77, %78, %79, %80, %81, %82, %83, %84) : int[]
		_NEW_ARRAY(_85, 11);
		_85[0] = _74; _85[1] = _75; _85[2] = _76; _85[3] = _77; _85[4] = _78; _85[5] = _79; _85[6] = _80; _85[7] = _81; _85[8] = _82; _85[9] = _83; _85[10] = _84; 
		//ifeq %4, %85 goto blklab15 : int[]
		_IFEQ_ARRAY(arr, _85, blklab15);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab15
blklab15:;
	//assert
	}
	//fieldload %86 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %87 = %86 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %88 = [80,97,115,115,32,109,101,114,103,101,115,111,114,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_ARRAY(_88, 24);
	_88[0] = 80; _88[1] = 97; _88[2] = 115; _88[3] = 115; _88[4] = 32; _88[5] = 109; _88[6] = 101; _88[7] = 114; _88[8] = 103; _88[9] = 101; _88[10] = 115; _88[11] = 111; _88[12] = 114; _88[13] = 116; _88[14] = 32; _88[15] = 116; _88[16] = 101; _88[17] = 115; _88[18] = 116; _88[19] = 32; _88[20] = 99; _88[21] = 97; _88[22] = 115; _88[23] = 101; 
	//indirectinvoke () = %87 (%88) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_88));
	//return
	exit(0);
}

