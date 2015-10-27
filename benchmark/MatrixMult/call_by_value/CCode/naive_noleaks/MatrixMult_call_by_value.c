#include "MatrixMult_call_by_value.h"
void free_Matrix(Matrix m){
	free2DArray(m.data, m.data_size);
}

Matrix clone_Matrix(Matrix m){
	Matrix newMatrix;
	newMatrix.height = m.height;
	newMatrix.width = m.width;
	newMatrix.data_size = m.data_size;
	newMatrix.data_size_size = m.data_size_size;
	newMatrix.data = clone2DArray(m.data, m.data_size, m.data_size_size);
	return newMatrix;
}

Matrix matrix(nat _width, nat _height, long long** _data, long long _data_size, long long _data_size_size){
	Matrix _3;
	//newrecord %3 = (%2, %1, %0) : {int[][] data,int height,int width}
	_3.data_size = _data_size;
	_3.data_size_size = _data_size_size;
	_3.data = clone2DArray(_data, _data_size, _data_size_size);
	_3.width = _width;
	_3.height = _height;
	//return %3 : {int[][] data,int height,int width}
	return _3;
	//return
	
}
Matrix multiply(Matrix A, Matrix B){
	long long** C_data = NULL;
	long long C_data_size = 0;
	long long C_data_size_size =0;
	nat _i;
	nat _j;
	long long _r = 0;
	nat _k;
	long long** _7 = NULL;
	long long _7_size = 0;
	long long _7_size_size =0;
	long long _8 = 0;
	long long _9 = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	long long _10_size_size = 0;
	long long _11 = 0;
	long long** _12 = NULL;
	long long _12_size = 0;
	long long _12_size_size = 0;
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
	long long** _24 = NULL;
	long long _24_size = 0;
	long long _24_size_size = 0;
	long long* _25 = NULL;
	long long _25_size = 0;
	long long _25_size_size = 0;
	long long _26 = 0;
	long long** _27 = NULL;
	long long _27_size = 0;
	long long _27_size_size = 0;
	long long* _28 = NULL;
	long long _28_size = 0;
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
	_10 = genArray(_8, _9);
	_10_size = _9;
	//fieldload %11 = %0 height : {int[][] data,int height,int width}
	_11 = A.height;
	//listgen %12 = [10; 11] : int[][]
	_12 = gen2DArray(_10, _10_size, _11);
	_12_size = _11;
	_12_size_size = _10_size;
	//assign %7 = %12  : int[][]
	_7_size = _12_size;
	_7_size_size = _12_size_size;
	_7 = clone2DArray(_12, _12_size, _12_size_size);
	//assign %2 = %7  : int[][]
	C_data_size = _7_size;
	C_data_size_size = _7_size_size;
	C_data = clone2DArray(_7, _7_size, _7_size_size);
	//const %14 = 0 : int
	_14 = 0;
	//assign %13 = %14  : int
	_13 = _14;
	//assign %3 = %13  : int
	_i = _13;
	//fieldload %15 = %0 height : {int[][] data,int height,int width}
	_15 = A.height;
	//ifge %3, %15 goto blklab13 : int
	while(_i<_15){
		//const %17 = 0 : int
		_17 = 0;
		//assign %16 = %17  : int
		_16 = _17;
		//assign %4 = %16  : int
		_j = _16;
		//fieldload %18 = %1 width : {int[][] data,int height,int width}
		_18 = B.width;
		//ifge %4, %18 goto blklab14 : int
		while(_j<_18){
			//const %20 = 0 : int
			_20 = 0;
			//assign %19 = %20  : int
			_19 = _20;
			//assign %5 = %19  : int
			_r = _19;
			//const %22 = 0 : int
			_22 = 0;
			//assign %21 = %22  : int
			_21 = _22;
			//assign %6 = %21  : int
			_k = _21;
			//fieldload %23 = %0 width : {int[][] data,int height,int width}
			_23 = A.width;
			//ifge %6, %23 goto blklab15 : int
			while(_k<_23){
				//fieldload %24 = %0 data : {int[][] data,int height,int width}
				_24_size = A.data_size;
				_24_size_size = A.data_size_size;
				_24 = clone2DArray(A.data, A.data_size, A.data_size_size);
				//indexof %25 = %24, %3 : int[][]
				_25=_24[_i];
				//indexof %26 = %25, %6 : int[]
				_26=_25[_k];
				//fieldload %27 = %1 data : {int[][] data,int height,int width}
				_27_size = B.data_size;
				_27_size_size = B.data_size_size;
				_27 = clone2DArray(B.data,B.data_size, B.data_size_size);
				//indexof %28 = %27, %6 : int[][]
				_28=_27[_k];
				//indexof %29 = %28, %4 : int[]
				_29=_28[_j];
				//mul %30 = %26, %29 : int
				_30=_26*_29;
				//add %31 = %5, %30 : int
				_31=_r+_30;
				//assign %5 = %31  : int
				_r = _31;
				//const %32 = 1 : int
				_32 = 1;
				//add %33 = %6, %32 : int
				_33=_k+_32;
				//assign %6 = %33  : int
				_k = _33;
				free2DArray(_24, _24_size);
				free2DArray(_27, _27_size);
			}
//.blklab15
blklab15:;
			//update %2[%3][%4] = %5 : int[][] -> int[][]
			C_data[_i][_j] = _r;
			//const %34 = 1 : int
			_34 = 1;
			//add %35 = %4, %34 : int
			_35=_j+_34;
			//assign %4 = %35  : int
			_j = _35;
		}
//.blklab14
blklab14:;
		//const %36 = 1 : int
		_36 = 1;
		//add %37 = %3, %36 : int
		_37=_i+_36;
		//assign %3 = %37  : int
		_i = _37;
	}
//.blklab13
blklab13:;
	//fieldload %39 = %1 width : {int[][] data,int height,int width}
	_39 = B.width;
	//fieldload %40 = %0 height : {int[][] data,int height,int width}
	_40 = A.height;
	//invoke %38 = (%39, %40, %2) MatrixMult_callBy_value:matrix : function(MatrixMult_callBy_value:nat,MatrixMult_callBy_value:nat,int[][]) -> MatrixMult_callBy_value:Matrix
	_38 = matrix(_39 ,_40 ,clone2DArray(C_data, C_data_size, C_data_size_size), C_data_size, C_data_size_size);
	//return %38 : {int[][] data,int height,int width}
	return _38;
	//return
	
}
void printMat(FILE* _sys, Matrix A){
	long long _i = 0;
	long long _j = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long** _12 = NULL;
	long long _12_size = 0;
	long long _12_size_size = 0;
	long long* _13 = NULL;
	long long _13_size = 0;
	long long _14 = 0;
	long long* _17 = NULL;
	long long _17_size = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	void* _24 = NULL;
	long long _24_size = 0;
	//const %5 = 0 : int
	_5 = 0;
	//assign %4 = %5  : int
	_4 = _5;
	//assign %2 = %4  : int
	_i = _4;
	//fieldload %6 = %1 height : {int[][] data,int height,int width}
	_6 = A.height;
	//ifge %2, %6 goto blklab16 : int
	while(_i<_6){
		//const %8 = 0 : int
		_8 = 0;
		//assign %7 = %8  : int
		_7 = _8;
		//assign %3 = %7  : int
		_j = _7;
		//fieldload %9 = %1 width : {int[][] data,int height,int width}
		_9 = A.width;
		//ifge %3, %9 goto blklab17 : int
		while(_j<_9){
			//fieldload %10 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %11 = %10 print : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//fieldload %12 = %1 data : {int[][] data,int height,int width}
			_12_size = A.data_size;
			_12_size_size = A.data_size_size;
			_12 = clone2DArray(A.data, A.data_size, A.data_size_size);
			//indexof %13 = %12, %2 : int[][]
			_13=_12[_i];
			//indexof %14 = %13, %3 : int[]
			_14=_13[_j];
			//indirectinvoke %11 (%14) : method(any) -> void
			printf("%d", _14);
			//fieldload %15 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %16 = %15 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//const %17 = [32] : int[]
			long long _17_value[] = {32};
			_17 = _17_value;
			_17_size = 1;
			//indirectinvoke %16 (%17) : method(int[]) -> void
			printf_s(_17, _17_size);
			//const %18 = 1 : int
			_18 = 1;
			//add %19 = %3, %18 : int
			_19=_j+_18;
			//assign %3 = %19  : int
			_j = _19;
		}
//.blklab17
blklab17:;
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %2, %20 : int
		_21=_i+_20;
		//assign %2 = %21  : int
		_i = _21;
		//fieldload %22 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %23 = %22 println_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//const %24 = [] : void[]
		_24=(long long*)malloc(1*sizeof(long long));
		if(_24 == NULL) {fprintf(stderr,"fail to malloc");
 exit(-1);}
		_24_size = 0;
		//indirectinvoke %23 (%24) : method(int[]) -> void
		println_s(_24, _24_size);
	}
//.blklab16
blklab16:;
	//return
	
}
Matrix genMatrix(nat _height, nat _width){
	long long** _rows = NULL;
	long long _rows_size = 0;
	long long _rows_size_size =0;
	long long _i = 0;
	long long _j = 0;
	long long** _5 = NULL;
	long long _5_size = 0;
	long long _5_size_size = 0;
	long long _6 = 0;
	long long* _7 = NULL;
	long long _7_size = 0;
	long long** _8 = NULL;
	long long _8_size = 0;
	long long _8_size_size = 0;
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
	_7 = genArray(_6, _width);
	_7_size = _width;
	//listgen %8 = [7; 0] : int[][]
	_8_size = _height;
	_8_size_size = _7_size;
	_8 = gen2DArray(_7, _8_size, _8_size_size);
	//assign %5 = %8  : int[][]
	_5_size = _8_size;
	_5_size_size = _8_size_size;
	_5 = clone2DArray(_8, _8_size, _8_size_size);
	//assign %2 = %5  : int[][]
	_rows_size = _5_size;
	_rows_size_size = _5_size_size;
	_rows = clone2DArray(_5, _5_size, _5_size_size);
	//const %10 = 0 : int
	_10 = 0;
	//assign %9 = %10  : int
	_9 = _10;
	//assign %3 = %9  : int
	_i = _9;
	//ifge %3, %0 goto blklab18 : int
	while(_i<_height){
		//const %12 = 0 : int
		_12 = 0;
		//assign %11 = %12  : int
		_11 = _12;
		//assign %4 = %11  : int
		_j = _11;
		//ifge %4, %1 goto blklab19 : int
		while(_j<_width){
			//const %13 = 1 : int
			_13 = 1;
			//const %14 = 1 : int
			_14 = 1;
			//update %2[%3][%4] = %14 : int[][] -> int[][]
			_rows[_i][_j] = _14;
			//const %15 = 1 : int
			_15 = 1;
			//add %16 = %4, %15 : int
			_16=_j+_15;
			//assign %4 = %16  : int
			_j = _16;
		}
//.blklab19
blklab19:;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=_i+_17;
		//assign %3 = %18  : int
		_i = _18;
	}
//.blklab18
blklab18:;
	//invoke %19 = (%1, %0, %2) MatrixMult_callBy_value:matrix : function(MatrixMult_callBy_value:nat,MatrixMult_callBy_value:nat,int[][]) -> MatrixMultCallBy_value:Matrix
	_19 = matrix(_width, _height, clone2DArray(_rows, _rows_size, _rows_size_size), _rows_size, _rows_size_size);
	free(_7);
	free2DArray(_8, _8_size);
	free2DArray(_5, _5_size);
	free2DArray(_rows, _rows_size);
	//return %19 : {int[][] data,int height,int width}
	return _19;
	//return
	
}
int main(int argc, char** args){
	long long _max;
	Matrix A;
	Matrix B;
	Matrix C;
	long long _5;
	long long _6;
	long long** _7 = NULL;
	long long _7_size = 0;
	long long _7_size_size = 0;
	long long _8 = 0;
	long long* _9 = NULL;
	long long _9_size = 0;
	long long _9_size_size = 0;
	Matrix _10;
	Matrix _11;
	Matrix _12;
	Matrix _13;
	Matrix _14;
	Matrix _15;
	long long** _16 = NULL;
	long long _16_size = 0;
	long long _16_size_size = 0;
	long long _17 = 0;
	long long* _18 = NULL;
	long long _18_size = 0;
	long long _18_size_size = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	//fieldload %7 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_7 = convertArgsToIntArray(argc, args);
	_7_size = argc - 1;
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	//invoke %6 = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_6 = parseInteger(_9);
	//assign %5 = %6  : null|int
	_5 = _6;
	//assign %1 = %5  : null|int
	_max = _5;
	//ifis %1, null goto blklab20 : null|int
	if(_max == NULL) { goto blklab20;}
	//invoke %11 = (%1, %1) MatrixMult_callBy_value:genMatrix : function(MatrixMult_callBy_value:nat,MatrixMult_callBy_value:nat) -> MatrixMult_callBy_value:Matrix
	_11 = genMatrix(_max ,_max);
	//assign %10 = %11  : {int[][] data,int height,int width}
	_10 = clone_Matrix(_11);
	//assign %2 = %10  : {int[][] data,int height,int width}
	A = clone_Matrix(_10);
	//invoke %13 = (%1, %1) MatrixMult_callBy_value:genMatrix : function(MatrixMult_callBy_value:nat,MatrixMult_callBy_value:nat) -> MatrixMult_callBy_value:Matrix
	_13 = genMatrix(_max ,_max);
	//assign %12 = %13  : {int[][] data,int height,int width}
	_12 = clone_Matrix(_13);
	//assign %3 = %12  : {int[][] data,int height,int width}
	B = clone_Matrix(_12);
	//invoke %15 = (%2, %3) MatrixMult_callBy_value:multiply : function(MatrixMult_callBy_value:Matrix,MatrixMult_callBy_value:Matrix) -> MatrixMult_callBy_value:Matrix
	_15 = multiply(clone_Matrix(A) ,clone_Matrix(B));
	//assign %14 = %15  : {int[][] data,int height,int width}
	_14 = clone_Matrix(_15);
	//assign %4 = %14  : {int[][] data,int height,int width}
	C = clone_Matrix(_14);
	//assert
	{
		//fieldload %16 = %4 data : {int[][] data,int height,int width}
		_16_size = C.data_size;
		_16_size_size = C.data_size_size;
		_16 = clone2DArray(C.data, C.data_size, C.data_size_size);
		//const %17 = 0 : int
		_17 = 0;
		//indexof %18 = %16, %17 : int[][]
		_18=_16[_17];
		//const %19 = 0 : int
		_19 = 0;
		//indexof %20 = %18, %19 : int[]
		_20=_18[_19];
		//ifeq %20, %1 goto blklab21 : int
		if(_20==_max){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
		free2DArray(_16, _16_size);
	//assert
	}
	//assert
	{
		//fieldload %21 = %4 width : {int[][] data,int height,int width}
		_21 = C.width;
		//ifeq %21, %1 goto blklab22 : int
		if(_21==_max){goto blklab22;}
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
		if(_22==_max){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//invoke %(%0, %4) MatrixMult_callBy_value:printMat : method(whiley/lang/System:Console,MatrixMult_callBy_value:Matrix) -> void
	printMat(stdout ,clone_Matrix(C));
//.blklab20
blklab20:;
	free_Matrix(_10);
	free_Matrix(_11);
	free_Matrix(A);
	free_Matrix(_13);
	free_Matrix(_12);
	free_Matrix(B);
	free_Matrix(_15);
	free_Matrix(_14);
	free_Matrix(C);
	//return
	exit(0);
}
