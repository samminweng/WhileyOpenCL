#include "MatrixMult.h"
Matrix copy_Matrix(Matrix _Matrix){
	Matrix new_Matrix;
	_2DARRAY_COPY(new_Matrix.data, _Matrix.data);
	new_Matrix.width = _Matrix.width;
	new_Matrix.height = _Matrix.height;
	return new_Matrix;
}
void free_Matrix(Matrix _matrix){
	free2DArray(_matrix.data, _matrix.data_size);
}
void printf_Matrix(Matrix _matrix){
	printf("{");
	printf(" data:");
	_2DARRAY_PRINT(_matrix.data);
	printf(" width:");
	printf("%d", _matrix.width);
	printf(" height:");
	printf("%d", _matrix.height);
	printf("}");
}
Matrix matrix(long long width, long long height, _DECL_2DARRAY_PARAM(data)){
	Matrix _3;
	//newrecord %3 = (%2, %1, %0) : {int[][] data,int height,int width}
	_2DARRAY_COPY(_3.data, data);
	_3.height = height;
	_3.width = width;
	//return %3 : {int[][] data,int height,int width}
	return _3;
	//return
}

Matrix multiply(Matrix A, Matrix B){
	_DECL_2DARRAY(C_data);
	long long i = 0;
	long long j = 0;
	long long r = 0;
	long long k = 0;
	_DECL_2DARRAY(_7);
	long long _8 = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	long long _11 = 0;
	_DECL_2DARRAY(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	_DECL_2DARRAY(_24);
	_DECL_1DARRAY(_25);
	long long _26 = 0;
	_DECL_2DARRAY(_27);
	_DECL_1DARRAY(_28);
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	Matrix _38;
	long long _39 = 0;
	long long _40 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//fieldload %9 = %1 width : {int[][] data,int height,int width}
	_9 = B.width;
	//listgen %10 = [8; 9] : int[]
	_GEN_1DARRAY(_10, _9, _8);
	//fieldload %11 = %0 height : {int[][] data,int height,int width}
	_11 = A.height;
	//listgen %12 = [10; 11] : int[][]
	_GEN_2DARRAY(_12, _11, _10);
	//assign %7 = %12  : int[][]
	_2DARRAY_UPDATE(_7, _12);
	//assign %2 = %7  : int[][]
	_2DARRAY_UPDATE(C_data, _7);
	//const %14 = 0 : int
	_14 = 0;
	//assign %13 = %14  : int
	_13 = _14;
	//assign %3 = %13  : int
	i = _13;
	//loop (%2, %3, %4, %5, %6, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37)
	while(true){
		//fieldload %15 = %0 height : {int[][] data,int height,int width}
		_15 = A.height;
		//ifge %3, %15 goto blklab13 : int
		if(i>=_15){goto blklab13;}
		//const %17 = 0 : int
		_17 = 0;
		//assign %16 = %17  : int
		_16 = _17;
		//assign %4 = %16  : int
		j = _16;
		//loop (%2, %4, %5, %6, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35)
		while(true){
			//fieldload %18 = %1 width : {int[][] data,int height,int width}
			_18 = B.width;
			//ifge %4, %18 goto blklab14 : int
			if(j>=_18){goto blklab14;}
			//const %20 = 0 : int
			_20 = 0;
			//assign %19 = %20  : int
			_19 = _20;
			//assign %5 = %19  : int
			r = _19;
			//const %22 = 0 : int
			_22 = 0;
			//assign %21 = %22  : int
			_21 = _22;
			//assign %6 = %21  : int
			k = _21;
			//loop (%5, %6, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
			while(true){
				//fieldload %23 = %0 width : {int[][] data,int height,int width}
				_23 = A.width;
				//ifge %6, %23 goto blklab15 : int
				if(k>=_23){goto blklab15;}
				//fieldload %24 = %0 data : {int[][] data,int height,int width}
				_2DARRAY_UPDATE(_24, A.data);
				//indexof %25 = %24, %3 : int[][]
				_25=_24[i];
				//indexof %26 = %25, %6 : int[]
				_26=_25[k];
				//fieldload %27 = %1 data : {int[][] data,int height,int width}
				_2DARRAY_UPDATE(_27, B.data);
				//indexof %28 = %27, %6 : int[][]
				_28=_27[k];
				//indexof %29 = %28, %4 : int[]
				_29=_28[j];
				//mul %30 = %26, %29 : int
				_30=_26*_29;
				//add %31 = %5, %30 : int
				_31=r+_30;
				//assign %5 = %31  : int
				r = _31;
				//const %32 = 1 : int
				_32 = 1;
				//add %33 = %6, %32 : int
				_33=k+_32;
				//assign %6 = %33  : int
				k = _33;
			}
//.blklab15
blklab15:;
			//update %2[%3][%4] = %5 : int[][] -> int[][]
			C_data[i][j] = r;
			//const %34 = 1 : int
			_34 = 1;
			//add %35 = %4, %34 : int
			_35=j+_34;
			//assign %4 = %35  : int
			j = _35;
		}
//.blklab14
blklab14:;
		//const %36 = 1 : int
		_36 = 1;
		//add %37 = %3, %36 : int
		_37=i+_36;
		//assign %3 = %37  : int
		i = _37;
	}
//.blklab13
blklab13:;
	//fieldload %39 = %1 width : {int[][] data,int height,int width}
	_39 = B.width;
	//fieldload %40 = %0 height : {int[][] data,int height,int width}
	_40 = A.height;
	//invoke %38 = (%39, %40, %2) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[][]) -> MatrixMult:Matrix
	_38 = matrix(_39, _40, _2DARRAY_PARAM(C_data));
	//return %38 : {int[][] data,int height,int width}
	return _38;
	//return
}

void* printMat(FILE* sys, Matrix A){
	long long i = 0;
	long long j = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	void* _10;
	_DECL_2DARRAY(_12);
	_DECL_1DARRAY(_13);
	long long _14 = 0;
	void* _15;
	_DECL_1DARRAY(_17);
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	void* _22;
	_DECL_1DARRAY(_24);
	//const %5 = 0 : int
	_5 = 0;
	//assign %4 = %5  : int
	_4 = _5;
	//assign %2 = %4  : int
	i = _4;
	//loop (%2, %3, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24)
	while(true){
		//fieldload %6 = %1 height : {int[][] data,int height,int width}
		_6 = A.height;
		//ifge %2, %6 goto blklab16 : int
		if(i>=_6){goto blklab16;}
		//const %8 = 0 : int
		_8 = 0;
		//assign %7 = %8  : int
		_7 = _8;
		//assign %3 = %7  : int
		j = _7;
		//loop (%3, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19)
		while(true){
			//fieldload %9 = %1 width : {int[][] data,int height,int width}
			_9 = A.width;
			//ifge %3, %9 goto blklab17 : int
			if(j>=_9){goto blklab17;}
			//fieldload %10 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %11 = %10 print : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//fieldload %12 = %1 data : {int[][] data,int height,int width}
			_2DARRAY_UPDATE(_12, A.data);
			//indexof %13 = %12, %2 : int[][]
			_13=_12[i];
			//indexof %14 = %13, %3 : int[]
			_14=_13[j];
			//indirectinvoke %11 (%14) : method(any) -> void
			printf("%d\n", _14);
			//fieldload %15 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %16 = %15 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//const %17 = [32] : int[]
			_NEW_ARRAY(_17, 1);
			_17[0] = 32; 
			//indirectinvoke %16 (%17) : method(int[]) -> void
			printf_s(_1DARRAY_PARAM(_17));
			//const %18 = 1 : int
			_18 = 1;
			//add %19 = %3, %18 : int
			_19=j+_18;
			//assign %3 = %19  : int
			j = _19;
		}
//.blklab17
blklab17:;
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %2, %20 : int
		_21=i+_20;
		//assign %2 = %21  : int
		i = _21;
		//fieldload %22 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %23 = %22 println_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//const %24 = [] : void[]
		_NEW_ARRAY(_24, 0);
		//indirectinvoke %23 (%24) : method(int[]) -> void
		println_s(_1DARRAY_PARAM(_24));
	}
//.blklab16
blklab16:;
	//return
}

Matrix genMatrix(long long height, long long width){
	_DECL_2DARRAY(rows);
	long long i = 0;
	long long j = 0;
	_DECL_2DARRAY(_5);
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_2DARRAY(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	Matrix _19;
	//const %6 = 0 : int
	_6 = 0;
	//listgen %7 = [6; 1] : int[]
	_GEN_1DARRAY(_7, width, _6);
	//listgen %8 = [7; 0] : int[][]
	_GEN_2DARRAY(_8, height, _7);
	//assign %5 = %8  : int[][]
	_2DARRAY_UPDATE(_5, _8);
	//assign %2 = %5  : int[][]
	_2DARRAY_UPDATE(rows, _5);
	//const %10 = 0 : int
	_10 = 0;
	//assign %9 = %10  : int
	_9 = _10;
	//assign %3 = %9  : int
	i = _9;
	//loop (%2, %3, %4, %11, %12, %13, %14, %15, %16, %17, %18)
	while(true){
		//ifge %3, %0 goto blklab18 : int
		if(i>=height){goto blklab18;}
		//const %12 = 0 : int
		_12 = 0;
		//assign %11 = %12  : int
		_11 = _12;
		//assign %4 = %11  : int
		j = _11;
		//loop (%2, %4, %13, %14, %15, %16)
		while(true){
			//ifge %4, %1 goto blklab19 : int
			if(j>=width){goto blklab19;}
			//const %13 = 1 : int
			_13 = 1;
			//const %14 = 1 : int
			_14 = 1;
			//update %2[%3][%4] = %14 : int[][] -> int[][]
			rows[i][j] = _14;
			//const %15 = 1 : int
			_15 = 1;
			//add %16 = %4, %15 : int
			_16=j+_15;
			//assign %4 = %16  : int
			j = _16;
		}
//.blklab19
blklab19:;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=i+_17;
		//assign %3 = %18  : int
		i = _18;
	}
//.blklab18
blklab18:;
	//invoke %19 = (%1, %0, %2) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[][]) -> MatrixMult:Matrix
	_19 = matrix(width, height, _2DARRAY_PARAM(rows));
	//return %19 : {int[][] data,int height,int width}
	return _19;
	//return
}

int main(int argc, char** args){
	long long max;
	Matrix A;
	Matrix B;
	Matrix C;
	long long _5;
	long long _6;
	_DECL_2DARRAY(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	Matrix _10;
	Matrix _11;
	Matrix _12;
	Matrix _13;
	Matrix _14;
	Matrix _15;
	_DECL_2DARRAY(_16);
	long long _17 = 0;
	_DECL_1DARRAY(_18);
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	void* _23;
	_DECL_1DARRAY(_25);
	void* _26;
	//fieldload %7 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_CONV_ARGS(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	//invoke %6 = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_STR_TO_INT(_6, _9);
	//assign %5 = %6  : null|int
	_5 = _6;
	//assign %1 = %5  : null|int
	max = _5;
	//ifis %1, null goto blklab20 : null|int
	if(max == NULL) { goto blklab20;}
	//invoke %11 = (%1, %1) MatrixMult:genMatrix : function(MatrixMult:nat,MatrixMult:nat) -> MatrixMult:Matrix
	_11 = genMatrix(max, max);
	//assign %10 = %11  : {int[][] data,int height,int width}
	_10 = _11;
	//assign %2 = %10  : {int[][] data,int height,int width}
	A = _10;
	//invoke %13 = (%1, %1) MatrixMult:genMatrix : function(MatrixMult:nat,MatrixMult:nat) -> MatrixMult:Matrix
	_13 = genMatrix(max, max);
	//assign %12 = %13  : {int[][] data,int height,int width}
	_12 = _13;
	//assign %3 = %12  : {int[][] data,int height,int width}
	B = _12;
	//invoke %15 = (%2, %3) MatrixMult:multiply : function(MatrixMult:Matrix,MatrixMult:Matrix) -> MatrixMult:Matrix
	_15 = multiply(_STRUCT_PARAM(A), _STRUCT_PARAM(B));
	//assign %14 = %15  : {int[][] data,int height,int width}
	_14 = _15;
	//assign %4 = %14  : {int[][] data,int height,int width}
	C = _14;
	//assert
	{
		//fieldload %16 = %4 data : {int[][] data,int height,int width}
		_2DARRAY_UPDATE(_16, C.data);
		//const %17 = 0 : int
		_17 = 0;
		//indexof %18 = %16, %17 : int[][]
		_18=_16[_17];
		//const %19 = 0 : int
		_19 = 0;
		//indexof %20 = %18, %19 : int[]
		_20=_18[_19];
		//ifeq %20, %1 goto blklab21 : int
		if(_20==max){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//assert
	{
		//fieldload %21 = %4 width : {int[][] data,int height,int width}
		_21 = C.width;
		//ifeq %21, %1 goto blklab22 : int
		if(_21==max){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//assert
	{
		//fieldload %22 = %4 height : {int[][] data,int height,int width}
		_22 = C.height;
		//ifeq %22, %1 goto blklab23 : int
		if(_22==max){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %24 = %23 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %25 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101,32,119,105,116,104,32,105,110,112,117,116,32,61,32] : int[]
	_NEW_ARRAY(_25, 39);
	_25[0] = 80; _25[1] = 97; _25[2] = 115; _25[3] = 115; _25[4] = 32; _25[5] = 77; _25[6] = 97; _25[7] = 116; _25[8] = 114; _25[9] = 105; _25[10] = 120; _25[11] = 77; _25[12] = 117; _25[13] = 108; _25[14] = 116; _25[15] = 32; _25[16] = 116; _25[17] = 101; _25[18] = 115; _25[19] = 116; _25[20] = 32; _25[21] = 99; _25[22] = 97; _25[23] = 115; _25[24] = 101; _25[25] = 32; _25[26] = 119; _25[27] = 105; _25[28] = 116; _25[29] = 104; _25[30] = 32; _25[31] = 105; _25[32] = 110; _25[33] = 112; _25[34] = 117; _25[35] = 116; _25[36] = 32; _25[37] = 61; _25[38] = 32; 
	//indirectinvoke %24 (%25) : method(int[]) -> void
	printf_s(_1DARRAY_PARAM(_25));
	//fieldload %26 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %27 = %26 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//indirectinvoke %27 (%1) : method(any) -> void
	printf("%d\n", max);
//.blklab20
blklab20:;
	//return
	exit(0);
}

