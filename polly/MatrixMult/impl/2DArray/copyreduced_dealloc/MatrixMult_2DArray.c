#include "MatrixMult_2DArray.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_COPY_2DARRAY_LONGLONG(new_Matrix->data, _Matrix->data);
	new_Matrix->width = _Matrix->width;
	new_Matrix->height = _Matrix->height;
	return new_Matrix;
}
Matrix** copy_array_Matrix(Matrix** _Matrix, long long _Matrix_size){
	Matrix** new_Matrix = malloc(_Matrix_size*sizeof(Matrix*));
	for(int i=0;i<_Matrix_size;i++){
		new_Matrix[i] = copy_Matrix(_Matrix[i]);
	}
	return new_Matrix;
}
void free_Matrix(Matrix* matrix){
	free2DArray_LONGLONG(matrix->data, matrix->data_size);
	matrix->data = NULL;
	free(matrix);
}
void printf_Matrix(Matrix* matrix){
	printf("{");
	printf(" data:");
	_PRINT_2DARRAY_LONGLONG(matrix->data);
	printf(" width:");
	printf("%lld", matrix->width);
	printf(" height:");
	printf("%lld", matrix->height);
	printf("}");
}
Matrix* matrix(long long width, long long height, _DECL_2DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data)){
	Matrix* r;
	_DECL_DEALLOC(r);
	Matrix* _4;
	_DECL_DEALLOC(_4);
	//newrecord %4 = (%2, %1, %0) : {int[][] data,int height,int width}
	_DEALLOC_STRUCT(_4, Matrix);
	_4 = malloc(sizeof(Matrix));
	_UPDATE_2DARRAY(_4->data, data);
	_4->height = height;
	_4->width = width;
	_REMOVE_DEALLOC(data);
	_ADD_DEALLOC(_4);
	//return %4
	_DEALLOC_2DARRAY_LONGLONG(data);
	_DEALLOC_STRUCT(r, Matrix);
	return _4;
	//return
}

