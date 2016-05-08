#include "MatrixMult.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_1DARRAY_COPY(new_Matrix->data, _Matrix->data);
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
	free(matrix->data);
	free(matrix);
}
void printf_Matrix(Matrix* matrix){
	printf("{");
	printf(" data:");
	_1DARRAY_PRINT(matrix->data);
	printf(" width:");
	printf("%lld", matrix->width);
	printf(" height:");
	printf("%lld", matrix->height);
	printf("}");
}
Matrix* matrix(long long width, long long height, _DECL_1DARRAY_PARAM(data), _DECL_OWNERSHIP_PARAM(data)){
	Matrix* r;
	_DECL_OWNERSHIP(r);
	Matrix* _4;
	_DECL_OWNERSHIP(_4);
	//newrecord %4 = (%2, %1, %0) : {int[] data,int height,int width}
	_FREE_STRUCT(_4, Matrix);
	_4 = malloc(sizeof(Matrix));
	_1DARRAY_COPY(_4->data, data);
	_4->height = height;
	_4->width = width;
	_ADD_OWNERSHIP(_4);
	//return %4
	_FREE(data);
	_FREE_STRUCT(r, Matrix);
	return _4;
	//return
}

Matrix* init(long long width, long long height){
	Matrix* r;
	_DECL_OWNERSHIP(r);
	_DECL_1DARRAY(data);
	_DECL_OWNERSHIP(data);
	long long i = 0;
	long long j = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
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
	long long _19 = 0;
	long long _20 = 0;
	Matrix* _21;
	_DECL_OWNERSHIP(_21);
	//const %6 = 0 : int
	_6 = 0;
	//mul %7 = %0, %1 : int
	_7=width*height;
	//arraygen %8 = [6; 7] : int[]
	_FREE(_8);
	_GEN_1DARRAY(_8, _7, _6);
	_ADD_OWNERSHIP(_8);
	//assign %3 = %8  : int[]
	_FREE(data);
	_1DARRAY_UPDATE(data, _8);
	_TRANSFER_OWNERSHIP(data, _8);
	_REMOVE_OWNERSHIP(_8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	i = _9;
	//loop (%3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20)
	while(true){
		//ifge %4, %1 goto blklab2 : int
		if(i>=height){goto blklab2;}
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		j = _10;
		//loop (%3, %5, %11, %12, %13, %14, %15, %16, %17, %18)
		while(true){
			//ifge %5, %0 goto blklab4 : int
			if(j>=width){goto blklab4;}
			//mul %11 = %4, %0 : int
			_11=i*width;
			//add %12 = %11, %5 : int
			_12=_11+j;
			//indexof %13 = %3, %12 : int[]
			_13=data[_12];
			//add %14 = %13, %4 : int
			_14=_13+i;
			//mul %15 = %4, %0 : int
			_15=i*width;
			//add %16 = %15, %5 : int
			_16=_15+j;
			//update %3[%16] = %14 : int[] -> int[]
			data[_16] = _14;
			//const %17 = 1 : int
			_17 = 1;
			//add %18 = %5, %17 : int
			_18=j+_17;
			//assign %5 = %18  : int
			j = _18;
//.blklab5
blklab5:;
		}
//.blklab4
blklab4:;
		//const %19 = 1 : int
		_19 = 1;
		//add %20 = %4, %19 : int
		_20=i+_19;
		//assign %4 = %20  : int
		i = _20;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//invoke (%21) = (%0, %1, %3) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[])->(MatrixMult:Matrix)
	_FREE_STRUCT(_21, Matrix);
	_21 = matrix(width, height, _1DARRAY_PARAM(data), false);
	_ADD_OWNERSHIP(_21);
	//return %21
	_FREE_STRUCT(r, Matrix);
	_FREE(data);
	_FREE(_8);
	return _21;
	//return
}

void print_mat(FILE* sys, Matrix* a, _DECL_OWNERSHIP_PARAM(a)){
	long long i = 0;
	long long width = 0;
	long long height = 0;
	long long j = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_OWNERSHIP(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_OWNERSHIP(_18);
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	void* _23;
	void* _25;
	long long _25_size = 0;
	_DECL_OWNERSHIP(_25);
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	i = _6;
	//fieldload %7 = %1 width : {int[] data,int height,int width}
	_7 = a->width;
	//assign %3 = %7  : int
	width = _7;
	//fieldload %8 = %1 height : {int[] data,int height,int width}
	_8 = a->height;
	//assign %4 = %8  : int
	height = _8;
	//loop (%2, %5, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
	while(true){
		//ifge %2, %4 goto blklab6 : int
		if(i>=height){goto blklab6;}
		//const %9 = 0 : int
		_9 = 0;
		//assign %5 = %9  : int
		j = _9;
		//loop (%5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20)
		while(true){
			//ifge %5, %3 goto blklab8 : int
			if(j>=width){goto blklab8;}
			//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %11 = %10 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//fieldload %12 = %1 data : {int[] data,int height,int width}
			_FREE(_12);
			_1DARRAY_COPY(_12, a->data);
			_ADD_OWNERSHIP(_12);
			//mul %13 = %2, %3 : int
			_13=i*width;
			//add %14 = %13, %5 : int
			_14=_13+j;
			//indexof %15 = %12, %14 : int[]
			_15=_12[_14];
			//indirectinvoke () = %11 (%15) : method(any)->()
			printf("%lld", _15);
			//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %17 = %16 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %18 = [32] : int[]
			_FREE(_18);
			_NEW_ARRAY(_18, 1);
			_18[0] = 32; 
			_ADD_OWNERSHIP(_18);
			//indirectinvoke () = %17 (%18) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_18));
			//const %19 = 1 : int
			_19 = 1;
			//add %20 = %5, %19 : int
			_20=j+_19;
			//assign %5 = %20  : int
			j = _20;
//.blklab9
blklab9:;
		}
//.blklab8
blklab8:;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %2, %21 : int
		_22=i+_21;
		//assign %2 = %22  : int
		i = _22;
		//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %24 = %23 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %25 = [] : void[]
		_FREE(_25);
		_NEW_ARRAY(_25, 0);
		_ADD_OWNERSHIP(_25);
		//indirectinvoke () = %24 (%25) : method(int[])->()
		println_s(_25, _25_size);
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//return
	_FREE_STRUCT(a, Matrix);
	_FREE(_12);
	_FREE(_18);
	_FREE(_25);
	return;
}

Matrix* mat_mult(Matrix* a, _DECL_OWNERSHIP_PARAM(a), Matrix* b, _DECL_OWNERSHIP_PARAM(b)){
	Matrix* c;
	_DECL_OWNERSHIP(c);
	long long width = 0;
	long long height = 0;
	_DECL_1DARRAY(data);
	_DECL_OWNERSHIP(data);
	_DECL_1DARRAY(a_data);
	_DECL_OWNERSHIP(a_data);
	_DECL_1DARRAY(b_data);
	_DECL_OWNERSHIP(b_data);
	long long i = 0;
	long long j = 0;
	long long k = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_OWNERSHIP(_15);
	_DECL_1DARRAY(_16);
	_DECL_OWNERSHIP(_16);
	_DECL_1DARRAY(_17);
	_DECL_OWNERSHIP(_17);
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long _38 = 0;
	long long _39 = 0;
	Matrix* _40;
	_DECL_OWNERSHIP(_40);
	//fieldload %11 = %1 width : {int[] data,int height,int width}
	_11 = b->width;
	//assign %3 = %11  : int
	width = _11;
	//fieldload %12 = %0 height : {int[] data,int height,int width}
	_12 = a->height;
	//assign %4 = %12  : int
	height = _12;
	//const %13 = 0 : int
	_13 = 0;
	//mul %14 = %3, %4 : int
	_14=width*height;
	//arraygen %15 = [13; 14] : int[]
	_FREE(_15);
	_GEN_1DARRAY(_15, _14, _13);
	_ADD_OWNERSHIP(_15);
	//assign %5 = %15  : int[]
	_FREE(data);
	_1DARRAY_UPDATE(data, _15);
	_TRANSFER_OWNERSHIP(data, _15);
	_REMOVE_OWNERSHIP(_15);
	//fieldload %16 = %0 data : {int[] data,int height,int width}
	_FREE(_16);
	_1DARRAY_COPY(_16, a->data);
	_ADD_OWNERSHIP(_16);
	//assign %6 = %16  : int[]
	_FREE(a_data);
	_1DARRAY_UPDATE(a_data, _16);
	_TRANSFER_OWNERSHIP(a_data, _16);
	_REMOVE_OWNERSHIP(_16);
	//fieldload %17 = %1 data : {int[] data,int height,int width}
	_FREE(_17);
	_1DARRAY_COPY(_17, b->data);
	_ADD_OWNERSHIP(_17);
	//assign %7 = %17  : int[]
	_FREE(b_data);
	_1DARRAY_UPDATE(b_data, _17);
	_TRANSFER_OWNERSHIP(b_data, _17);
	_REMOVE_OWNERSHIP(_17);
	//const %18 = 0 : int
	_18 = 0;
	//assign %8 = %18  : int
	i = _18;
	//loop (%5, %8, %9, %10, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39)
	while(true){
		//ifge %8, %4 goto blklab13 : int
		if(i>=height){goto blklab13;}
		//const %19 = 0 : int
		_19 = 0;
		//assign %9 = %19  : int
		j = _19;
		//loop (%5, %9, %10, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37)
		while(true){
			//ifge %9, %3 goto blklab15 : int
			if(j>=width){goto blklab15;}
			//const %20 = 0 : int
			_20 = 0;
			//assign %10 = %20  : int
			k = _20;
			//loop (%5, %10, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35)
			while(true){
				//ifge %10, %3 goto blklab17 : int
				if(k>=width){goto blklab17;}
				//mul %21 = %8, %3 : int
				_21=i*width;
				//add %22 = %21, %9 : int
				_22=_21+j;
				//indexof %23 = %5, %22 : int[]
				_23=data[_22];
				//mul %24 = %8, %3 : int
				_24=i*width;
				//add %25 = %24, %10 : int
				_25=_24+k;
				//indexof %26 = %6, %25 : int[]
				_26=a_data[_25];
				//mul %27 = %10, %3 : int
				_27=k*width;
				//add %28 = %27, %9 : int
				_28=_27+j;
				//indexof %29 = %7, %28 : int[]
				_29=b_data[_28];
				//mul %30 = %26, %29 : int
				_30=_26*_29;
				//add %31 = %23, %30 : int
				_31=_23+_30;
				//mul %32 = %8, %3 : int
				_32=i*width;
				//add %33 = %32, %9 : int
				_33=_32+j;
				//update %5[%33] = %31 : int[] -> int[]
				data[_33] = _31;
				//const %34 = 1 : int
				_34 = 1;
				//add %35 = %10, %34 : int
				_35=k+_34;
				//assign %10 = %35  : int
				k = _35;
//.blklab18
blklab18:;
			}
//.blklab17
blklab17:;
			//const %36 = 1 : int
			_36 = 1;
			//add %37 = %9, %36 : int
			_37=j+_36;
			//assign %9 = %37  : int
			j = _37;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
		//const %38 = 1 : int
		_38 = 1;
		//add %39 = %8, %38 : int
		_39=i+_38;
		//assign %8 = %39  : int
		i = _39;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//invoke (%40) = (%3, %4, %5) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[])->(MatrixMult:Matrix)
	_FREE_STRUCT(_40, Matrix);
	_40 = matrix(width, height, _1DARRAY_PARAM(data), false);
	_ADD_OWNERSHIP(_40);
	//return %40
	_FREE_STRUCT(a, Matrix);
	_FREE_STRUCT(b, Matrix);
	_FREE_STRUCT(c, Matrix);
	_FREE(data);
	_FREE(a_data);
	_FREE(b_data);
	_FREE(_15);
	_FREE(_16);
	_FREE(_17);
	return _40;
	//return
}

