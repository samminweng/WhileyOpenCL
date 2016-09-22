#include "MatrixMult_original.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_COPY_1DARRAY_int64_t(new_Matrix->data, _Matrix->data);
	new_Matrix->width = _Matrix->width;
	new_Matrix->height = _Matrix->height;
	return new_Matrix;
}
Matrix** copy_array_Matrix(Matrix** _Matrix, size_t _Matrix_size){
	Matrix** new_Matrix = malloc(_Matrix_size*sizeof(Matrix*));
	for(int i=0;i<_Matrix_size;i++){
		new_Matrix[i] = copy_Matrix(_Matrix[i]);
	}
	return new_Matrix;
}
void free_Matrix(Matrix* matrix){
	free(matrix->data);
	matrix->data = NULL;
	free(matrix);
}
void printf_Matrix(Matrix* matrix){
	printf("{");
	printf(" data:");
	_PRINT_1DARRAY_int64_t(matrix->data);
	printf(" width:");
	printf("%"PRId64, matrix->width);
	printf(" height:");
	printf("%"PRId64, matrix->height);
	printf("}");
}
Matrix* matrix(int64_t width, int64_t height, _DECL_1DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data)){
	Matrix* r;
	_DECL_DEALLOC(r);
	Matrix* _4;
	_DECL_DEALLOC(_4);
	//newrecord %4 = (%2, %1, %0) : {int[] data,int height,int width}
	_DEALLOC_STRUCT(_4, Matrix);
	_4 = malloc(sizeof(Matrix));
	_COPY_1DARRAY_int64_t(_4->data, data);
	_4->height = height;
	_4->width = width;
	_ADD_DEALLOC(_4);
	//return %4
	_DEALLOC(data);
	_DEALLOC_STRUCT(r, Matrix);
	return _4;
	//return
}

Matrix* init(int64_t width, int64_t height){
	Matrix* r;
	_DECL_DEALLOC(r);
	_DECL_1DARRAY(data);
	_DECL_DEALLOC(data);
	int64_t i = 0;
	int64_t j = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	Matrix* _21;
	_DECL_DEALLOC(_21);
	//const %6 = 0 : int
	_6 = 0;
	//mul %7 = %0, %1 : int
	_7=width*height;
	//arraygen %8 = [6; 7] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	_ADD_DEALLOC(_8);
	//assign %3 = %8  : int[]
	_DEALLOC(data);
	_COPY_1DARRAY_int64_t(data, _8);
	_ADD_DEALLOC(data);
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
	//invoke (%21) = (%0, %1, %3) MatrixMult_original:matrix : function(MatrixMult_original:nat,MatrixMult_original:nat,int[])->(MatrixMult_original:Matrix)
	{
		void* data_tmp;
		_DEALLOC_STRUCT(_21, Matrix);
		_21 = matrix(width, height, _COPY_1DARRAY_PARAM_int64_t(data), true);
		_CALLEE_DEALLOC(data, "false-false-false" , "matrix");
		_ADD_DEALLOC(_21);
	}
	//return %21
	_DEALLOC_STRUCT(r, Matrix);
	_DEALLOC(data);
	_DEALLOC(_8);
	return _21;
	//return
}

void print_mat(FILE* sys, Matrix* a, _DECL_DEALLOC_PARAM(a)){
	int64_t i = 0;
	int64_t width = 0;
	int64_t height = 0;
	int64_t j = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	void* _23;
	void* _25;
	size_t _25_size = 0;
	_DECL_DEALLOC(_25);
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
			_DEALLOC(_12);
			_UPDATE_1DARRAY(_12, a->data);
			_REMOVE_DEALLOC(_12);
			//mul %13 = %2, %3 : int
			_13=i*width;
			//add %14 = %13, %5 : int
			_14=_13+j;
			//indexof %15 = %12, %14 : int[]
			_15=_12[_14];
			//indirectinvoke () = %11 (%15) : method(any)->()
			{
				printf("%"PRId64, _15);
			}
			//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %17 = %16 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %18 = [32] : int[]
			_DEALLOC(_18);
			_NEW_1DARRAY_int64_t(_18, 1, 0);
			_18[0] = 32; 
			_ADD_DEALLOC(_18);
			//indirectinvoke () = %17 (%18) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_18));
			}
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
		_DEALLOC(_25);
		_NEW_1DARRAY_int64_t(_25, 0, 0);
		_ADD_DEALLOC(_25);
		//indirectinvoke () = %24 (%25) : method(int[])->()
		{
			println_s(_25, _25_size);
		}
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//return
	_DEALLOC_STRUCT(a, Matrix);
	_DEALLOC(_12);
	_DEALLOC(_18);
	_DEALLOC(_25);
	return;
}