Matrix* multiply(Matrix* A, _DECL_DEALLOC_PARAM(A), Matrix* B, _DECL_DEALLOC_PARAM(B)){
	Matrix* C;
	_DECL_DEALLOC(C);
	_DECL_2DARRAY(C_data);
	_DECL_DEALLOC(C_data);
	long long i = 0;
	long long j = 0;
	long long r = 0;
	long long k = 0;
	long long _8 = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	long long _11 = 0;
	_DECL_2DARRAY(_12);
	_DECL_DEALLOC(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	_DECL_2DARRAY(_20);
	_DECL_DEALLOC(_20);
	_DECL_1DARRAY(_21);
	_DECL_DEALLOC(_21);
	long long _22 = 0;
	_DECL_2DARRAY(_23);
	_DECL_DEALLOC(_23);
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
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
	_DECL_DEALLOC(_34);
	long long _35 = 0;
	long long _36 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//fieldload %9 = %1 width : {int[][] data,int height,int width}
	_9 = B->width;
	//arraygen %10 = [8; 9] : int[]
	_DEALLOC(_10);
	_NEW_1DARRAY_LONGLONG(_10, _9, _8);
	_ADD_DEALLOC(_10);
	//fieldload %11 = %0 height : {int[][] data,int height,int width}
	_11 = A->height;
	//arraygen %12 = [10; 11] : int[][]
	_DEALLOC_2DARRAY_LONGLONG(_12);
	_NEW_2DARRAY_LONGLONG(_12, _11, _10);
	_ADD_DEALLOC(_12);
	//assign %3 = %12  : int[][]
	_DEALLOC_2DARRAY_LONGLONG(C_data);
	_UPDATE_2DARRAY(C_data, _12);
	_TRANSFER_DEALLOC(C_data, _12);
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
				_DEALLOC_2DARRAY_LONGLONG(_20);
				_UPDATE_2DARRAY(_20, A->data);
				_REMOVE_DEALLOC(_20);
				//indexof %21 = %20, %4 : int[][]
				_21=_20[i];
				_REMOVE_DEALLOC(_21);
				//indexof %22 = %21, %7 : int[]
				_22=_21[k];
				//fieldload %23 = %1 data : {int[][] data,int height,int width}
				_DEALLOC_2DARRAY_LONGLONG(_23);
				_UPDATE_2DARRAY(_23, B->data);
				_REMOVE_DEALLOC(_23);
				//indexof %24 = %23, %7 : int[][]
				_24=_23[k];
				_REMOVE_DEALLOC(_24);
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
	//invoke (%34) = (%35, %36, %3) MatrixMult_2DArray:matrix : function(MatrixMult_2DArray:nat,MatrixMult_2DArray:nat,int[][])->(MatrixMult_2DArray:Matrix)
	{
		_DEALLOC_STRUCT(_34, Matrix);
		_34 = matrix(_35, _36, _2DARRAY_PARAM(C_data), false);
		_RESET_DEALLOC(C_data, "false-true-false" , "matrix");
		_ADD_DEALLOC(_34);
	}
	//return %34
	_DEALLOC_STRUCT(A, Matrix);
	_DEALLOC_STRUCT(B, Matrix);
	_DEALLOC_STRUCT(C, Matrix);
	_DEALLOC_2DARRAY_LONGLONG(C_data);
	_DEALLOC(_10);
	_DEALLOC_2DARRAY_LONGLONG(_12);
	_DEALLOC_2DARRAY_LONGLONG(_20);
	_DEALLOC(_21);
	_DEALLOC_2DARRAY_LONGLONG(_23);
	_DEALLOC(_24);
	return _34;
	//return
}

void printMat(FILE* sys, Matrix* A, _DECL_DEALLOC_PARAM(A)){
	long long i = 0;
	long long j = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	void* _8;
	_DECL_2DARRAY(_10);
	_DECL_DEALLOC(_10);
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	long long _12 = 0;
	void* _13;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	void* _20;
	void* _22;
	long long _22_size = 0;
	_DECL_DEALLOC(_22);
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
			_DEALLOC_2DARRAY_LONGLONG(_10);
			_UPDATE_2DARRAY(_10, A->data);
			_REMOVE_DEALLOC(_10);
			//indexof %11 = %10, %2 : int[][]
			_11=_10[i];
			_REMOVE_DEALLOC(_11);
			//indexof %12 = %11, %3 : int[]
			_12=_11[j];
			//indirectinvoke () = %9 (%12) : method(any)->()
			printf("%lld", _12);
			//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %15 = [32] : int[]
			_DEALLOC(_15);
			_NEW_1DARRAY_LONGLONG(_15, 1, 0);
			_15[0] = 32; 
			_ADD_DEALLOC(_15);
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
		_DEALLOC(_22);
		_NEW_1DARRAY_LONGLONG(_22, 0, 0);
		_ADD_DEALLOC(_22);
		//indirectinvoke () = %21 (%22) : method(int[])->()
		println_s(_22, _22_size);
//.blklab20
blklab20:;
	}
//.blklab19
blklab19:;
	//return
	_DEALLOC_STRUCT(A, Matrix);
	_DEALLOC_2DARRAY_LONGLONG(_10);
	_DEALLOC(_11);
	_DEALLOC(_15);
	_DEALLOC(_22);
	return;
}

