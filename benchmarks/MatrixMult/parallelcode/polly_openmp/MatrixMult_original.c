#include "MatrixMult_original.h"
int64_t* _init_(_DECL_1DARRAY_PARAM(data), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(r);
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
		//ifge %4, %2 goto blklab0 : int
		if(i>=height){goto blklab0;}
		//const %7 = 0 : int
		_7 = 0;
		//assign %5 = %7  : int
		// isCopyEliminated = true
		j = _7;
		//loop (%0, %5, %8, %9, %10, %11)
		while(true){
			//ifge %5, %1 goto blklab2 : int
			if(j>=width){goto blklab2;}
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
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %4, %12 : int
		_13=i+_12;
		//assign %4 = %13  : int
		// isCopyEliminated = true
		i = _13;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(data);
	return data;
	//return
}

int64_t* _mat_mult_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(data), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(c);
	int64_t i = 0;
	int64_t j = 0;
	int64_t k = 0;
	int64_t sub_total = 0;
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
	//const %10 = 0 : int
	_10 = 0;
	//assign %6 = %10  : int
	// isCopyEliminated = true
	i = _10;
	//loop (%2, %6, %7, %8, %9, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29)
	while(true){
		//ifge %6, %4 goto blklab4 : int
		if(i>=height){goto blklab4;}
		//const %11 = 0 : int
		_11 = 0;
		//assign %7 = %11  : int
		// isCopyEliminated = true
		j = _11;
		//loop (%2, %7, %8, %9, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27)
		while(true){
			//ifge %7, %3 goto blklab6 : int
			if(j>=width){goto blklab6;}
			//const %12 = 0 : int
			_12 = 0;
			//assign %8 = %12  : int
			// isCopyEliminated = true
			k = _12;
			//const %13 = 0 : int
			_13 = 0;
			//assign %9 = %13  : int
			// isCopyEliminated = true
			sub_total = _13;
			//loop (%8, %9, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23)
			while(true){
				//ifge %8, %3 goto blklab8 : int
				if(k>=width){goto blklab8;}
				//mul %14 = %6, %3 : int
				_14=i*width;
				//add %15 = %14, %8 : int
				_15=_14+k;
				//indexof %16 = %0, %15 : int[]
				_16=a[_15];
				//mul %17 = %8, %3 : int
				_17=k*width;
				//add %18 = %17, %7 : int
				_18=_17+j;
				//indexof %19 = %1, %18 : int[]
				_19=b[_18];
				//mul %20 = %16, %19 : int
				_20=_16*_19;
				//add %21 = %9, %20 : int
				_21=sub_total+_20;
				//assign %9 = %21  : int
				// isCopyEliminated = true
				sub_total = _21;
				//const %22 = 1 : int
				_22 = 1;
				//add %23 = %8, %22 : int
				_23=k+_22;
				//assign %8 = %23  : int
				// isCopyEliminated = true
				k = _23;
//.blklab9
blklab9:;
			}
//.blklab8
blklab8:;
			//mul %24 = %6, %3 : int
			_24=i*width;
			//add %25 = %24, %7 : int
			_25=_24+j;
			//update %2[%25] = %9 : int[] -> int[]
			// isCopyEliminated = true
			data[_25] = sub_total;
			//const %26 = 1 : int
			_26 = 1;
			//add %27 = %7, %26 : int
			_27=j+_26;
			//assign %7 = %27  : int
			// isCopyEliminated = true
			j = _27;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %28 = 1 : int
		_28 = 1;
		//add %29 = %6, %28 : int
		_29=i+_28;
		//assign %6 = %29  : int
		// isCopyEliminated = true
		i = _29;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(data);
	return data;
	//return
}

int main(int argc, char** args){
	int64_t* max;
	int64_t size = 0;
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY(A);
	_DECL_1DARRAY(B);
	_DECL_1DARRAY(C);
	int64_t* _8;
	_DECL_2DARRAY(_9);
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	int64_t _17 = 0;
	int64_t _18 = 0;
	_DECL_1DARRAY(_19);
	_DECL_1DARRAY(_20);
	int64_t _21 = 0;
	int64_t _22 = 0;
	_DECL_1DARRAY(_23);
	_DECL_1DARRAY(_24);
	int64_t _25 = 0;
	int64_t _26 = 0;
	_DECL_1DARRAY(_27);
	_DECL_1DARRAY(_28);
	void* _29;
	_DECL_1DARRAY(_31);
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
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_9);
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	_11_size = _9_size_size;
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_8, _11);
	}
	//assign %1 = %8  : null|int
	// isCopyEliminated = true
	max = _8;
	//ifis %1, null goto blklab10 : null|int
	if(max == NULL) { goto blklab10;}
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
	_NEW_1DARRAY_int64_t(_14, 7, 0);
	_14[0] = 115; _14[1] = 105; _14[2] = 122; _14[3] = 101; _14[4] = 32; _14[5] = 61; _14[6] = 32; 
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
	_NEW_1DARRAY_int64_t(_19, _18, _17);
	//assign %5 = %19  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(A, _19);
	//invoke (%20) = (%5, %3, %4) MatrixMult_original:init : function(int[],int,int)->(int[])
	{
		// isCopyEliminated of '_5' = true
		_20 = _init_(_1DARRAY_PARAM(A), width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
	}
	//assign %5 = %20  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(A, _20);
	//const %21 = 0 : int
	_21 = 0;
	//mul %22 = %3, %4 : int
	_22=width*height;
	//arraygen %23 = [21; 22] : int[]
	_NEW_1DARRAY_int64_t(_23, _22, _21);
	//assign %6 = %23  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(B, _23);
	//invoke (%24) = (%6, %3, %4) MatrixMult_original:init : function(int[],int,int)->(int[])
	{
		// isCopyEliminated of '_6' = true
		_24 = _init_(_1DARRAY_PARAM(B), width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
	}
	//assign %6 = %24  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(B, _24);
	//const %25 = 0 : int
	_25 = 0;
	//mul %26 = %3, %4 : int
	_26=width*height;
	//arraygen %27 = [25; 26] : int[]
	_NEW_1DARRAY_int64_t(_27, _26, _25);
	//assign %7 = %27  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(C, _27);
	//invoke (%28) = (%5, %6, %7, %3, %4) MatrixMult_original:mat_mult : function(int[],int[],int[],int,int)->(int[])
	{
		// isCopyEliminated of '_5' = true
		// isCopyEliminated of '_6' = true
		// isCopyEliminated of '_7' = true
		_28 = _mat_mult_(_1DARRAY_PARAM(A), _1DARRAY_PARAM(B), _1DARRAY_PARAM(C), width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
	}
	//assign %7 = %28  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(C, _28);
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = [77,97,116,114,105,120,32,67,91,115,105,122,101,45,49,93,91,115,105,122,101,45,49,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_31, 27, 0);
	_31[0] = 77; _31[1] = 97; _31[2] = 116; _31[3] = 114; _31[4] = 105; _31[5] = 120; _31[6] = 32; _31[7] = 67; _31[8] = 91; _31[9] = 115; _31[10] = 105; _31[11] = 122; _31[12] = 101; _31[13] = 45; _31[14] = 49; _31[15] = 93; _31[16] = 91; _31[17] = 115; _31[18] = 105; _31[19] = 122; _31[20] = 101; _31[21] = 45; _31[22] = 49; _31[23] = 93; _31[24] = 32; _31[25] = 61; _31[26] = 32; 
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
	_NEW_1DARRAY_int64_t(_43, 25, 0);
	_43[0] = 80; _43[1] = 97; _43[2] = 115; _43[3] = 115; _43[4] = 32; _43[5] = 77; _43[6] = 97; _43[7] = 116; _43[8] = 114; _43[9] = 105; _43[10] = 120; _43[11] = 77; _43[12] = 117; _43[13] = 108; _43[14] = 116; _43[15] = 32; _43[16] = 116; _43[17] = 101; _43[18] = 115; _43[19] = 116; _43[20] = 32; _43[21] = 99; _43[22] = 97; _43[23] = 115; _43[24] = 101; 
	//indirectinvoke () = %42 (%43) : method(int[])->()
	{
		println_s(_43, _43_size);
	}
//.blklab10
blklab10:;
	//return
	exit(0);
}

