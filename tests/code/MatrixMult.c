#include "MatrixMult.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_2DARRAY_COPY(new_Matrix->data, _Matrix->data);
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
	free(matrix);
}
void printf_Matrix(Matrix* matrix){
	printf("{");
	printf(" data:");
	_2DARRAY_PRINT(matrix->data);
	printf(" width:");
	printf("%lld", matrix->width);
	printf(" height:");
	printf("%lld", matrix->height);
	printf("}");
}
Matrix* matrix(long long width, long long height, _DECL_2DARRAY_PARAM(data), _DECL_OWNERSHIP_PARAM(data)){
	Matrix* r;
	_DECL_OWNERSHIP(r);
	Matrix* _4;
	_DECL_OWNERSHIP(_4);
	//newrecord %4 = (%2, %1, %0) : {int[][] data,int height,int width}
	_FREE_STRUCT(_4, Matrix);
	_4 = malloc(sizeof(Matrix));
	_2DARRAY_UPDATE(_4->data, data);
	_4->height = height;
	_4->width = width;
	_ADD_OWNERSHIP(_4);
	//return %4
	_FREE2DArray(data);
	_FREE_STRUCT(r, Matrix);
	return _4;
	//return
}

Matrix* multiply(Matrix* A, _DECL_OWNERSHIP_PARAM(A), Matrix* B, _DECL_OWNERSHIP_PARAM(B)){
	Matrix* C;
	_DECL_OWNERSHIP(C);
	_DECL_2DARRAY(C_data);
	_DECL_OWNERSHIP(C_data);
	long long i = 0;
	long long j = 0;
	long long r = 0;
	long long k = 0;
	long long _8 = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_OWNERSHIP(_10);
	long long _11 = 0;
	_DECL_2DARRAY(_12);
	_DECL_OWNERSHIP(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	_DECL_2DARRAY(_20);
	_DECL_OWNERSHIP(_20);
	_DECL_1DARRAY(_21);
	_DECL_OWNERSHIP(_21);
	long long _22 = 0;
	_DECL_2DARRAY(_23);
	_DECL_OWNERSHIP(_23);
	_DECL_1DARRAY(_24);
	_DECL_OWNERSHIP(_24);
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
	_DECL_OWNERSHIP(_34);
	long long _35 = 0;
	long long _36 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//fieldload %9 = %1 width : {int[][] data,int height,int width}
	_9 = B->width;
	//arraygen %10 = [8; 9] : int[]
	_FREE(_10);
	_GEN_1DARRAY(_10, _9, _8);
	_ADD_OWNERSHIP(_10);
	//fieldload %11 = %0 height : {int[][] data,int height,int width}
	_11 = A->height;
	//arraygen %12 = [10; 11] : int[][]
	_FREE2DArray(_12);
	_GEN_2DARRAY(_12, _11, _10);
	_ADD_OWNERSHIP(_12);
	//assign %3 = %12  : int[][]
	_FREE2DArray(C_data);
	_2DARRAY_UPDATE(C_data, _12);
	_TRANSFER_OWNERSHIP(C_data, _12);
	_REMOVE_OWNERSHIP(_12);
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
				_FREE2DArray(_20);
				_2DARRAY_COPY(_20, A->data);
				_ADD_OWNERSHIP(_20);
				//indexof %21 = %20, %4 : int[][]
				_21=_20[i];
				_REMOVE_OWNERSHIP(_21);
				//indexof %22 = %21, %7 : int[]
				_22=_21[k];
				//fieldload %23 = %1 data : {int[][] data,int height,int width}
				_FREE2DArray(_23);
				_2DARRAY_UPDATE(_23, B->data);
				_REMOVE_OWNERSHIP(_23);
				//indexof %24 = %23, %7 : int[][]
				_24=_23[k];
				_REMOVE_OWNERSHIP(_24);
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
	_FREE_STRUCT(_34, Matrix);
	_REMOVE_OWNERSHIP(C_data);
	_34 = matrix(_35, _36, _2DARRAY_PARAM(C_data), true);
	_ADD_OWNERSHIP(_34);
	//return %34
	_FREE_STRUCT(A, Matrix);
	_FREE_STRUCT(B, Matrix);
	_FREE_STRUCT(C, Matrix);
	_FREE2DArray(C_data);
	_FREE(_10);
	_FREE2DArray(_12);
	_FREE2DArray(_20);
	_FREE(_21);
	_FREE2DArray(_23);
	_FREE(_24);
	return _34;
	//return
}

void printMat(FILE* sys, Matrix* A, _DECL_OWNERSHIP_PARAM(A)){
	long long i = 0;
	long long j = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	void* _8;
	_DECL_2DARRAY(_10);
	_DECL_OWNERSHIP(_10);
	_DECL_1DARRAY(_11);
	_DECL_OWNERSHIP(_11);
	long long _12 = 0;
	void* _13;
	_DECL_1DARRAY(_15);
	_DECL_OWNERSHIP(_15);
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	void* _20;
	void* _22;
	long long _22_size = 0;
	_DECL_OWNERSHIP(_22);
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
			_FREE2DArray(_10);
			_2DARRAY_COPY(_10, A->data);
			_ADD_OWNERSHIP(_10);
			//indexof %11 = %10, %2 : int[][]
			_11=_10[i];
			_REMOVE_OWNERSHIP(_11);
			//indexof %12 = %11, %3 : int[]
			_12=_11[j];
			//indirectinvoke () = %9 (%12) : method(any)->()
			printf("%lld", _12);
			//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %15 = [32] : int[]
			_FREE(_15);
			_NEW_ARRAY(_15, 1);
			_15[0] = 32; 
			_ADD_OWNERSHIP(_15);
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
		_FREE(_22);
		_NEW_ARRAY(_22, 0);
		_ADD_OWNERSHIP(_22);
		//indirectinvoke () = %21 (%22) : method(int[])->()
		println_s(_22, _22_size);
//.blklab20
blklab20:;
	}
//.blklab19
blklab19:;
	//return
	_FREE_STRUCT(A, Matrix);
	_FREE2DArray(_10);
	_FREE(_11);
	_FREE(_15);
	_FREE(_22);
	return;
}

Matrix* init(long long height, long long width){
	Matrix* r;
	_DECL_OWNERSHIP(r);
	_DECL_2DARRAY(rows);
	_DECL_OWNERSHIP(rows);
	long long i = 0;
	long long j = 0;
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	_DECL_2DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	Matrix* _15;
	_DECL_OWNERSHIP(_15);
	//const %6 = 0 : int
	_6 = 0;
	//arraygen %7 = [6; 1] : int[]
	_FREE(_7);
	_GEN_1DARRAY(_7, width, _6);
	_ADD_OWNERSHIP(_7);
	//arraygen %8 = [7; 0] : int[][]
	_FREE2DArray(_8);
	_GEN_2DARRAY(_8, height, _7);
	_ADD_OWNERSHIP(_8);
	//assign %3 = %8  : int[][]
	_FREE2DArray(rows);
	_2DARRAY_UPDATE(rows, _8);
	_TRANSFER_OWNERSHIP(rows, _8);
	_REMOVE_OWNERSHIP(_8);
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
	_FREE_STRUCT(_15, Matrix);
	_REMOVE_OWNERSHIP(rows);
	_15 = matrix(width, height, _2DARRAY_PARAM(rows), true);
	_ADD_OWNERSHIP(_15);
	//return %15
	_FREE_STRUCT(r, Matrix);
	_FREE2DArray(rows);
	_FREE(_7);
	_FREE2DArray(_8);
	return _15;
	//return
}