Matrix* init(long long height, long long width){
	Matrix* r;
	_DECL_DEALLOC(r);
	_DECL_2DARRAY(rows);
	_DECL_DEALLOC(rows);
	long long i = 0;
	long long j = 0;
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	_DECL_2DARRAY(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	Matrix* _15;
	_DECL_DEALLOC(_15);
	//const %6 = 0 : int
	_6 = 0;
	//arraygen %7 = [6; 1] : int[]
	_DEALLOC(_7);
	_NEW_1DARRAY_LONGLONG(_7, width, _6);
	_ADD_DEALLOC(_7);
	//arraygen %8 = [7; 0] : int[][]
	_DEALLOC_2DARRAY_LONGLONG(_8);
	_NEW_2DARRAY_LONGLONG(_8, height, _7);
	_ADD_DEALLOC(_8);
	//assign %3 = %8  : int[][]
	_DEALLOC_2DARRAY_LONGLONG(rows);
	_UPDATE_2DARRAY(rows, _8);
	_TRANSFER_DEALLOC(rows, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	i = _9;
	//loop (%3, %4, %5, %10, %11, %12, %13, %14)
	while(true){
		//ifge %4, %0 goto blklab23 : int
		if(i>=height){goto blklab23;}
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		j = _10;
		//loop (%3, %5, %11, %12)
		while(true){
			//ifge %5, %1 goto blklab25 : int
			if(j>=width){goto blklab25;}
			//update %3[%4][%5] = %4 : int[][] -> int[][]
			rows[i][j] = i;
			//const %11 = 1 : int
			_11 = 1;
			//add %12 = %5, %11 : int
			_12=j+_11;
			//assign %5 = %12  : int
			j = _12;
//.blklab26
blklab26:;
		}
//.blklab25
blklab25:;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %4, %13 : int
		_14=i+_13;
		//assign %4 = %14  : int
		i = _14;
//.blklab24
blklab24:;
	}
//.blklab23
blklab23:;
	//invoke (%15) = (%1, %0, %3) MatrixMult_2DArray:matrix : function(MatrixMult_2DArray:nat,MatrixMult_2DArray:nat,int[][])->(MatrixMult_2DArray:Matrix)
	{
		_DEALLOC_STRUCT(_15, Matrix);
		_15 = matrix(width, height, _2DARRAY_PARAM(rows), false);
		_RESET_DEALLOC(rows, "false-true-false" , "matrix");
		_ADD_DEALLOC(_15);
	}
	//return %15
	_DEALLOC_STRUCT(r, Matrix);
	_DEALLOC_2DARRAY_LONGLONG(rows);
	_DEALLOC(_7);
	_DEALLOC_2DARRAY_LONGLONG(_8);
	return _15;
	//return
}

int main(int argc, char** args){
	long long* max;
	_DECL_DEALLOC(max);
	long long size = 0;
	Matrix* A;
	_DECL_DEALLOC(A);
	Matrix* B;
	_DECL_DEALLOC(B);
	Matrix* C;
	_DECL_DEALLOC(C);
	long long* _6;
	_DECL_DEALLOC(_6);
	_DECL_2DARRAY(_7);
	_DECL_DEALLOC(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	void* _13;
	Matrix* _15;
	_DECL_DEALLOC(_15);
	Matrix* _16;
	_DECL_DEALLOC(_16);
	Matrix* _17;
	_DECL_DEALLOC(_17);
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	void* _21;
	_DECL_2DARRAY(_23);
	_DECL_DEALLOC(_23);
	long long _24 = 0;
	long long _25 = 0;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	void* _30;
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_LONGLONG(_7);
	_CONV_ARGS(_7);
	_ADD_DEALLOC(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	_REMOVE_DEALLOC(_9);
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_6, _9);
	_ADD_DEALLOC(_6);
	_REMOVE_DEALLOC(_9);
	//assign %1 = %6  : null|int
	_DEALLOC(max);
	max = _6;
	_TRANSFER_DEALLOC(max, _6);
	//ifis %1, null goto blklab27 : null|int
	if(max == NULL) { goto blklab27;}
	//assign %2 = %1  : int
	size = *max;
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [115,105,122,101,32,61,32] : int[]
	_DEALLOC(_12);
	_NEW_1DARRAY_LONGLONG(_12, 7, 0);
	_12[0] = 115; _12[1] = 105; _12[2] = 122; _12[3] = 101; _12[4] = 32; _12[5] = 61; _12[6] = 32; 
	_ADD_DEALLOC(_12);
	//indirectinvoke () = %11 (%12) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_12));
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %14 (%2) : method(any)->()
	printf("%lld\n", size);
	//invoke (%15) = (%2, %2) MatrixMult_2DArray:init : function(MatrixMult_2DArray:nat,MatrixMult_2DArray:nat)->(MatrixMult_2DArray:Matrix)
	{
		_DEALLOC_STRUCT(_15, Matrix);
		_15 = init(size, size);
		_ADD_DEALLOC(_15);
	}
	//assign %3 = %15  : {int[][] data,int height,int width}
	_DEALLOC_STRUCT(A, Matrix);
	A = _15;
	_TRANSFER_DEALLOC(A, _15);
	//invoke (%16) = (%2, %2) MatrixMult_2DArray:init : function(MatrixMult_2DArray:nat,MatrixMult_2DArray:nat)->(MatrixMult_2DArray:Matrix)
	{
		_DEALLOC_STRUCT(_16, Matrix);
		_16 = init(size, size);
		_ADD_DEALLOC(_16);
	}
	//assign %4 = %16  : {int[][] data,int height,int width}
	_DEALLOC_STRUCT(B, Matrix);
	B = _16;
	_TRANSFER_DEALLOC(B, _16);
	//invoke (%17) = (%3, %4) MatrixMult_2DArray:multiply : function(MatrixMult_2DArray:Matrix,MatrixMult_2DArray:Matrix)->(MatrixMult_2DArray:Matrix)
	{
		_DEALLOC_STRUCT(_17, Matrix);
		_17 = multiply(_STRUCT_PARAM(A), false, _STRUCT_PARAM(B), false);
		_RETAIN_DEALLOC(A, "false-false-false" , "multiply");
		_RETAIN_DEALLOC(B, "false-false-false" , "multiply");
		_ADD_DEALLOC(_17);
	}
	//assign %5 = %17  : {int[][] data,int height,int width}
	_DEALLOC_STRUCT(C, Matrix);
	C = _17;
	_TRANSFER_DEALLOC(C, _17);
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [77,97,116,114,105,120,32,67,91,115,105,122,101,45,49,93,91,115,105,122,101,45,49,93,32,61,32] : int[]
	_DEALLOC(_20);
	_NEW_1DARRAY_LONGLONG(_20, 27, 0);
	_20[0] = 77; _20[1] = 97; _20[2] = 116; _20[3] = 114; _20[4] = 105; _20[5] = 120; _20[6] = 32; _20[7] = 67; _20[8] = 91; _20[9] = 115; _20[10] = 105; _20[11] = 122; _20[12] = 101; _20[13] = 45; _20[14] = 49; _20[15] = 93; _20[16] = 91; _20[17] = 115; _20[18] = 105; _20[19] = 122; _20[20] = 101; _20[21] = 45; _20[22] = 49; _20[23] = 93; _20[24] = 32; _20[25] = 61; _20[26] = 32; 
	_ADD_DEALLOC(_20);
	//indirectinvoke () = %19 (%20) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_20));
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %23 = %5 data : {int[][] data,int height,int width}
	_DEALLOC_2DARRAY_LONGLONG(_23);
	_UPDATE_2DARRAY(_23, C->data);
	_REMOVE_DEALLOC(_23);
	//const %24 = 1 : int
	_24 = 1;
	//sub %25 = %2, %24 : int
	_25=size-_24;
	//indexof %26 = %23, %25 : int[][]
	_26=_23[_25];
	_REMOVE_DEALLOC(_26);
	//const %27 = 1 : int
	_27 = 1;
	//sub %28 = %2, %27 : int
	_28=size-_27;
	//indexof %29 = %26, %28 : int[]
	_29=_26[_28];
	//indirectinvoke () = %22 (%29) : method(any)->()
	printf("%lld\n", _29);
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %32 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_32);
	_NEW_1DARRAY_LONGLONG(_32, 25, 0);
	_32[0] = 80; _32[1] = 97; _32[2] = 115; _32[3] = 115; _32[4] = 32; _32[5] = 77; _32[6] = 97; _32[7] = 116; _32[8] = 114; _32[9] = 105; _32[10] = 120; _32[11] = 77; _32[12] = 117; _32[13] = 108; _32[14] = 116; _32[15] = 32; _32[16] = 116; _32[17] = 101; _32[18] = 115; _32[19] = 116; _32[20] = 32; _32[21] = 99; _32[22] = 97; _32[23] = 115; _32[24] = 101; 
	_ADD_DEALLOC(_32);
	//indirectinvoke () = %31 (%32) : method(int[])->()
	println_s(_32, _32_size);
//.blklab27
blklab27:;
	//return
	_DEALLOC(max);
	_DEALLOC_STRUCT(A, Matrix);
	_DEALLOC_STRUCT(B, Matrix);
	_DEALLOC_STRUCT(C, Matrix);
	_DEALLOC(_6);
	_DEALLOC_2DARRAY_LONGLONG(_7);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_DEALLOC_STRUCT(_15, Matrix);
	_DEALLOC_STRUCT(_16, Matrix);
	_DEALLOC_STRUCT(_17, Matrix);
	_DEALLOC(_20);
	_DEALLOC_2DARRAY_LONGLONG(_23);
	_DEALLOC(_26);
	_DEALLOC(_32);
	exit(0);
}