Matrix* mat_mult(Matrix* a, _DECL_DEALLOC_PARAM(a), Matrix* b, _DECL_DEALLOC_PARAM(b)){
	Matrix* c;
	_DECL_DEALLOC(c);
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY(data);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY(a_data);
	_DECL_DEALLOC(a_data);
	_DECL_1DARRAY(b_data);
	_DECL_DEALLOC(b_data);
	int64_t i = 0;
	int64_t j = 0;
	int64_t k = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	Matrix* _40;
	_DECL_DEALLOC(_40);
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
	_DEALLOC(_15);
	_NEW_1DARRAY_int64_t(_15, _14, _13);
	_ADD_DEALLOC(_15);
	//assign %5 = %15  : int[]
	_DEALLOC(data);
	_COPY_1DARRAY_int64_t(data, _15);
	_ADD_DEALLOC(data);
	//fieldload %16 = %0 data : {int[] data,int height,int width}
	_DEALLOC(_16);
	_UPDATE_1DARRAY(_16, a->data);
	_REMOVE_DEALLOC(_16);
	//assign %6 = %16  : int[]
	_DEALLOC(a_data);
	_COPY_1DARRAY_int64_t(a_data, _16);
	_ADD_DEALLOC(a_data);
	//fieldload %17 = %1 data : {int[] data,int height,int width}
	_DEALLOC(_17);
	_UPDATE_1DARRAY(_17, b->data);
	_REMOVE_DEALLOC(_17);
	//assign %7 = %17  : int[]
	_DEALLOC(b_data);
	_COPY_1DARRAY_int64_t(b_data, _17);
	_ADD_DEALLOC(b_data);
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
	//invoke (%40) = (%3, %4, %5) MatrixMult_original:matrix : function(MatrixMult_original:nat,MatrixMult_original:nat,int[])->(MatrixMult_original:Matrix)
	{
		void* data_tmp;
		_DEALLOC_STRUCT(_40, Matrix);
		_40 = matrix(width, height, _COPY_1DARRAY_PARAM_int64_t(data), true);
		_CALLEE_DEALLOC(data, "false-false-false" , "matrix");
		_ADD_DEALLOC(_40);
	}
	//return %40
	_DEALLOC_STRUCT(a, Matrix);
	_DEALLOC_STRUCT(b, Matrix);
	_DEALLOC_STRUCT(c, Matrix);
	_DEALLOC(data);
	_DEALLOC(a_data);
	_DEALLOC(b_data);
	_DEALLOC(_15);
	_DEALLOC(_16);
	_DEALLOC(_17);
	return _40;
	//return
}

