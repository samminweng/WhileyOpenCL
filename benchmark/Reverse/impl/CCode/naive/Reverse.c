#include "Reverse.h"
long long* reverse(long long* ls, long long ls_size){
	long long i = 0;
	long long* r = NULL;
	long long r_size = 0;
	
	long long item = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long* _6 = NULL;
	long long _6_size = 0;
	
	long long _7 = 0;
	long long _8 = 0;
	long long* _9 = NULL;
	long long _9_size = 0;
	
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	//lengthof %5 = %0 : int[]
	_5 = ls_size;
	//assign %4 = %5  : int
	_4 = _5;
	//assign %1 = %4  : int
	i = _4;
	//const %7 = 0 : int
	_7 = 0;
	//lengthof %8 = %0 : int[]
	_8 = ls_size;
	//listgen %9 = [7; 8] : int[]
	_9_size = _8;
	_9 = gen1DArray(_7, _9_size);
	//assign %6 = %9  : int[]
	_6_size = _9_size; 
	_6 = copy(_9, _9_size);
	//assign %2 = %6  : int[]
	r_size = _6_size; 
	r = copy(_6, _6_size);
	//loop (%1, %2, %3, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19)
	while(true){
		//invariant
		{
			//lengthof %10 = %0 : int[]
			_10 = ls_size;
			//ifgt %1, %10 goto blklab2 : int
			if(i>_10){goto blklab2;}
			//lengthof %11 = %2 : int[]
			_11 = r_size;
			//lengthof %12 = %0 : int[]
			_12 = ls_size;
			//ifeq %11, %12 goto blklab1 : int
			if(_11==_12){goto blklab1;}
//.blklab2
blklab2:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab1
blklab1:;
			//return
		//invariant
		}
		//const %13 = 0 : int
		_13 = 0;
		//ifle %1, %13 goto blklab0 : int
		if(i<=_13){goto blklab0;}
		//lengthof %15 = %0 : int[]
		_15 = ls_size;
		//sub %16 = %15, %1 : int
		_16=_15-i;
		//indexof %17 = %0, %16 : int[]
		_17=ls[_16];
		//assign %14 = %17  : int
		_14 = _17;
		//assign %3 = %14  : int
		item = _14;
		//const %18 = 1 : int
		_18 = 1;
		//sub %19 = %1, %18 : int
		_19=i-_18;
		//assign %1 = %19  : int
		i = _19;
		//update %2[%1] = %3 : int[] -> int[]
		r[i] = item;
	}
//.blklab0
blklab0:;
	//return %2 : int[]
	return r;
	//return
}

int main(int argc, char** args){
	union UNION max;
	long long index = 0;
	long long* arr = NULL;
	long long arr_size = 0;
	
	union UNION _4;
	union UNION _5;
	long long** _6 = NULL;
	long long _6_size = 0;
	long long _6_size_size = 0;
	
	long long _7 = 0;
	long long* _8 = NULL;
	long long _8_size = 0;
	
	long long _9 = 0;
	long long _10 = 0;
	long long* _11 = NULL;
	long long _11_size = 0;
	
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long* _20 = NULL;
	long long _20_size = 0;
	
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	void* _25;
	
	long long* _27 = NULL;
	long long _27_size = 0;
	
	void* _28;
	
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
	//ifis %1, null goto blklab3 : null|int
	if(max.null == NULL) { goto blklab3;}
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
	_15 = gen1DArray(_12, _15_size);
	//assign %11 = %15  : int[]
	_11_size = _15_size; 
	_11 = copy(_15, _15_size);
	//assign %3 = %11  : int[]
	arr_size = _11_size; 
	arr = copy(_11, _11_size);
	//loop (%2, %3, %16, %17, %18, %19)
	while(true){
		//ifgt %2, %1 goto blklab4 : int
		if(index>max.integer){goto blklab4;}
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
//.blklab4
blklab4:;
	//invoke %20 = (%3) Reverse:reverse : function(int[]) -> int[]
	_20_size = arr_size; 	_20 = reverse(copy(arr, arr_size), arr_size);
	//assign %3 = %20  : int[]
	arr_size = _20_size; 
	arr = copy(_20, _20_size);
	//assert
	{
		//const %21 = 0 : int
		_21 = 0;
		//indexof %22 = %3, %21 : int[]
		_22=arr[_21];
		//const %23 = 0 : int
		_23 = 0;
		//ifeq %22, %23 goto blklab5 : int
		if(_22==_23){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//assert
	{
		//indexof %24 = %3, %1 : int[]
		_24=arr[max.integer];
		//ifeq %24, %1 goto blklab6 : int
		if(_24==max.integer){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %26 = %25 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %27 = [80,97,115,115,32,82,101,118,101,114,115,101,32,116,101,115,116,32,99,97,115,101,32,119,105,116,104,32,105,110,112,117,116,32,61,32] : int[]
	_27_size = 36;
	_27=(long long*)malloc(36*sizeof(long long));
	_27[0] = 80; _27[1] = 97; _27[2] = 115; _27[3] = 115; _27[4] = 32; _27[5] = 82; _27[6] = 101; _27[7] = 118; _27[8] = 101; _27[9] = 114; _27[10] = 115; _27[11] = 101; _27[12] = 32; _27[13] = 116; _27[14] = 101; _27[15] = 115; _27[16] = 116; _27[17] = 32; _27[18] = 99; _27[19] = 97; _27[20] = 115; _27[21] = 101; _27[22] = 32; _27[23] = 119; _27[24] = 105; _27[25] = 116; _27[26] = 104; _27[27] = 32; _27[28] = 105; _27[29] = 110; _27[30] = 112; _27[31] = 117; _27[32] = 116; _27[33] = 32; _27[34] = 61; _27[35] = 32; 
	//indirectinvoke %26 (%27) : method(int[]) -> void
	printf_s(_27, _27_size);
	//fieldload %28 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %29 = %28 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//indirectinvoke %29 (%1) : method(any) -> void
	printf("%d\n", max.integer);
//.blklab3
blklab3:;
	//return
	exit(0);
}

