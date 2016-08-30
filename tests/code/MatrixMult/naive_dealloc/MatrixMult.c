#include "MatrixMult.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_COPY_2DARRAY(new_Matrix->data, _Matrix->data);
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
	free2DArray(matrix->data, matrix->data_size);
	matrix->data = NULL;
	free(matrix);
}
void printf_Matrix(Matrix* matrix){
	printf("{");
	printf(" data:");
	_PRINT_2DARRAY(matrix->data);
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
	_COPY_2DARRAY(_4->data, data);
	_4->height = height;
	_4->width = width;
	_ADD_DEALLOC(_4);
	//return %4
	_DEALLOC_2DArray(data);
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
	_NEW_1DARRAY(_10, _9, _8);
	_ADD_DEALLOC(_10);
	//fieldload %11 = %0 height : {int[][] data,int height,int width}
	_11 = A->height;
	//arraygen %12 = [10; 11] : int[][]
	_DEALLOC_2DArray(_12);
	_NEW_2DARRAY(_12, _11, _10);
	_ADD_DEALLOC(_12);
	//assign %3 = %12  : int[][]
	_DEALLOC_2DArray(C_data);
	_COPY_2DARRAY(C_data, _12);
	_ADD_DEALLOC(C_data);
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
				_DEALLOC_2DArray(_20);
				_COPY_2DARRAY(_20, A->data);
				_ADD_DEALLOC(_20);
				//indexof %21 = %20, %4 : int[][]
				_21=_20[i];
				_REMOVE_DEALLOC(_21);
				//indexof %22 = %21, %7 : int[]
				_22=_21[k];
				//fieldload %23 = %1 data : {int[][] data,int height,int width}
				_DEALLOC_2DArray(_23);
				_COPY_2DARRAY(_23, B->data);
				_ADD_DEALLOC(_23);
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
	//invoke (%34) = (%35, %36, %3) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[][])->(MatrixMult:Matrix)
	{
		void* C_data_tmp;
		_DEALLOC_STRUCT(_34, Matrix);
		_34 = matrix(_35, _36, C_data_tmp = _COPY_2DARRAY_PARAM(C_data), true);
		_ADD_DEALLOC(_34);
	}
	//return %34
	_DEALLOC_STRUCT(A, Matrix);
	_DEALLOC_STRUCT(B, Matrix);
	_DEALLOC_STRUCT(C, Matrix);
	_DEALLOC_2DArray(C_data);
	_DEALLOC(_10);
	_DEALLOC_2DArray(_12);
	_DEALLOC_2DArray(_20);
	_DEALLOC(_21);
	_DEALLOC_2DArray(_23);
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
			_DEALLOC_2DArray(_10);
			_COPY_2DARRAY(_10, A->data);
			_ADD_DEALLOC(_10);
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
			_NEW_1DARRAY(_15, 1, 0);
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
		_NEW_1DARRAY(_22, 0, 0);
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
	_DEALLOC_2DArray(_10);
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
	_NEW_1DARRAY(_7, width, _6);
	_ADD_DEALLOC(_7);
	//arraygen %8 = [7; 0] : int[][]
	_DEALLOC_2DArray(_8);
	_NEW_2DARRAY(_8, height, _7);
	_ADD_DEALLOC(_8);
	//assign %3 = %8  : int[][]
	_DEALLOC_2DArray(rows);
	_COPY_2DARRAY(rows, _8);
	_ADD_DEALLOC(rows);
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
	//invoke (%15) = (%1, %0, %3) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[][])->(MatrixMult:Matrix)
	{
		void* rows_tmp;
		_DEALLOC_STRUCT(_15, Matrix);
		_15 = matrix(width, height, rows_tmp = _COPY_2DARRAY_PARAM(rows), true);
		_ADD_DEALLOC(_15);
	}
	//return %15
	_DEALLOC_STRUCT(r, Matrix);
	_DEALLOC_2DArray(rows);
	_DEALLOC(_7);
	_DEALLOC_2DArray(_8);
	return _15;
	//return
}