int main(int argc, char** args){
	int64_t* max;
	_DECL_DEALLOC(max);
	int64_t size = 0;
	Matrix* A;
	_DECL_DEALLOC(A);
	Matrix* B;
	_DECL_DEALLOC(B);
	Matrix* C;
	_DECL_DEALLOC(C);
	int64_t* _6;
	_DECL_DEALLOC(_6);
	_DECL_2DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8 = 0;
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
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	void* _31;
	_DECL_1DARRAY(_33);
	_DECL_DEALLOC(_33);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_7);
	_CONV_ARGS(_7);
	_ADD_DEALLOC(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	_REMOVE_DEALLOC(_9);
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_6, _9);
		_ADD_DEALLOC(_6);
		_REMOVE_DEALLOC(_9);
	}
	//assign %1 = %6  : null|int
	_DEALLOC(max);
	_NEW_INTEGER_POINTER(max, _6);
	_ADD_DEALLOC(max);
	//ifis %1, null goto blklab19 : null|int
	if(max == NULL) { goto blklab19;}
	//assign %2 = %1  : int
	size = *max;
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [115,105,122,101,32,61,32] : int[]
	_DEALLOC(_12);
	_NEW_1DARRAY_int64_t(_12, 7, 0);
	_12[0] = 115; _12[1] = 105; _12[2] = 122; _12[3] = 101; _12[4] = 32; _12[5] = 61; _12[6] = 32; 
	_ADD_DEALLOC(_12);
	//indirectinvoke () = %11 (%12) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_12));
	}
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %14 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", size);
	}
	//invoke (%15) = (%2, %2) MatrixMult_original:init : function(MatrixMult_original:nat,MatrixMult_original:nat)->(MatrixMult_original:Matrix)
	{
		_DEALLOC_STRUCT(_15, Matrix);
		_15 = init(size, size);
		_ADD_DEALLOC(_15);
	}
	//assign %3 = %15  : {int[] data,int height,int width}
	_DEALLOC_STRUCT(A, Matrix);
	A = copy_Matrix(_15);
	_ADD_DEALLOC(A);
	//invoke (%16) = (%2, %2) MatrixMult_original:init : function(MatrixMult_original:nat,MatrixMult_original:nat)->(MatrixMult_original:Matrix)
	{
		_DEALLOC_STRUCT(_16, Matrix);
		_16 = init(size, size);
		_ADD_DEALLOC(_16);
	}
	//assign %4 = %16  : {int[] data,int height,int width}
	_DEALLOC_STRUCT(B, Matrix);
	B = copy_Matrix(_16);
	_ADD_DEALLOC(B);
	//invoke (%17) = (%3, %4) MatrixMult_original:mat_mult : function(MatrixMult_original:Matrix,MatrixMult_original:Matrix)->(MatrixMult_original:Matrix)
	{
		void* A_tmp;
		void* B_tmp;
		_DEALLOC_STRUCT(_17, Matrix);
		_17 = mat_mult(_COPY_STRUCT_PARAM(A, Matrix), true, _COPY_STRUCT_PARAM(B, Matrix), true);
		_CALLEE_DEALLOC(A, "false-false-false" , "mat_mult");
		_CALLEE_DEALLOC(B, "false-false-false" , "mat_mult");
		_ADD_DEALLOC(_17);
	}
	//assign %5 = %17  : {int[] data,int height,int width}
	_DEALLOC_STRUCT(C, Matrix);
	C = copy_Matrix(_17);
	_ADD_DEALLOC(C);
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [77,97,116,114,105,120,32,67,91,115,105,122,101,45,49,93,91,115,105,122,101,45,49,93,32,61,32] : int[]
	_DEALLOC(_20);
	_NEW_1DARRAY_int64_t(_20, 27, 0);
	_20[0] = 77; _20[1] = 97; _20[2] = 116; _20[3] = 114; _20[4] = 105; _20[5] = 120; _20[6] = 32; _20[7] = 67; _20[8] = 91; _20[9] = 115; _20[10] = 105; _20[11] = 122; _20[12] = 101; _20[13] = 45; _20[14] = 49; _20[15] = 93; _20[16] = 91; _20[17] = 115; _20[18] = 105; _20[19] = 122; _20[20] = 101; _20[21] = 45; _20[22] = 49; _20[23] = 93; _20[24] = 32; _20[25] = 61; _20[26] = 32; 
	_ADD_DEALLOC(_20);
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_20));
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %23 = %5 data : {int[] data,int height,int width}
	_DEALLOC(_23);
	_UPDATE_1DARRAY(_23, C->data);
	_REMOVE_DEALLOC(_23);
	//const %24 = 1 : int
	_24 = 1;
	//sub %25 = %2, %24 : int
	_25=size-_24;
	//mul %26 = %25, %2 : int
	_26=_25*size;
	//add %27 = %26, %2 : int
	_27=_26+size;
	//const %28 = 1 : int
	_28 = 1;
	//sub %29 = %27, %28 : int
	_29=_27-_28;
	//indexof %30 = %23, %29 : int[]
	_30=_23[_29];
	//indirectinvoke () = %22 (%30) : method(any)->()
	{
		printf("%"PRId64"\n", _30);
	}
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %33 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_33);
	_NEW_1DARRAY_int64_t(_33, 25, 0);
	_33[0] = 80; _33[1] = 97; _33[2] = 115; _33[3] = 115; _33[4] = 32; _33[5] = 77; _33[6] = 97; _33[7] = 116; _33[8] = 114; _33[9] = 105; _33[10] = 120; _33[11] = 77; _33[12] = 117; _33[13] = 108; _33[14] = 116; _33[15] = 32; _33[16] = 116; _33[17] = 101; _33[18] = 115; _33[19] = 116; _33[20] = 32; _33[21] = 99; _33[22] = 97; _33[23] = 115; _33[24] = 101; 
	_ADD_DEALLOC(_33);
	//indirectinvoke () = %32 (%33) : method(int[])->()
	{
		println_s(_33, _33_size);
	}
//.blklab19
blklab19:;
	//return
	_DEALLOC(max);
	_DEALLOC_STRUCT(A, Matrix);
	_DEALLOC_STRUCT(B, Matrix);
	_DEALLOC_STRUCT(C, Matrix);
	_DEALLOC(_6);
	_DEALLOC_2DARRAY_int64_t(_7);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_DEALLOC_STRUCT(_15, Matrix);
	_DEALLOC_STRUCT(_16, Matrix);
	_DEALLOC_STRUCT(_17, Matrix);
	_DEALLOC(_20);
	_DEALLOC(_23);
	_DEALLOC(_33);
	exit(0);
}

