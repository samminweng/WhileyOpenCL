#include "Reverse_original.h"
long long* reverse(_DECL_1DARRAY_PARAM(ls)){
	_DECL_1DARRAY(_1);
	long long i = 0;
	_DECL_1DARRAY(r);
	long long item = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
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
	_NEW_1DARRAY(_8, _7, _6);
	//assign %3 = %8  : int[]
	_COPY_1DARRAY(r, _8);
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
	return r;
	//return
}

int main(int argc, char** args){
	long long* n;
	long long max = 0;
	long long index = 0;
	_DECL_1DARRAY(arr);
	long long* _5;
	_DECL_2DARRAY(_6);
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	_DECL_1DARRAY(_13);
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	_DECL_1DARRAY(_17);
	void* _18;
	long long _20 = 0;
	long long _21 = 0;
	void* _22;
	long long _24 = 0;
	void* _25;
	_DECL_1DARRAY(_27);
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_5, _8);
	//assign %1 = %5  : null|int
	n = _5;
	//ifis %1, null goto blklab4 : null|int
	if(n == NULL) { goto blklab4;}
	//assign %2 = %1  : int
	max = *n;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	index = _9;
	//const %10 = 0 : int
	_10 = 0;
	//const %11 = 1 : int
	_11 = 1;
	//add %12 = %2, %11 : int
	_12=max+_11;
	//arraygen %13 = [10; 12] : int[]
	_NEW_1DARRAY(_13, _12, _10);
	//assign %4 = %13  : int[]
	_COPY_1DARRAY(arr, _13);
	//loop (%3, %4, %14, %15, %16)
	while(true){
		//ifgt %3, %2 goto blklab5 : int
		if(index>max){goto blklab5;}
		//sub %14 = %2, %3 : int
		_14=max-index;
		//update %4[%3] = %14 : int[] -> int[]
		arr[index] = _14;
		//const %15 = 1 : int
		_15 = 1;
		//add %16 = %3, %15 : int
		_16=index+_15;
		//assign %3 = %16  : int
		index = _16;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//invoke (%17) = (%4) Reverse_original:reverse : function(int[])->(int[])
	_UPDATE_1DARRAY_SIZE(_17, arr);
	_17 = reverse(_COPY_1DARRAY_PARAM(arr));
	//assign %4 = %17  : int[]
	_COPY_1DARRAY(arr, _17);
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = 0 : int
	_20 = 0;
	//indexof %21 = %4, %20 : int[]
	_21=arr[_20];
	//indirectinvoke () = %19 (%21) : method(any)->()
	printf("%lld\n", _21);
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indexof %24 = %4, %2 : int[]
	_24=arr[max];
	//indirectinvoke () = %23 (%24) : method(any)->()
	printf("%lld\n", _24);
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [80,97,115,115,32,82,101,118,101,114,115,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY(_27, 22, 0);
	_27[0] = 80; _27[1] = 97; _27[2] = 115; _27[3] = 115; _27[4] = 32; _27[5] = 82; _27[6] = 101; _27[7] = 118; _27[8] = 101; _27[9] = 114; _27[10] = 115; _27[11] = 101; _27[12] = 32; _27[13] = 116; _27[14] = 101; _27[15] = 115; _27[16] = 116; _27[17] = 32; _27[18] = 99; _27[19] = 97; _27[20] = 115; _27[21] = 101; 
	//indirectinvoke () = %26 (%27) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_27));
//.blklab4
blklab4:;
	//return
	exit(0);
}

