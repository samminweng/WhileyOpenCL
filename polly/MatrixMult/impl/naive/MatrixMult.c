#include "MatrixMult.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_2DARRAY_COPY(new_Matrix->data, _Matrix->data);
	new_Matrix->width = _Matrix->width;
	new_Matrix->height = _Matrix->height;
	return new_Matrix;
}
void free_Matrix(Matrix* matrix){
	free2DArray(matrix->data, matrix->data_size);
	free(matrix);
}
void printf_Matrix(Matrix* matrix){
	printf("{");
	printf(" data:");
	_2DARRAY_PRINT(matrix->data);
	printf(" width:");
	printf("%d", matrix->width);
	printf(" height:");
	printf("%d", matrix->height);
	printf("}");
}
Matrix* matrix(long long width, long long height, _DECL_2DARRAY_PARAM(data)){
	Matrix* r;
	Matrix* _4;
	//newrecord %4 = (%2, %1, %0) : {int[][] data,int height,int width}
	_4 = malloc(sizeof(Matrix));
	_2DARRAY_COPY(_4->data, data);
	_4->height = height;
	_4->width = width;
	//return %4
	return _4;
	//return
}

Matrix* multiply(Matrix* A, Matrix* B){
	Matrix* C;
	_DECL_2DARRAY(C_data);
	long long i = 0;
	long long j = 0;
	long long r = 0;
	long long k = 0;
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
	_DECL_2DARRAY(_20);
	_DECL_1DARRAY(_21);
	long long _22 = 0;
	_DECL_2DARRAY(_23);
	_DECL_1DARRAY(_24);
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	Matrix* _34;
	long long _35 = 0;
	long long _36 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//fieldload %9 = %1 width : {int[][] data,int height,int width}
	_9 = B->width;
	//arraygen %10 = [8; 9] : int[]
	_GEN_1DARRAY(_10, _9, _8);
	//fieldload %11 = %0 height : {int[][] data,int height,int width}
	_11 = A->height;
	//arraygen %12 = [10; 11] : int[][]
	_GEN_2DARRAY(_12, _11, _10);
	//assign %3 = %12  : int[][]
	_2DARRAY_COPY(C_data, _12);
	//const %13 = 0 : int
	_13 = 0;
	//assign %4 = %13  : int
	i = _13;
	//loop (%3, %4, %5, %6, %7, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
	while(true){
		//fieldload %14 = %0 height : {int[][] data,int height,int width}
		_14 = A->height;
		//ifge %4, %14 goto blklab13 : int
		if(i>=_14){goto blklab13;}
		//const %15 = 0 : int
		_15 = 0;
		//assign %5 = %15  : int
		j = _15;
		//loop (%3, %5, %6, %7, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31)
		while(true){
			//fieldload %16 = %1 width : {int[][] data,int height,int width}
			_16 = B->width;
			//ifge %5, %16 goto blklab15 : int
			if(j>=_16){goto blklab15;}
			//const %17 = 0 : int
			_17 = 0;
			//assign %6 = %17  : int
			r = _17;
			//const %18 = 0 : int
			_18 = 0;
			//assign %7 = %18  : int
			k = _18;
			//loop (%6, %7, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29)
			while(true){
				//fieldload %19 = %0 width : {int[][] data,int height,int width}
				_19 = A->width;
				//ifge %7, %19 goto blklab17 : int
				if(k>=_19){goto blklab17;}
				//fieldload %20 = %0 data : {int[][] data,int height,int width}
				_2DARRAY_COPY(_20, A->data);
				//indexof %21 = %20, %4 : int[][]
				_21=_20[i];
				//indexof %22 = %21, %7 : int[]
				_22=_21[k];
				//fieldload %23 = %1 data : {int[][] data,int height,int width}
				_2DARRAY_COPY(_23, B->data);
				//indexof %24 = %23, %7 : int[][]
				_24=_23[k];
				//indexof %25 = %24, %5 : int[]
				_25=_24[j];
				//mul %26 = %22, %25 : int
				_26=_22*_25;
				//add %27 = %6, %26 : int
				_27=r+_26;
				//assign %6 = %27  : int
				r = _27;
				//const %28 = 1 : int
				_28 = 1;
				//add %29 = %7, %28 : int
				_29=k+_28;
				//assign %7 = %29  : int
				k = _29;
//.blklab18
blklab18:;
			}
//.blklab17
blklab17:;
			//update %3[%4][%5] = %6 : int[][] -> int[][]
			C_data[i][j] = r;
			//const %30 = 1 : int
			_30 = 1;
			//add %31 = %5, %30 : int
			_31=j+_30;
			//assign %5 = %31  : int
			j = _31;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
		//const %32 = 1 : int
		_32 = 1;
		//add %33 = %4, %32 : int
		_33=i+_32;
		//assign %4 = %33  : int
		i = _33;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//fieldload %35 = %1 width : {int[][] data,int height,int width}
	_35 = B->width;
	//fieldload %36 = %0 height : {int[][] data,int height,int width}
	_36 = A->height;
	//invoke (%34) = (%35, %36, %3) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[][])->(MatrixMult:Matrix)
	_34 = matrix(_35, _36, _2DARRAY_COPY_PARAM(C_data));
	//return %34
	return _34;
	//return
}

void printMat(FILE* sys, Matrix* A){
	long long i = 0;
	long long j = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	void* _8;
	_DECL_2DARRAY(_10);
	_DECL_1DARRAY(_11);
	long long _12 = 0;
	void* _13;
	_DECL_1DARRAY(_15);
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	void* _20;
	_DECL_1DARRAY(_22);
	//const %4 = 0 : int
	_4 = 0;
	//assign %2 = %4  : int
	i = _4;
	//loop (%2, %3, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
	while(true){
		//fieldload %5 = %1 height : {int[][] data,int height,int width}
		_5 = A->height;
		//ifge %2, %5 goto blklab19 : int
		if(i>=_5){goto blklab19;}
		//const %6 = 0 : int
		_6 = 0;
		//assign %3 = %6  : int
		j = _6;
		//loop (%3, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17)
		while(true){
			//fieldload %7 = %1 width : {int[][] data,int height,int width}
			_7 = A->width;
			//ifge %3, %7 goto blklab21 : int
			if(j>=_7){goto blklab21;}
			//fieldload %8 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %9 = %8 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//fieldload %10 = %1 data : {int[][] data,int height,int width}
			_2DARRAY_COPY(_10, A->data);
			//indexof %11 = %10, %2 : int[][]
			_11=_10[i];
			//indexof %12 = %11, %3 : int[]
			_12=_11[j];
			//indirectinvoke () = %9 (%12) : method(any)->()
			printf("%d\n", _12);
			//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %15 = [32] : int[]
			_NEW_ARRAY(_15, 1);
			_15[0] = 32; 
			//indirectinvoke () = %14 (%15) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_15));
			//const %16 = 1 : int
			_16 = 1;
			//add %17 = %3, %16 : int
			_17=j+_16;
			//assign %3 = %17  : int
			j = _17;
//.blklab22
blklab22:;
		}
//.blklab21
blklab21:;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %2, %18 : int
		_19=i+_18;
		//assign %2 = %19  : int
		i = _19;
		//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %21 = %20 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %22 = [] : void[]
		_NEW_ARRAY(_22, 0);
		//indirectinvoke () = %21 (%22) : method(int[])->()
		println_s(_1DARRAY_PARAM(_22));
//.blklab20
blklab20:;
	}
//.blklab19
blklab19:;
	//return
}

Matrix* genMatrix(long long height, long long width){
	Matrix* r;
	_DECL_2DARRAY(rows);
	long long i = 0;
	long long j = 0;
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
	Matrix* _16;
	//const %6 = 0 : int
	_6 = 0;
	//arraygen %7 = [6; 1] : int[]
	_GEN_1DARRAY(_7, width, _6);
	//arraygen %8 = [7; 0] : int[][]
	_GEN_2DARRAY(_8, height, _7);
	//assign %3 = %8  : int[][]
	_2DARRAY_COPY(rows, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	i = _9;
	//loop (%3, %4, %5, %10, %11, %12, %13, %14, %15)
	while(true){
		//ifge %4, %0 goto blklab23 : int
		if(i>=height){goto blklab23;}
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		j = _10;
		//loop (%3, %5, %11, %12, %13)
		while(true){
			//ifge %5, %1 goto blklab25 : int
			if(j>=width){goto blklab25;}
			//const %11 = 1 : int
			_11 = 1;
			//update %3[%4][%5] = %11 : int[][] -> int[][]
			rows[i][j] = _11;
			//const %12 = 1 : int
			_12 = 1;
			//add %13 = %5, %12 : int
			_13=j+_12;
			//assign %5 = %13  : int
			j = _13;
//.blklab26
blklab26:;
		}
//.blklab25
blklab25:;
		//const %14 = 1 : int
		_14 = 1;
		//add %15 = %4, %14 : int
		_15=i+_14;
		//assign %4 = %15  : int
		i = _15;
//.blklab24
blklab24:;
	}
//.blklab23
blklab23:;
	//invoke (%16) = (%1, %0, %3) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[][])->(MatrixMult:Matrix)
	_16 = matrix(width, height, _2DARRAY_COPY_PARAM(rows));
	//return %16
	return _16;
	//return
}

int main(int argc, char** args){
	long long max;
	Matrix* A;
	Matrix* B;
	Matrix* C;
	long long _5;
	_DECL_2DARRAY(_6);
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	Matrix* _9;
	Matrix* _10;
	Matrix* _11;
	_DECL_2DARRAY(_12);
	long long _13 = 0;
	_DECL_1DARRAY(_14);
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	void* _19;
	_DECL_1DARRAY(_21);
	void* _22;
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_5, _8);
	//assign %1 = %5  : null|int
	max = _5;
	//ifis %1, null goto blklab27 : null|int
	if(max == NULL) { goto blklab27;}
	//invoke (%9) = (%1, %1) MatrixMult:genMatrix : function(MatrixMult:nat,MatrixMult:nat)->(MatrixMult:Matrix)
	_9 = genMatrix(max, max);
	//assign %2 = %9  : {int[][] data,int height,int width}
	A = copy_Matrix(_9);
	//invoke (%10) = (%1, %1) MatrixMult:genMatrix : function(MatrixMult:nat,MatrixMult:nat)->(MatrixMult:Matrix)
	_10 = genMatrix(max, max);
	//assign %3 = %10  : {int[][] data,int height,int width}
	B = copy_Matrix(_10);
	//invoke (%11) = (%2, %3) MatrixMult:multiply : function(MatrixMult:Matrix,MatrixMult:Matrix)->(MatrixMult:Matrix)
	_11 = multiply(_STRUCT_COPY_PARAM(A, Matrix), _STRUCT_COPY_PARAM(B, Matrix));
	//assign %4 = %11  : {int[][] data,int height,int width}
	C = copy_Matrix(_11);
	//assert
	{
		//fieldload %12 = %4 data : {int[][] data,int height,int width}
		_2DARRAY_COPY(_12, C->data);
		//const %13 = 0 : int
		_13 = 0;
		//indexof %14 = %12, %13 : int[][]
		_14=_12[_13];
		//const %15 = 0 : int
		_15 = 0;
		//indexof %16 = %14, %15 : int[]
		_16=_14[_15];
		//ifeq %16, %1 goto blklab28 : int
		if(_16==max){goto blklab28;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab28
blklab28:;
	//assert
	}
	//assert
	{
		//fieldload %17 = %4 width : {int[][] data,int height,int width}
		_17 = C->width;
		//ifeq %17, %1 goto blklab29 : int
		if(_17==max){goto blklab29;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab29
blklab29:;
	//assert
	}
	//assert
	{
		//fieldload %18 = %4 height : {int[][] data,int height,int width}
		_18 = C->height;
		//ifeq %18, %1 goto blklab30 : int
		if(_18==max){goto blklab30;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab30
blklab30:;
	//assert
	}
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %21 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101,32,119,105,116,104,32,105,110,112,117,116,32,61,32] : int[]
	_NEW_ARRAY(_21, 39);
	_21[0] = 80; _21[1] = 97; _21[2] = 115; _21[3] = 115; _21[4] = 32; _21[5] = 77; _21[6] = 97; _21[7] = 116; _21[8] = 114; _21[9] = 105; _21[10] = 120; _21[11] = 77; _21[12] = 117; _21[13] = 108; _21[14] = 116; _21[15] = 32; _21[16] = 116; _21[17] = 101; _21[18] = 115; _21[19] = 116; _21[20] = 32; _21[21] = 99; _21[22] = 97; _21[23] = 115; _21[24] = 101; _21[25] = 32; _21[26] = 119; _21[27] = 105; _21[28] = 116; _21[29] = 104; _21[30] = 32; _21[31] = 105; _21[32] = 110; _21[33] = 112; _21[34] = 117; _21[35] = 116; _21[36] = 32; _21[37] = 61; _21[38] = 32; 
	//indirectinvoke () = %20 (%21) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_21));
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %23 (%1) : method(any)->()
	printf("%d\n", max);
//.blklab27
blklab27:;
	//return
	exit(0);
}
