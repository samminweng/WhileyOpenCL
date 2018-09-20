#include "MatrixMult.h"
int64_t* _init_(_DECL_1DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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

int64_t* _mat_mult_(_DECL_1DARRAY_PARAM(a), _DECL_DEALLOC_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_DEALLOC_PARAM(b), _DECL_1DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
	int64_t size;
	int64_t width;
	int64_t height;
	_DECL_1DARRAY(A);
	_DECL_DEALLOC(A);
	_DECL_1DARRAY(B);
	_DECL_DEALLOC(B);
	_DECL_1DARRAY(C);
	_DECL_DEALLOC(C);
	int64_t _7;
	void* _8;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
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
	void* _46;
	_DECL_1DARRAY(_48);
	_DECL_DEALLOC(_48);
	void* _49;
	int64_t _51;
	int64_t _52;
	int64_t _53;
	int64_t _54;
	int64_t _55;
	int64_t _56;
	int64_t _57;
	void* _58;
	_DECL_1DARRAY(_60);
	_DECL_DEALLOC(_60);
	//const %7 = 20 : int
	_7 = 20;
	//assign %1 = %7  : int
	// isCopyEliminated = true
	size = _7;
	//assign %2 = %1  : int
	// isCopyEliminated = false
	width = size;
	//assign %3 = %1  : int
	// isCopyEliminated = false
	height = size;
	//fieldload %8 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %9 = %8 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %10 = [115,105,122,101,32,61,32] : int[]
	_DEALLOC(_10);
	_NEW_1DARRAY_int64_t(_10, 7, 0);
	_10[0] = 115; _10[1] = 105; _10[2] = 122; _10[3] = 101; _10[4] = 32; _10[5] = 61; _10[6] = 32; 
	_10_dealloc = true;
	//indirectinvoke () = %9 (%10) : method(int[])->()
	{
		printf_s(_10, _10_size);
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %12 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", size);
	}
	//const %13 = 0 : int
	_13 = 0;
	//mul %14 = %2, %3 : int
	_14=width*height;
	//arraygen %15 = [13; 14] : int[]
	_DEALLOC(_15);
	_NEW_1DARRAY_int64_t(_15, _14, _13);
	_NEW1DARRAY_DEALLOC(_15, _13, _14);
	//assign %4 = %15  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(A, _15, 1);
	//invoke (%16) = (%4, %2, %3) MatrixMult:init : function(int[],int,int)->(int[])
	{
		_DEALLOC(_16);
		// isCopyEliminated of '_4' = true
		_16 = _init_(A, A_size, false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
		_RESET_DEALLOC(A, "true-true-false" , "init");
		_RESET_DEALLOC_POST(_16, A);
	}
	//assign %4 = %16  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(A, _16, 1);
	//const %17 = 0 : int
	_17 = 0;
	//mul %18 = %2, %3 : int
	_18=width*height;
	//arraygen %19 = [17; 18] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY_int64_t(_19, _18, _17);
	_NEW1DARRAY_DEALLOC(_19, _17, _18);
	//assign %5 = %19  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(B, _19, 1);
	//invoke (%20) = (%5, %2, %3) MatrixMult:init : function(int[],int,int)->(int[])
	{
		_DEALLOC(_20);
		// isCopyEliminated of '_5' = true
		_20 = _init_(B, B_size, false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
		_RESET_DEALLOC(B, "true-true-false" , "init");
		_RESET_DEALLOC_POST(_20, B);
	}
	//assign %5 = %20  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(B, _20, 1);
	//const %21 = 0 : int
	_21 = 0;
	//mul %22 = %2, %3 : int
	_22=width*height;
	//arraygen %23 = [21; 22] : int[]
	_DEALLOC(_23);
	_NEW_1DARRAY_int64_t(_23, _22, _21);
	_NEW1DARRAY_DEALLOC(_23, _21, _22);
	//assign %6 = %23  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(C, _23, 1);
	//invoke (%24) = (%4, %5, %6, %2, %3) MatrixMult:mat_mult : function(int[],int[],int[],int,int)->(int[])
	{
		_DEALLOC(_24);
		// isCopyEliminated of '_4' = true
		// isCopyEliminated of '_5' = true
		// isCopyEliminated of '_6' = true
		_24 = _mat_mult_(A, A_size, false, B, B_size, false, C, C_size, false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
		_RETAIN_DEALLOC(A, "false-false-true" , "mat_mult");
		_RETAIN_DEALLOC_POST(_24, A);
		_RETAIN_DEALLOC(B, "false-false-true" , "mat_mult");
		_RETAIN_DEALLOC_POST(_24, B);
		_RESET_DEALLOC(C, "true-true-false" , "mat_mult");
		_RESET_DEALLOC_POST(_24, C);
	}
	//assign %6 = %24  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(C, _24, 1);
	//assert
	{
		//const %25 = 19 : int
		_25 = 19;
		//const %26 = 20 : int
		_26 = 20;
		//mul %27 = %25, %26 : int
		_27=_25*_26;
		//const %28 = 19 : int
		_28 = 19;
		//add %29 = %27, %28 : int
		_29=_27+_28;
		//indexof %30 = %4, %29 : int[]
		_30=A[_29];
		//const %31 = 19 : int
		_31 = 19;
		//ifeq %30, %31 goto blklab10 : int
		if(_30==_31){goto blklab10;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab10
blklab10:;
	//assert
	}
	//assert
	{
		//const %32 = 19 : int
		_32 = 19;
		//const %33 = 20 : int
		_33 = 20;
		//mul %34 = %32, %33 : int
		_34=_32*_33;
		//const %35 = 19 : int
		_35 = 19;
		//add %36 = %34, %35 : int
		_36=_34+_35;
		//indexof %37 = %5, %36 : int[]
		_37=B[_36];
		//const %38 = 19 : int
		_38 = 19;
		//ifeq %37, %38 goto blklab11 : int
		if(_37==_38){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//assert
	{
		//const %39 = 19 : int
		_39 = 19;
		//const %40 = 20 : int
		_40 = 20;
		//mul %41 = %39, %40 : int
		_41=_39*_40;
		//const %42 = 19 : int
		_42 = 19;
		//add %43 = %41, %42 : int
		_43=_41+_42;
		//indexof %44 = %6, %43 : int[]
		_44=C[_43];
		//const %45 = 3610 : int
		_45 = 3610;
		//ifeq %44, %45 goto blklab12 : int
		if(_44==_45){goto blklab12;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab12
blklab12:;
	//assert
	}
	//fieldload %46 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %47 = %46 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %48 = [77,97,116,114,105,120,32,67,91,115,105,122,101,45,49,93,91,115,105,122,101,45,49,93,32,61,32] : int[]
	_DEALLOC(_48);
	_NEW_1DARRAY_int64_t(_48, 27, 0);
	_48[0] = 77; _48[1] = 97; _48[2] = 116; _48[3] = 114; _48[4] = 105; _48[5] = 120; _48[6] = 32; _48[7] = 67; _48[8] = 91; _48[9] = 115; _48[10] = 105; _48[11] = 122; _48[12] = 101; _48[13] = 45; _48[14] = 49; _48[15] = 93; _48[16] = 91; _48[17] = 115; _48[18] = 105; _48[19] = 122; _48[20] = 101; _48[21] = 45; _48[22] = 49; _48[23] = 93; _48[24] = 32; _48[25] = 61; _48[26] = 32; 
	_48_dealloc = true;
	//indirectinvoke () = %47 (%48) : method(int[])->()
	{
		printf_s(_48, _48_size);
	}
	//fieldload %49 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %50 = %49 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %51 = 1 : int
	_51 = 1;
	//sub %52 = %1, %51 : int
	_52=size-_51;
	//mul %53 = %52, %1 : int
	_53=_52*size;
	//add %54 = %53, %1 : int
	_54=_53+size;
	//const %55 = 1 : int
	_55 = 1;
	//sub %56 = %54, %55 : int
	_56=_54-_55;
	//indexof %57 = %6, %56 : int[]
	_57=C[_56];
	//indirectinvoke () = %50 (%57) : method(any)->()
	{
		printf("%"PRId64"\n", _57);
	}
	//fieldload %58 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %59 = %58 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %60 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_60);
	_NEW_1DARRAY_int64_t(_60, 25, 0);
	_60[0] = 80; _60[1] = 97; _60[2] = 115; _60[3] = 115; _60[4] = 32; _60[5] = 77; _60[6] = 97; _60[7] = 116; _60[8] = 114; _60[9] = 105; _60[10] = 120; _60[11] = 77; _60[12] = 117; _60[13] = 108; _60[14] = 116; _60[15] = 32; _60[16] = 116; _60[17] = 101; _60[18] = 115; _60[19] = 116; _60[20] = 32; _60[21] = 99; _60[22] = 97; _60[23] = 115; _60[24] = 101; 
	_60_dealloc = true;
	//indirectinvoke () = %59 (%60) : method(int[])->()
	{
		println_s(_60, _60_size);
	}
	//return
	_DEALLOC(A);
	_DEALLOC(B);
	_DEALLOC(C);
	_DEALLOC(_10);
	_DEALLOC(_15);
	_DEALLOC(_16);
	_DEALLOC(_19);
	_DEALLOC(_20);
	_DEALLOC(_23);
	_DEALLOC(_24);
	_DEALLOC(_48);
	_DEALLOC(_60);
	exit(0);
}

