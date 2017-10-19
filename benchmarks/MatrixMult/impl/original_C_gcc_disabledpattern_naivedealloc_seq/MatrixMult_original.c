#include "MatrixMult_original.h"
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
	i = _6;
	//loop (%0, %4, %5, %7, %8, %9, %10, %11, %12, %13)
	while(true){
		//ifge %4, %2 goto blklab0 : int
		if(i>=height){goto blklab0;}
		//const %7 = 0 : int
		_7 = 0;
		//assign %5 = %7  : int
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
	i = _10;
	//loop (%2, %6, %7, %8, %9, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29)
	while(true){
		//ifge %6, %4 goto blklab4 : int
		if(i>=height){goto blklab4;}
		//const %11 = 0 : int
		_11 = 0;
		//assign %7 = %11  : int
		j = _11;
		//loop (%2, %7, %8, %9, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27)
		while(true){
			//ifge %7, %3 goto blklab6 : int
			if(j>=width){goto blklab6;}
			//const %12 = 0 : int
			_12 = 0;
			//assign %8 = %12  : int
			k = _12;
			//const %13 = 0 : int
			_13 = 0;
			//assign %9 = %13  : int
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
				sub_total = _21;
				//const %22 = 1 : int
				_22 = 1;
				//add %23 = %8, %22 : int
				_23=k+_22;
				//assign %8 = %23  : int
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
	int64_t max;
	int64_t size;
	int64_t width;
	int64_t height;
	int64_t repeats;
	_DECL_1DARRAY(A);
	_DECL_DEALLOC(A);
	_DECL_1DARRAY(B);
	_DECL_DEALLOC(B);
	_DECL_1DARRAY(C);
	_DECL_DEALLOC(C);
	int64_t* _10;
	_DECL_DEALLOC(_10);
	_DECL_2DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	int64_t _14;
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	void* _18;
	int64_t _20;
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
	int64_t _29;
	int64_t _30;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	void* _33;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	int64_t _39;
	int64_t _40;
	int64_t _41;
	int64_t _42;
	int64_t _43;
	void* _44;
	_DECL_1DARRAY(_46);
	_DECL_DEALLOC(_46);
	void* _47;
	void* _49;
	_DECL_1DARRAY(_51);
	_DECL_DEALLOC(_51);
	//fieldload %11 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_11);
	_CONV_ARGS(_11);
	_ADD_DEALLOC(_11);
	//const %12 = 0 : int
	_12 = 0;
	//indexof %13 = %11, %12 : int[][]
	_13=_11[_12];
	_13_size = _11_size_size;
	_REMOVE_DEALLOC(_13);
	//invoke (%10) = (%13) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_10, _13);
		_ADD_DEALLOC(_10);
		_REMOVE_DEALLOC(_13);
	}
	//assign %1 = %10  : null|int
	_DEALLOC(n);
	_NEW_INTEGER_POINTER(n, _10);
	_ADD_DEALLOC(n);
	//ifis %1, null goto blklab10 : null|int
	if(n == NULL) { goto blklab10;}
	//assign %2 = %1  : int
	max = *n;
	//const %14 = 1000 : int
	_14 = 1000;
	//assign %3 = %14  : int
	size = _14;
	//assign %4 = %3  : int
	width = size;
	//assign %5 = %3  : int
	height = size;
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [115,105,122,101,32,61,32] : int[]
	_DEALLOC(_17);
	_NEW_1DARRAY_int64_t(_17, 7, 0);
	_17[0] = 115; _17[1] = 105; _17[2] = 122; _17[3] = 101; _17[4] = 32; _17[5] = 61; _17[6] = 32; 
	_ADD_DEALLOC(_17);
	//indirectinvoke () = %16 (%17) : method(int[])->()
	{
		printf_s(_17, _17_size);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %19 (%3) : method(any)->()
	{
		printf("%"PRId64"\n", size);
	}
	//const %20 = 0 : int
	_20 = 0;
	//assign %6 = %20  : int
	repeats = _20;
	//loop (%6, %7, %8, %9, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48)
	while(true){
		//ifge %6, %2 goto blklab11 : int
		if(repeats>=max){goto blklab11;}
		//const %21 = 0 : int
		_21 = 0;
		//mul %22 = %4, %5 : int
		_22=width*height;
		//arraygen %23 = [21; 22] : int[]
		_DEALLOC(_23);
		_NEW_1DARRAY_int64_t(_23, _22, _21);
		_ADD_DEALLOC(_23);
		//assign %7 = %23  : int[]
		_DEALLOC(A);
		_COPY_1DARRAY_int64_t(A, _23);
		_ADD_DEALLOC(A);
		//invoke (%24) = (%7, %4, %5) MatrixMult_original:init : function(int[],int,int)->(int[])
		{
			void* tmp_A_0;
			_COPY_1DARRAY_PARAM(A, tmp_A_0, int64_t);
			_DEALLOC(_24);
			_24 = _init_(tmp_A_0, A_size, false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
			_CALLER_DEALLOC(A, "true-true-false" , "init");
			_CALLER_DEALLOC_POST(_24, tmp_A_0);
		}
		//assign %7 = %24  : int[]
		_DEALLOC(A);
		_COPY_1DARRAY_int64_t(A, _24);
		_ADD_DEALLOC(A);
		//const %25 = 0 : int
		_25 = 0;
		//mul %26 = %4, %5 : int
		_26=width*height;
		//arraygen %27 = [25; 26] : int[]
		_DEALLOC(_27);
		_NEW_1DARRAY_int64_t(_27, _26, _25);
		_ADD_DEALLOC(_27);
		//assign %8 = %27  : int[]
		_DEALLOC(B);
		_COPY_1DARRAY_int64_t(B, _27);
		_ADD_DEALLOC(B);
		//invoke (%28) = (%8, %4, %5) MatrixMult_original:init : function(int[],int,int)->(int[])
		{
			void* tmp_B_0;
			_COPY_1DARRAY_PARAM(B, tmp_B_0, int64_t);
			_DEALLOC(_28);
			_28 = _init_(tmp_B_0, B_size, false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
			_CALLER_DEALLOC(B, "true-true-false" , "init");
			_CALLER_DEALLOC_POST(_28, tmp_B_0);
		}
		//assign %8 = %28  : int[]
		_DEALLOC(B);
		_COPY_1DARRAY_int64_t(B, _28);
		_ADD_DEALLOC(B);
		//const %29 = 0 : int
		_29 = 0;
		//mul %30 = %4, %5 : int
		_30=width*height;
		//arraygen %31 = [29; 30] : int[]
		_DEALLOC(_31);
		_NEW_1DARRAY_int64_t(_31, _30, _29);
		_ADD_DEALLOC(_31);
		//assign %9 = %31  : int[]
		_DEALLOC(C);
		_COPY_1DARRAY_int64_t(C, _31);
		_ADD_DEALLOC(C);
		//invoke (%32) = (%7, %8, %9, %4, %5) MatrixMult_original:mat_mult : function(int[],int[],int[],int,int)->(int[])
		{
			void* tmp_A_0;
			_COPY_1DARRAY_PARAM(A, tmp_A_0, int64_t);
			void* tmp_B_1;
			_COPY_1DARRAY_PARAM(B, tmp_B_1, int64_t);
			void* tmp_C_2;
			_COPY_1DARRAY_PARAM(C, tmp_C_2, int64_t);
			_DEALLOC(_32);
			_32 = _mat_mult_(tmp_A_0, A_size, true, tmp_B_1, B_size, true, tmp_C_2, C_size, false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_32));
			_CALLEE_DEALLOC(A, "false-false-false" , "mat_mult");
			_CALLEE_DEALLOC_POST(_32, A);
			_CALLEE_DEALLOC(B, "false-false-false" , "mat_mult");
			_CALLEE_DEALLOC_POST(_32, B);
			_CALLER_DEALLOC(C, "true-true-false" , "mat_mult");
			_CALLER_DEALLOC_POST(_32, tmp_C_2);
		}
		//assign %9 = %32  : int[]
		_DEALLOC(C);
		_COPY_1DARRAY_int64_t(C, _32);
		_ADD_DEALLOC(C);
		//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %34 = %33 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %35 = 1 : int
		_35 = 1;
		//sub %36 = %3, %35 : int
		_36=size-_35;
		//mul %37 = %36, %3 : int
		_37=_36*size;
		//add %38 = %37, %3 : int
		_38=_37+size;
		//const %39 = 1 : int
		_39 = 1;
		//sub %40 = %38, %39 : int
		_40=_38-_39;
		//indexof %41 = %9, %40 : int[]
		_41=C[_40];
		//indirectinvoke () = %34 (%41) : method(any)->()
		{
			printf("%"PRId64"\n", _41);
		}
		//const %42 = 1 : int
		_42 = 1;
		//add %43 = %6, %42 : int
		_43=repeats+_42;
		//assign %6 = %43  : int
		repeats = _43;
		//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %45 = %44 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %46 = [78,117,109,98,101,114,32,111,102,32,114,101,112,101,97,116,115,32] : int[]
		_DEALLOC(_46);
		_NEW_1DARRAY_int64_t(_46, 18, 0);
		_46[0] = 78; _46[1] = 117; _46[2] = 109; _46[3] = 98; _46[4] = 101; _46[5] = 114; _46[6] = 32; _46[7] = 111; _46[8] = 102; _46[9] = 32; _46[10] = 114; _46[11] = 101; _46[12] = 112; _46[13] = 101; _46[14] = 97; _46[15] = 116; _46[16] = 115; _46[17] = 32; 
		_ADD_DEALLOC(_46);
		//indirectinvoke () = %45 (%46) : method(int[])->()
		{
			printf_s(_46, _46_size);
		}
		//fieldload %47 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %48 = %47 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %48 (%6) : method(any)->()
		{
			printf("%"PRId64"\n", repeats);
		}
//.blklab12
blklab12:;
	}
//.blklab11
blklab11:;
	//fieldload %49 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %50 = %49 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %51 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_51);
	_NEW_1DARRAY_int64_t(_51, 25, 0);
	_51[0] = 80; _51[1] = 97; _51[2] = 115; _51[3] = 115; _51[4] = 32; _51[5] = 77; _51[6] = 97; _51[7] = 116; _51[8] = 114; _51[9] = 105; _51[10] = 120; _51[11] = 77; _51[12] = 117; _51[13] = 108; _51[14] = 116; _51[15] = 32; _51[16] = 116; _51[17] = 101; _51[18] = 115; _51[19] = 116; _51[20] = 32; _51[21] = 99; _51[22] = 97; _51[23] = 115; _51[24] = 101; 
	_ADD_DEALLOC(_51);
	//indirectinvoke () = %50 (%51) : method(int[])->()
	{
		println_s(_51, _51_size);
	}
//.blklab10
blklab10:;
	//return
	_DEALLOC(n);
	_DEALLOC(A);
	_DEALLOC(B);
	_DEALLOC(C);
	_DEALLOC(_10);
	_FREE_ARGS(_11);
	_DEALLOC(_13);
	_DEALLOC(_17);
	_DEALLOC(_23);
	_DEALLOC(_24);
	_DEALLOC(_27);
	_DEALLOC(_28);
	_DEALLOC(_31);
	_DEALLOC(_32);
	_DEALLOC(_46);
	_DEALLOC(_51);
	exit(0);
}

