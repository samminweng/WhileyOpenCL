#include "MatrixMult_original.h"
int64_t* _init_(_DECL_1DARRAY_PARAM(data), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(data);
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t i;
	int64_t j;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
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
	_DEALLOC(r);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(data);
	return data;
	//return
}

int64_t* _mat_mult_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(data), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t i;
	int64_t j;
	int64_t k;
	int64_t sub_total;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
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
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(data);
	return data;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t size;
	int64_t width;
	int64_t height;
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
	int64_t _10;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17;
	int64_t _18;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	int64_t _21;
	int64_t _22;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
	int64_t _25;
	int64_t _26;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	void* _29;
	int64_t _31;
	int64_t _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	void* _38;
	_DECL_1DARRAY(_40);
	_DECL_DEALLOC(_40);
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY(_9);
	_CONV_ARGS(_9);
	_9_dealloc = true;
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	_11_size = _9_size_size;
	_11_dealloc = false;
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_8, _11);
		_8_dealloc = true;
		_11_dealloc = false;
	}
	//assign %1 = %8  : null|int
	// isCopyEliminated = true
	_DEALLOC(n);
	n = _8;
	_TRANSFER_DEALLOC_POST(n, _8);
	//ifis %1, null goto blklab10 : null|int
	if(n == NULL) { goto blklab10;}
	//assign %2 = %1  : int
	// isCopyEliminated = true
	size = *n;
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
	_14_dealloc = true;
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_14, _14_size);
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
	_NEW1DARRAY_DEALLOC(_19, _17, _18, int64_t);
	//assign %5 = %19  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(A, _19);
	//invoke (%20) = (%5, %3, %4) MatrixMult_original:init : function(int[],int,int)->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_20, A, 0, "liveness: A = false, readonly: A = false, return:A = ALWAYS_RETURN" , "init");
		_DEALLOC(_20);
		// isCopyEliminated of 'A at 0' = true
		_20 = _init_(A, A_size, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
		_20_dealloc = A_dealloc;
		A_dealloc = false;
	}
	//assign %5 = %20  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(A, _20);
	//const %21 = 0 : int
	_21 = 0;
	//mul %22 = %3, %4 : int
	_22=width*height;
	//arraygen %23 = [21; 22] : int[]
	_NEW1DARRAY_DEALLOC(_23, _21, _22, int64_t);
	//assign %6 = %23  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(B, _23);
	//invoke (%24) = (%6, %3, %4) MatrixMult_original:init : function(int[],int,int)->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_24, B, 0, "liveness: B = false, readonly: B = false, return:B = ALWAYS_RETURN" , "init");
		_DEALLOC(_24);
		// isCopyEliminated of 'B at 0' = true
		_24 = _init_(B, B_size, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
		_24_dealloc = B_dealloc;
		B_dealloc = false;
	}
	//assign %6 = %24  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(B, _24);
	//const %25 = 0 : int
	_25 = 0;
	//mul %26 = %3, %4 : int
	_26=width*height;
	//arraygen %27 = [25; 26] : int[]
	_NEW1DARRAY_DEALLOC(_27, _25, _26, int64_t);
	//assign %7 = %27  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(C, _27);
	//invoke (%28) = (%5, %6, %7, %3, %4) MatrixMult_original:mat_mult : function(int[],int[],int[],int,int)->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_28, C, 2, "liveness: C = false, readonly: C = false, return:C = ALWAYS_RETURN" , "mat_mult");
		_FUNCTIONCALL_NO_COPY_PRE(_28, B, 1, "liveness: B = false, readonly: B = true, return:B = NEVER_RETURN" , "mat_mult");
		_FUNCTIONCALL_NO_COPY_PRE(_28, A, 0, "liveness: A = false, readonly: A = true, return:A = NEVER_RETURN" , "mat_mult");
		_DEALLOC(_28);
		// isCopyEliminated of 'A at 0' = true
		// isCopyEliminated of 'B at 1' = true
		// isCopyEliminated of 'C at 2' = true
		_28 = _mat_mult_(A, A_size, B, B_size, C, C_size, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
		_28_dealloc = C_dealloc;
		C_dealloc = false;
	}
	//assign %7 = %28  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(C, _28);
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = 1 : int
	_31 = 1;
	//sub %32 = %2, %31 : int
	_32=size-_31;
	//mul %33 = %32, %2 : int
	_33=_32*size;
	//add %34 = %33, %2 : int
	_34=_33+size;
	//const %35 = 1 : int
	_35 = 1;
	//sub %36 = %34, %35 : int
	_36=_34-_35;
	//indexof %37 = %7, %36 : int[]
	_37=C[_36];
	//indirectinvoke () = %30 (%37) : method(any)->()
	{
		printf("%"PRId64"\n", _37);
	}
	//fieldload %38 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %39 = %38 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %40 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_40);
	_NEW_1DARRAY_int64_t(_40, 25, 0);
	_40[0] = 80; _40[1] = 97; _40[2] = 115; _40[3] = 115; _40[4] = 32; _40[5] = 77; _40[6] = 97; _40[7] = 116; _40[8] = 114; _40[9] = 105; _40[10] = 120; _40[11] = 77; _40[12] = 117; _40[13] = 108; _40[14] = 116; _40[15] = 32; _40[16] = 116; _40[17] = 101; _40[18] = 115; _40[19] = 116; _40[20] = 32; _40[21] = 99; _40[22] = 97; _40[23] = 115; _40[24] = 101; 
	_40_dealloc = true;
	//indirectinvoke () = %39 (%40) : method(int[])->()
	{
		println_s(_40, _40_size);
	}
//.blklab10
blklab10:;
	//return
	_DEALLOC(n);
	_DEALLOC(A);
	_DEALLOC(B);
	_DEALLOC(C);
	_DEALLOC(_8);
	_FREE_ARGS(_9);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_19);
	_DEALLOC(_20);
	_DEALLOC(_23);
	_DEALLOC(_24);
	_DEALLOC(_27);
	_DEALLOC(_28);
	_DEALLOC(_40);
	exit(0);
}

