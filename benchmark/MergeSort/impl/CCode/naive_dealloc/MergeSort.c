#include "MergeSort.h"
long long* sortV1(long long* items, bool items_has_ownership, long long items_size, long long start, long long end){
	long long pivot = 0;
	long long* lhs = NULL;
	long long lhs_size = 0;
	bool lhs_has_ownership = false;
	long long* rhs = NULL;
	long long rhs_size = 0;
	bool rhs_has_ownership = false;
	long long l = 0;
	long long r = 0;
	long long i = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	bool _15_has_ownership = false;
	long long* _16 = NULL;
	long long _16_size = 0;
	bool _16_has_ownership = false;
	long long* _17 = NULL;
	long long _17_size = 0;
	bool _17_has_ownership = false;
	long long _18 = 0;
	long long* _19 = NULL;
	long long _19_size = 0;
	bool _19_has_ownership = false;
	long long* _20 = NULL;
	long long _20_size = 0;
	bool _20_has_ownership = false;
	long long* _21 = NULL;
	long long _21_size = 0;
	bool _21_has_ownership = false;
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
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	//const %9 = 1 : int
	_9 = 1;
	//add %10 = %1, %9 : int
	_10=start+_9;
	//ifge %10, %2 goto blklab0 : int
	if(_10>=end){goto blklab0;}
	//add %12 = %1, %2 : int
	_12=start+end;
	//const %13 = 2 : int
	_13 = 2;
	//div %14 = %12, %13 : int
	_14=_12/_13;
	//assign %11 = %14  : int
	_11 = _14;
	//assign %3 = %11  : int
	pivot = _11;
	//invoke %16 = (%0, %1, %3) whiley/lang/Array:slice : function(int[],int,int) -> int[]
	if(_16_has_ownership){free(_16); _16_has_ownership = false;}
	_16 = slice(items, items_size, start,pivot);
	_16_size = pivot - start;
	_16_has_ownership = true;
	//assign %15 = %16  : int[]
	_15_size = _16_size; 
	if(_15_has_ownership){free(_15); _15_has_ownership = false;}
	_15 = copy(_16, _16_size);
	_16_has_ownership = true;
	_15_has_ownership = true;
	//assign %4 = %15  : int[]
	lhs_size = _15_size; 
	if(lhs_has_ownership){free(lhs); lhs_has_ownership = false;}
	lhs = copy(_15, _15_size);
	_15_has_ownership = true;
	lhs_has_ownership = true;
	//const %18 = 0 : int
	_18 = 0;
	//invoke %17 = (%4, %18, %3) MergeSort:sortV1 : function(int[],int,int) -> int[]
	if(_17_has_ownership){free(_17); _17_has_ownership = false;}
	_17_size = lhs_size; 	_17 = sortV1(copy(lhs, lhs_size), true, lhs_size, _18, pivot);
	_17_has_ownership = true;
	//assign %4 = %17  : int[]
	lhs_size = _17_size; 
	if(lhs_has_ownership){free(lhs); lhs_has_ownership = false;}
	lhs = copy(_17, _17_size);
	_17_has_ownership = true;
	lhs_has_ownership = true;
	//invoke %20 = (%0, %3, %2) whiley/lang/Array:slice : function(int[],int,int) -> int[]
	if(_20_has_ownership){free(_20); _20_has_ownership = false;}
	_20 = slice(items, items_size, pivot,end);
	_20_size = end - pivot;
	_20_has_ownership = true;
	//assign %19 = %20  : int[]
	_19_size = _20_size; 
	if(_19_has_ownership){free(_19); _19_has_ownership = false;}
	_19 = copy(_20, _20_size);
	_20_has_ownership = true;
	_19_has_ownership = true;
	//assign %5 = %19  : int[]
	rhs_size = _19_size; 
	if(rhs_has_ownership){free(rhs); rhs_has_ownership = false;}
	rhs = copy(_19, _19_size);
	_19_has_ownership = true;
	rhs_has_ownership = true;
	//const %22 = 0 : int
	_22 = 0;
	//sub %23 = %2, %3 : int
	_23=end-pivot;
	//invoke %21 = (%5, %22, %23) MergeSort:sortV1 : function(int[],int,int) -> int[]
	if(_21_has_ownership){free(_21); _21_has_ownership = false;}
	_21_size = rhs_size; 	_21 = sortV1(copy(rhs, rhs_size), true, rhs_size, _22, _23);
	_21_has_ownership = true;
	//assign %5 = %21  : int[]
	rhs_size = _21_size; 
	if(rhs_has_ownership){free(rhs); rhs_has_ownership = false;}
	rhs = copy(_21, _21_size);
	_21_has_ownership = true;
	rhs_has_ownership = true;
	//const %25 = 0 : int
	_25 = 0;
	//assign %24 = %25  : int
	_24 = _25;
	//assign %6 = %24  : int
	l = _24;
	//const %27 = 0 : int
	_27 = 0;
	//assign %26 = %27  : int
	_26 = _27;
	//assign %7 = %26  : int
	r = _26;
	//const %29 = 0 : int
	_29 = 0;
	//assign %28 = %29  : int
	_28 = _29;
	//assign %8 = %28  : int
	i = _28;
	//loop (%0, %6, %7, %8, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44)
	while(true){
		//sub %30 = %2, %1 : int
		_30=end-start;
		//ifge %8, %30 goto blklab1 : int
		if(i>=_30){goto blklab1;}
		//sub %31 = %3, %1 : int
		_31=pivot-start;
		//ifge %6, %31 goto blklab1 : int
		if(l>=_31){goto blklab1;}
		//sub %32 = %2, %3 : int
		_32=end-pivot;
		//ifge %7, %32 goto blklab1 : int
		if(r>=_32){goto blklab1;}
		//indexof %33 = %4, %6 : int[]
		_33=lhs[l];
		//indexof %34 = %5, %7 : int[]
		_34=rhs[r];
		//ifgt %33, %34 goto blklab2 : int
		if(_33>_34){goto blklab2;}
		//indexof %35 = %4, %6 : int[]
		_35=lhs[l];
		//indexof %36 = %4, %6 : int[]
		_36=lhs[l];
		//update %0[%8] = %36 : int[] -> int[]
		items[i] = _36;
		//const %37 = 1 : int
		_37 = 1;
		//add %38 = %6, %37 : int
		_38=l+_37;
		//assign %6 = %38  : int
		l = _38;
		//goto blklab3
		goto blklab3;
//.blklab2
blklab2:;
		//indexof %39 = %5, %7 : int[]
		_39=rhs[r];
		//indexof %40 = %5, %7 : int[]
		_40=rhs[r];
		//update %0[%8] = %40 : int[] -> int[]
		items[i] = _40;
		//const %41 = 1 : int
		_41 = 1;
		//add %42 = %7, %41 : int
		_42=r+_41;
		//assign %7 = %42  : int
		r = _42;
//.blklab3
blklab3:;
		//const %43 = 1 : int
		_43 = 1;
		//add %44 = %8, %43 : int
		_44=i+_43;
		//assign %8 = %44  : int
		i = _44;
	}
//.blklab1
blklab1:;
	//loop (%0, %6, %8, %45, %46, %47, %48, %49, %50, %51)
	while(true){
		//sub %45 = %3, %1 : int
		_45=pivot-start;
		//ifge %6, %45 goto blklab4 : int
		if(l>=_45){goto blklab4;}
		//indexof %46 = %4, %6 : int[]
		_46=lhs[l];
		//indexof %47 = %4, %6 : int[]
		_47=lhs[l];
		//update %0[%8] = %47 : int[] -> int[]
		items[i] = _47;
		//const %48 = 1 : int
		_48 = 1;
		//add %49 = %8, %48 : int
		_49=i+_48;
		//assign %8 = %49  : int
		i = _49;
		//const %50 = 1 : int
		_50 = 1;
		//add %51 = %6, %50 : int
		_51=l+_50;
		//assign %6 = %51  : int
		l = _51;
	}
//.blklab4
blklab4:;
	//loop (%0, %7, %8, %52, %53, %54, %55, %56, %57, %58)
	while(true){
		//sub %52 = %2, %3 : int
		_52=end-pivot;
		//ifge %7, %52 goto blklab5 : int
		if(r>=_52){goto blklab5;}
		//indexof %53 = %5, %7 : int[]
		_53=rhs[r];
		//indexof %54 = %5, %7 : int[]
		_54=rhs[r];
		//update %0[%8] = %54 : int[] -> int[]
		items[i] = _54;
		//const %55 = 1 : int
		_55 = 1;
		//add %56 = %8, %55 : int
		_56=i+_55;
		//assign %8 = %56  : int
		i = _56;
		//const %57 = 1 : int
		_57 = 1;
		//add %58 = %7, %57 : int
		_58=r+_57;
		//assign %7 = %58  : int
		r = _58;
	}
//.blklab5
blklab5:;
//.blklab0
blklab0:;
	//return %0 : int[]
	if(_16_has_ownership){free(_16); _16_has_ownership = false;}
	if(_17_has_ownership){free(_17); _17_has_ownership = false;}
	if(_19_has_ownership){free(_19); _19_has_ownership = false;}
	if(lhs_has_ownership){free(lhs); lhs_has_ownership = false;}
	if(_20_has_ownership){free(_20); _20_has_ownership = false;}
	if(rhs_has_ownership){free(rhs); rhs_has_ownership = false;}
	if(_21_has_ownership){free(_21); _21_has_ownership = false;}
	if(_15_has_ownership){free(_15); _15_has_ownership = false;}
	return items;
	//return
}

