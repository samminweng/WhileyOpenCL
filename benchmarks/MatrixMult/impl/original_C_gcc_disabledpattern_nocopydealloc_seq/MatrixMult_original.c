#include "MatrixMult_original.h"
int64_t* _init_(_DECL_1DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t i = 0;
	int64_t j = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//assign %4 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%0, %4, %5, %7, %8, %9, %10, %11, %12, %13)
	while(true){
		//ifge %4, %2 goto blklab1 : int
		if(i>=height){goto blklab1;}
		//const %7 = 0 : int
		_7 = 0;
		//assign %5 = %7  : int
		// isCopyEliminated = true
		j = _7;
		//loop (%0, %5, %8, %9, %10, %11)
		while(true){
			//ifge %5, %1 goto blklab3 : int
			if(j>=width){goto blklab3;}
			//mul %8 = %4, %1 : int
			_8=i*width;
			//add %9 = %8, %5 : int
			_9=_8+j;
			//update %0[%9] = %4 : int[] -> int[]
			// isCopyEliminated = true
			data[_9] = i;
			//const %10 = 1 : int
			_10 = 1;
			//add %11 = %5, %10 : int
			_11=j+_10;
			//assign %5 = %11  : int
			// isCopyEliminated = true
			j = _11;
//.blklab4
blklab4:;
		}
//.blklab3
blklab3:;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %4, %12 : int
		_13=i+_12;
		//assign %4 = %13  : int
		// isCopyEliminated = true
		i = _13;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//return %0
	_DEALLOC(r);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(data);
	return data;
	//return
}

void _print_mat_(FILE* sys, _DECL_1DARRAY_PARAM(a), _DECL_DEALLOC_PARAM(a), int64_t width, int64_t height){
	int64_t i = 0;
	int64_t j = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	void* _8;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	void* _13;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	void* _20;
	void* _22;
	size_t _22_size = 0;
	_DECL_DEALLOC(_22);
	//const %6 = 0 : int
	_6 = 0;
	//assign %4 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%4, %5, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
	while(true){
		//ifge %4, %3 goto blklab5 : int
		if(i>=height){goto blklab5;}
		//const %7 = 0 : int
		_7 = 0;
		//assign %5 = %7  : int
		// isCopyEliminated = true
		j = _7;
		//loop (%5, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17)
		while(true){
			//ifge %5, %2 goto blklab7 : int
			if(j>=width){goto blklab7;}
			//fieldload %8 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %9 = %8 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//mul %10 = %4, %2 : int
			_10=i*width;
			//add %11 = %10, %5 : int
			_11=_10+j;
			//indexof %12 = %1, %11 : int[]
			_12=a[_11];
			//indirectinvoke () = %9 (%12) : method(any)->()
			{
				printf("%"PRId64, _12);
			}
			//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %15 = [32] : int[]
			_DEALLOC(_15);
			_NEW_1DARRAY_int64_t(_15, 1, 0);
			_15[0] = 32; 
			_ADD_DEALLOC(_15);
			//indirectinvoke () = %14 (%15) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_15));
			}
			//const %16 = 1 : int
			_16 = 1;
			//add %17 = %5, %16 : int
			_17=j+_16;
			//assign %5 = %17  : int
			// isCopyEliminated = true
			j = _17;
//.blklab8
blklab8:;
		}
//.blklab7
blklab7:;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %4, %18 : int
		_19=i+_18;
		//assign %4 = %19  : int
		// isCopyEliminated = true
		i = _19;
		//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %21 = %20 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %22 = [] : void[]
		_DEALLOC(_22);
		_NEW_1DARRAY_int64_t(_22, 0, 0);
		_ADD_DEALLOC(_22);
		//indirectinvoke () = %21 (%22) : method(int[])->()
		{
			println_s(_22, _22_size);
		}
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//return
	_DEALLOC(a);
	_DEALLOC(_15);
	_DEALLOC(_22);
	return;
}

int64_t* _mat_mult_(_DECL_1DARRAY_PARAM(a), _DECL_DEALLOC_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_DEALLOC_PARAM(b), _DECL_1DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t i = 0;
	int64_t j = 0;
	int64_t k = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
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
	//const %9 = 0 : int
	_9 = 0;
	//assign %6 = %9  : int
	// isCopyEliminated = true
	i = _9;
	//loop (%2, %6, %7, %8, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
	while(true){
		//ifge %6, %4 goto blklab9 : int
		if(i>=height){goto blklab9;}
		//const %10 = 0 : int
		_10 = 0;
		//assign %7 = %10  : int
		// isCopyEliminated = true
		j = _10;
		//loop (%2, %7, %8, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28)
		while(true){
			//ifge %7, %3 goto blklab11 : int
			if(j>=width){goto blklab11;}
			//const %11 = 0 : int
			_11 = 0;
			//assign %8 = %11  : int
			// isCopyEliminated = true
			k = _11;
			//loop (%2, %8, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26)
			while(true){
				//ifge %8, %3 goto blklab13 : int
				if(k>=width){goto blklab13;}
				//mul %12 = %6, %3 : int
				_12=i*width;
				//add %13 = %12, %7 : int
				_13=_12+j;
				//indexof %14 = %2, %13 : int[]
				_14=data[_13];
				//mul %15 = %6, %3 : int
				_15=i*width;
				//add %16 = %15, %8 : int
				_16=_15+k;
				//indexof %17 = %0, %16 : int[]
				_17=a[_16];
				//mul %18 = %8, %3 : int
				_18=k*width;
				//add %19 = %18, %7 : int
				_19=_18+j;
				//indexof %20 = %1, %19 : int[]
				_20=b[_19];
				//mul %21 = %17, %20 : int
				_21=_17*_20;
				//add %22 = %14, %21 : int
				_22=_14+_21;
				//mul %23 = %6, %3 : int
				_23=i*width;
				//add %24 = %23, %7 : int
				_24=_23+j;
				//update %2[%24] = %22 : int[] -> int[]
				// isCopyEliminated = true
				data[_24] = _22;
				//const %25 = 1 : int
				_25 = 1;
				//add %26 = %8, %25 : int
				_26=k+_25;
				//assign %8 = %26  : int
				// isCopyEliminated = true
				k = _26;
//.blklab14
blklab14:;
			}
//.blklab13
blklab13:;
			//const %27 = 1 : int
			_27 = 1;
			//add %28 = %7, %27 : int
			_28=j+_27;
			//assign %7 = %28  : int
			// isCopyEliminated = true
			j = _28;
//.blklab12
blklab12:;
		}
//.blklab11
blklab11:;
		//const %29 = 1 : int
		_29 = 1;
		//add %30 = %6, %29 : int
		_30=i+_29;
		//assign %6 = %30  : int
		// isCopyEliminated = true
		i = _30;
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
	//return %2
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(data);
	return data;
	//return
}

int main(int argc, char** args){
	int64_t* max;
	_DECL_DEALLOC(max);
	int64_t size = 0;
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY(A);
	_DECL_DEALLOC(A);
	_DECL_1DARRAY(B);
	_DECL_DEALLOC(B);
	_DECL_1DARRAY(C);
	_DECL_DEALLOC(C);
	int64_t* _8;
	_DECL_DEALLOC(_8);
	_DECL_2DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17 = 0;
	int64_t _18 = 0;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	int64_t _21 = 0;
	int64_t _22 = 0;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
	int64_t _25 = 0;
	int64_t _26 = 0;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	void* _29;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	void* _32;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	void* _41;
	_DECL_1DARRAY(_43);
	_DECL_DEALLOC(_43);
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_9);
	_CONV_ARGS(_9);
	_ADD_DEALLOC(_9);
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	_11_size = _9_size_size;
	_REMOVE_DEALLOC(_11);
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_8, _11);
		_ADD_DEALLOC(_8);
		_REMOVE_DEALLOC(_11);
	}
	//assign %1 = %8  : null|int
	_DEALLOC(max);
	// isCopyEliminated = true
	max = _8;
	_TRANSFER_DEALLOC(max, _8);
	//ifis %1, null goto blklab15 : null|int
	if(max == NULL) { goto blklab15;}
	//assign %2 = %1  : int
	// isCopyEliminated = true
	size = *max;
	//assign %3 = %2  : int
	// isCopyEliminated = false
	width = size;
	//assign %4 = %2  : int
	// isCopyEliminated = false
	height = size;
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [115,105,122,101,32,61,32] : int[]
	_DEALLOC(_14);
	_NEW_1DARRAY_int64_t(_14, 7, 0);
	_14[0] = 115; _14[1] = 105; _14[2] = 122; _14[3] = 101; _14[4] = 32; _14[5] = 61; _14[6] = 32; 
	_ADD_DEALLOC(_14);
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_14));
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", size);
	}
	//const %17 = 0 : int
	_17 = 0;
	//mul %18 = %3, %4 : int
	_18=width*height;
	//arraygen %19 = [17; 18] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY_int64_t(_19, _18, _17);
	_ADD_DEALLOC(_19);
	//assign %5 = %19  : int[]
	_DEALLOC(A);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(A, _19);
	_TRANSFER_DEALLOC(A, _19);
	//invoke (%20) = (%5, %3, %4) MatrixMult_original:init : function(int[],int,int)->(int[])
	{
		_DEALLOC(_20);
		// isCopyEliminated of '_5' = true
		_20 = _init_(_1DARRAY_PARAM(A), false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
		_RESET_DEALLOC(A, "true-true-false" , "init");
		_ADD_DEALLOC(_20);
	}
	//assign %5 = %20  : int[]
	_DEALLOC(A);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(A, _20);
	_TRANSFER_DEALLOC(A, _20);
	//const %21 = 0 : int
	_21 = 0;
	//mul %22 = %3, %4 : int
	_22=width*height;
	//arraygen %23 = [21; 22] : int[]
	_DEALLOC(_23);
	_NEW_1DARRAY_int64_t(_23, _22, _21);
	_ADD_DEALLOC(_23);
	//assign %6 = %23  : int[]
	_DEALLOC(B);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(B, _23);
	_TRANSFER_DEALLOC(B, _23);
	//invoke (%24) = (%6, %3, %4) MatrixMult_original:init : function(int[],int,int)->(int[])
	{
		_DEALLOC(_24);
		// isCopyEliminated of '_6' = true
		_24 = _init_(_1DARRAY_PARAM(B), false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
		_RESET_DEALLOC(B, "true-true-false" , "init");
		_ADD_DEALLOC(_24);
	}
	//assign %6 = %24  : int[]
	_DEALLOC(B);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(B, _24);
	_TRANSFER_DEALLOC(B, _24);
	//const %25 = 0 : int
	_25 = 0;
	//mul %26 = %3, %4 : int
	_26=width*height;
	//arraygen %27 = [25; 26] : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY_int64_t(_27, _26, _25);
	_ADD_DEALLOC(_27);
	//assign %7 = %27  : int[]
	_DEALLOC(C);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(C, _27);
	_TRANSFER_DEALLOC(C, _27);
	//invoke (%28) = (%5, %6, %7, %3, %4) MatrixMult_original:mat_mult : function(int[],int[],int[],int,int)->(int[])
	{
		_DEALLOC(_28);
		// isCopyEliminated of '_5' = true
		// isCopyEliminated of '_6' = true
		// isCopyEliminated of '_7' = true
		_28 = _mat_mult_(_1DARRAY_PARAM(A), false, _1DARRAY_PARAM(B), false, _1DARRAY_PARAM(C), false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
		_RETAIN_DEALLOC(A, "false-false-false" , "mat_mult");
		_RETAIN_DEALLOC(B, "false-false-false" , "mat_mult");
		_RESET_DEALLOC(C, "true-true-false" , "mat_mult");
		_ADD_DEALLOC(_28);
	}
	//assign %7 = %28  : int[]
	_DEALLOC(C);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(C, _28);
	_TRANSFER_DEALLOC(C, _28);
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = [77,97,116,114,105,120,32,67,91,115,105,122,101,45,49,93,91,115,105,122,101,45,49,93,32,61,32] : int[]
	_DEALLOC(_31);
	_NEW_1DARRAY_int64_t(_31, 27, 0);
	_31[0] = 77; _31[1] = 97; _31[2] = 116; _31[3] = 114; _31[4] = 105; _31[5] = 120; _31[6] = 32; _31[7] = 67; _31[8] = 91; _31[9] = 115; _31[10] = 105; _31[11] = 122; _31[12] = 101; _31[13] = 45; _31[14] = 49; _31[15] = 93; _31[16] = 91; _31[17] = 115; _31[18] = 105; _31[19] = 122; _31[20] = 101; _31[21] = 45; _31[22] = 49; _31[23] = 93; _31[24] = 32; _31[25] = 61; _31[26] = 32; 
	_ADD_DEALLOC(_31);
	//indirectinvoke () = %30 (%31) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_31));
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %34 = 1 : int
	_34 = 1;
	//sub %35 = %2, %34 : int
	_35=size-_34;
	//mul %36 = %35, %2 : int
	_36=_35*size;
	//add %37 = %36, %2 : int
	_37=_36+size;
	//const %38 = 1 : int
	_38 = 1;
	//sub %39 = %37, %38 : int
	_39=_37-_38;
	//indexof %40 = %7, %39 : int[]
	_40=C[_39];
	//indirectinvoke () = %33 (%40) : method(any)->()
	{
		printf("%"PRId64"\n", _40);
	}
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %43 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_43);
	_NEW_1DARRAY_int64_t(_43, 25, 0);
	_43[0] = 80; _43[1] = 97; _43[2] = 115; _43[3] = 115; _43[4] = 32; _43[5] = 77; _43[6] = 97; _43[7] = 116; _43[8] = 114; _43[9] = 105; _43[10] = 120; _43[11] = 77; _43[12] = 117; _43[13] = 108; _43[14] = 116; _43[15] = 32; _43[16] = 116; _43[17] = 101; _43[18] = 115; _43[19] = 116; _43[20] = 32; _43[21] = 99; _43[22] = 97; _43[23] = 115; _43[24] = 101; 
	_ADD_DEALLOC(_43);
	//indirectinvoke () = %42 (%43) : method(int[])->()
	{
		println_s(_43, _43_size);
	}
//.blklab15
blklab15:;
	//return
	_DEALLOC(max);
	_DEALLOC(A);
	_DEALLOC(B);
	_DEALLOC(C);
	_DEALLOC(_8);
	_DEALLOC_2DARRAY_int64_t(_9);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_19);
	_DEALLOC(_20);
	_DEALLOC(_23);
	_DEALLOC(_24);
	_DEALLOC(_27);
	_DEALLOC(_28);
	_DEALLOC(_31);
	_DEALLOC(_43);
	exit(0);
}