int main(int argc, char** args){
	long long max = 0;
	Matrix* A;
	_DECL_DEALLOC(A);
	Matrix* B;
	_DECL_DEALLOC(B);
	Matrix* C;
	_DECL_DEALLOC(C);
	long long _5 = 0;
	Matrix* _6;
	_DECL_DEALLOC(_6);
	_DECL_2DARRAY(_7);
	_DECL_DEALLOC(_7);
	long long _8 = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	Matrix* _16;
	_DECL_DEALLOC(_16);
	_DECL_2DARRAY(_17);
	_DECL_DEALLOC(_17);
	long long _18 = 0;
	long long _19 = 0;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	Matrix* _26;
	_DECL_DEALLOC(_26);
	_DECL_2DARRAY(_27);
	_DECL_DEALLOC(_27);
	long long _28 = 0;
	long long _29 = 0;
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	void* _35;
	_DECL_1DARRAY(_37);
	_DECL_DEALLOC(_37);
	//const %5 = 20 : int
	_5 = 20;
	//assign %1 = %5  : int
	max = _5;
	//invoke (%6) = (%1, %1) MatrixMult:init : function(MatrixMult:nat,MatrixMult:nat)->(MatrixMult:Matrix)
	{
		_DEALLOC_STRUCT(_6, Matrix);
		_6 = init(max, max);
		_ADD_DEALLOC(_6);
	}
	//assign %2 = %6  : {int[][] data,int height,int width}
	_DEALLOC_STRUCT(A, Matrix);
	A = copy_Matrix(_6);
	_ADD_DEALLOC(A);
	//assert
	{
		//fieldload %7 = %2 data : {int[][] data,int height,int width}
		_DEALLOC_2DArray(_7);
		_COPY_2DARRAY(_7, A->data);
		_ADD_DEALLOC(_7);
		//const %8 = 1 : int
		_8 = 1;
		//sub %9 = %1, %8 : int
		_9=max-_8;
		//indexof %10 = %7, %9 : int[][]
		_10=_7[_9];
		_REMOVE_DEALLOC(_10);
		//const %11 = 1 : int
		_11 = 1;
		//sub %12 = %1, %11 : int
		_12=max-_11;
		//indexof %13 = %10, %12 : int[]
		_13=_10[_12];
		//const %14 = 1 : int
		_14 = 1;
		//sub %15 = %1, %14 : int
		_15=max-_14;
		//ifeq %13, %15 goto blklab27 : int
		if(_13==_15){goto blklab27;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab27
blklab27:;
	//assert
	}
	//invoke (%16) = (%1, %1) MatrixMult:init : function(MatrixMult:nat,MatrixMult:nat)->(MatrixMult:Matrix)
	{
		_DEALLOC_STRUCT(_16, Matrix);
		_16 = init(max, max);
		_ADD_DEALLOC(_16);
	}
	//assign %3 = %16  : {int[][] data,int height,int width}
	_DEALLOC_STRUCT(B, Matrix);
	B = copy_Matrix(_16);
	_ADD_DEALLOC(B);
	//assert
	{
		//fieldload %17 = %3 data : {int[][] data,int height,int width}
		_DEALLOC_2DArray(_17);
		_COPY_2DARRAY(_17, B->data);
		_ADD_DEALLOC(_17);
		//const %18 = 1 : int
		_18 = 1;
		//sub %19 = %1, %18 : int
		_19=max-_18;
		//indexof %20 = %17, %19 : int[][]
		_20=_17[_19];
		_REMOVE_DEALLOC(_20);
		//const %21 = 1 : int
		_21 = 1;
		//sub %22 = %1, %21 : int
		_22=max-_21;
		//indexof %23 = %20, %22 : int[]
		_23=_20[_22];
		//const %24 = 1 : int
		_24 = 1;
		//sub %25 = %1, %24 : int
		_25=max-_24;
		//ifeq %23, %25 goto blklab28 : int
		if(_23==_25){goto blklab28;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab28
blklab28:;
	//assert
	}
	//invoke (%26) = (%2, %3) MatrixMult:multiply : function(MatrixMult:Matrix,MatrixMult:Matrix)->(MatrixMult:Matrix)
	{
		void* A_tmp;
		void* B_tmp;
		_DEALLOC_STRUCT(_26, Matrix);
		_26 = multiply(A_tmp = _COPY_STRUCT_PARAM(A, Matrix), true, B_tmp = _COPY_STRUCT_PARAM(B, Matrix), true);
		_ADD_DEALLOC(_26);
	}
	//assign %4 = %26  : {int[][] data,int height,int width}
	_DEALLOC_STRUCT(C, Matrix);
	C = copy_Matrix(_26);
	_ADD_DEALLOC(C);
	//assert
	{
		//fieldload %27 = %4 data : {int[][] data,int height,int width}
		_DEALLOC_2DArray(_27);
		_COPY_2DARRAY(_27, C->data);
		_ADD_DEALLOC(_27);
		//const %28 = 1 : int
		_28 = 1;
		//sub %29 = %1, %28 : int
		_29=max-_28;
		//indexof %30 = %27, %29 : int[][]
		_30=_27[_29];
		_REMOVE_DEALLOC(_30);
		//const %31 = 1 : int
		_31 = 1;
		//sub %32 = %1, %31 : int
		_32=max-_31;
		//indexof %33 = %30, %32 : int[]
		_33=_30[_32];
		//const %34 = 3610 : int
		_34 = 3610;
		//ifeq %33, %34 goto blklab29 : int
		if(_33==_34){goto blklab29;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab29
blklab29:;
	//assert
	}
	//invoke () = (%0, %4) MatrixMult:printMat : method(whiley/lang/System:Console,MatrixMult:Matrix)->()
	{
		void* C_tmp;
printMat(stdout, C_tmp = _COPY_STRUCT_PARAM(C, Matrix), true);
	}
	//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %36 = %35 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %37 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_37);
	_NEW_1DARRAY(_37, 25, 0);
	_37[0] = 80; _37[1] = 97; _37[2] = 115; _37[3] = 115; _37[4] = 32; _37[5] = 77; _37[6] = 97; _37[7] = 116; _37[8] = 114; _37[9] = 105; _37[10] = 120; _37[11] = 77; _37[12] = 117; _37[13] = 108; _37[14] = 116; _37[15] = 32; _37[16] = 116; _37[17] = 101; _37[18] = 115; _37[19] = 116; _37[20] = 32; _37[21] = 99; _37[22] = 97; _37[23] = 115; _37[24] = 101; 
	_ADD_DEALLOC(_37);
	//indirectinvoke () = %36 (%37) : method(int[])->()
	println_s(_37, _37_size);
	//return
	_DEALLOC_STRUCT(A, Matrix);
	_DEALLOC_STRUCT(B, Matrix);
	_DEALLOC_STRUCT(C, Matrix);
	_DEALLOC_STRUCT(_6, Matrix);
	_DEALLOC_2DArray(_7);
	_DEALLOC(_10);
	_DEALLOC_STRUCT(_16, Matrix);
	_DEALLOC_2DArray(_17);
	_DEALLOC(_20);
	_DEALLOC_STRUCT(_26, Matrix);
	_DEALLOC_2DArray(_27);
	_DEALLOC(_30);
	_DEALLOC(_37);
	exit(0);
}