int main(int argc, char** args){
	union UNION max;
	long long index = 0;
	long long* arr = NULL;
	long long arr_size = 0;
	bool arr_has_ownership = false;
	union UNION _4;
	union UNION _5;
	long long** _6 = NULL;
	long long _6_size = 0;
	long long _6_size_size = 0;
	bool _6_has_ownership = false;
	long long _7 = 0;
	long long* _8 = NULL;
	long long _8_size = 0;
	bool _8_has_ownership = false;
	long long _9 = 0;
	long long _10 = 0;
	long long* _11 = NULL;
	long long _11_size = 0;
	bool _11_has_ownership = false;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	bool _15_has_ownership = false;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long* _20 = NULL;
	long long _20_size = 0;
	bool _20_has_ownership = false;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	void* _28;
	
	long long* _30 = NULL;
	long long _30_size = 0;
	bool _30_has_ownership = false;
	void* _31;
	
	//fieldload %6 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_6 = convertArgsToIntArray(argc, args);
	_6_size = argc - 1;
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	//invoke %5 = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_5 = parseInteger(_8);
	//assign %4 = %5  : null|int
	_4 = _5;
	//assign %1 = %4  : null|int
	max = _4;
	//ifis %1, null goto blklab6 : null|int
	if(max.null == NULL) { goto blklab6;}
	//const %10 = 0 : int
	_10 = 0;
	//assign %9 = %10  : int
	_9 = _10;
	//assign %2 = %9  : int
	index = _9;
	//const %12 = 0 : int
	_12 = 0;
	//const %13 = 1 : int
	_13 = 1;
	//add %14 = %1, %13 : int
	_14=max.integer+_13;
	//listgen %15 = [12; 14] : int[]
	_15_size = _14;
	if(_15_has_ownership){free(_15); _15_has_ownership = false;}
	_15 = gen1DArray(_12, _15_size);
	_15_has_ownership = true;
	//assign %11 = %15  : int[]
	_11_size = _15_size; 
	if(_11_has_ownership){free(_11); _11_has_ownership = false;}
	_11 = copy(_15, _15_size);
	_15_has_ownership = true;
	_11_has_ownership = true;
	//assign %3 = %11  : int[]
	arr_size = _11_size; 
	if(arr_has_ownership){free(arr); arr_has_ownership = false;}
	arr = copy(_11, _11_size);
	_11_has_ownership = true;
	arr_has_ownership = true;
	//loop (%2, %3, %16, %17, %18, %19)
	while(true){
		//ifgt %2, %1 goto blklab7 : int
		if(index>max.integer){goto blklab7;}
		//sub %16 = %1, %2 : int
		_16=max.integer-index;
		//sub %17 = %1, %2 : int
		_17=max.integer-index;
		//update %3[%2] = %17 : int[] -> int[]
		arr[index] = _17;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %2, %18 : int
		_19=index+_18;
		//assign %2 = %19  : int
		index = _19;
	}
//.blklab7
blklab7:;
	//const %21 = 0 : int
	_21 = 0;
	//const %22 = 1 : int
	_22 = 1;
	//add %23 = %1, %22 : int
	_23=max.integer+_22;
	//invoke %20 = (%3, %21, %23) MergeSort:sortV1 : function(int[],int,int) -> int[]
	if(_20_has_ownership){free(_20); _20_has_ownership = false;}
	_20_size = arr_size; 	_20 = sortV1(copy(arr, arr_size), true, arr_size, _21, _23);
	_20_has_ownership = true;
	//assign %3 = %20  : int[]
	arr_size = _20_size; 
	if(arr_has_ownership){free(arr); arr_has_ownership = false;}
	arr = copy(_20, _20_size);
	_20_has_ownership = true;
	arr_has_ownership = true;
	//assert
	{
		//const %24 = 0 : int
		_24 = 0;
		//indexof %25 = %3, %24 : int[]
		_25=arr[_24];
		//const %26 = 0 : int
		_26 = 0;
		//ifeq %25, %26 goto blklab8 : int
		if(_25==_26){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//assert
	{
		//indexof %27 = %3, %1 : int[]
		_27=arr[max.integer];
		//ifeq %27, %1 goto blklab9 : int
		if(_27==max.integer){goto blklab9;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab9
blklab9:;
	//assert
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %29 = %28 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %30 = [80,97,115,115,32,77,101,114,103,101,83,111,114,116,32,116,101,115,116,32,99,97,115,101,32,119,105,116,104,32,105,110,112,117,116,32,61,32] : int[]
	_30_size = 38;
	if(_30_has_ownership){free(_30); _30_has_ownership = false;}
	_30=(long long*)malloc(38*sizeof(long long));
	_30[0] = 80; _30[1] = 97; _30[2] = 115; _30[3] = 115; _30[4] = 32; _30[5] = 77; _30[6] = 101; _30[7] = 114; _30[8] = 103; _30[9] = 101; _30[10] = 83; _30[11] = 111; _30[12] = 114; _30[13] = 116; _30[14] = 32; _30[15] = 116; _30[16] = 101; _30[17] = 115; _30[18] = 116; _30[19] = 32; _30[20] = 99; _30[21] = 97; _30[22] = 115; _30[23] = 101; _30[24] = 32; _30[25] = 119; _30[26] = 105; _30[27] = 116; _30[28] = 104; _30[29] = 32; _30[30] = 105; _30[31] = 110; _30[32] = 112; _30[33] = 117; _30[34] = 116; _30[35] = 32; _30[36] = 61; _30[37] = 32; 
	_30_has_ownership = true;
	//indirectinvoke %29 (%30) : method(int[]) -> void
	printf_s(_30, _30_size);
	//fieldload %31 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %32 = %31 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//indirectinvoke %32 (%1) : method(any) -> void
	printf("%d\n", max.integer);
//.blklab6
blklab6:;
	//return
	if(arr_has_ownership){free(arr); arr_has_ownership = false;}
	if(_20_has_ownership){free(_20); _20_has_ownership = false;}
	if(_6_has_ownership){free2DArray(_6, _6_size); _6_has_ownership = false;}
	if(_11_has_ownership){free(_11); _11_has_ownership = false;}
	if(_30_has_ownership){free(_30); _30_has_ownership = false;}
	if(_15_has_ownership){free(_15); _15_has_ownership = false;}
	exit(0);
}

