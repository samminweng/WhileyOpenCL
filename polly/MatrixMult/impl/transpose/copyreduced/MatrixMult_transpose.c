#include "MatrixMult_transpose.h"
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
Matrix* matrix(int64_t width, int64_t height, _DECL_1DARRAY_PARAM(data)){
	Matrix* r;
	Matrix* _4;
	//newrecord %4 = (%2, %1, %0) : {int[] data,int height,int width}
	_4 = malloc(sizeof(Matrix));
	_UPDATE_1DARRAY(_4->data, data);
	_4->height = height;
	_4->width = width;
	//return %4
	return _4;
	//return
}

Matrix* init(int64_t width, int64_t height){
	Matrix* r;
	_DECL_1DARRAY(data);
	int64_t i = 0;
	int64_t j = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
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
	//const %6 = 0 : int
	_6 = 0;
	//mul %7 = %0, %1 : int
	_7=width*height;
	//arraygen %8 = [6; 7] : int[]
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	//assign %3 = %8  : int[]
	_UPDATE_1DARRAY(data, _8);
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
	//invoke (%21) = (%0, %1, %3) MatrixMult_transpose:matrix : function(MatrixMult_transpose:nat,MatrixMult_transpose:nat,int[])->(MatrixMult_transpose:Matrix)
	{
		_21 = matrix(width, height, _1DARRAY_PARAM(data));
	}
	//return %21
	return _21;
	//return
}

void print_mat(FILE* sys, Matrix* a){
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
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	void* _23;
	void* _25;
	size_t _25_size = 0;
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
			_UPDATE_1DARRAY(_12, a->data);
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
			_NEW_1DARRAY_int64_t(_18, 1, 0);
			_18[0] = 32; 
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
		_NEW_1DARRAY_int64_t(_25, 0, 0);
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
	return;
}

Matrix* mat_mult(Matrix* a, Matrix* b){
	Matrix* c;
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY(data);
	_DECL_1DARRAY(a_data);
	_DECL_1DARRAY(b_data);
	_DECL_1DARRAY(b_t);
	int64_t i = 0;
	int64_t j = 0;
	int64_t k = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	_DECL_1DARRAY(_16);
	_DECL_1DARRAY(_17);
	_DECL_1DARRAY(_18);
	int64_t _19 = 0;
	int64_t _20 = 0;
	_DECL_1DARRAY(_21);
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
	int64_t _40 = 0;
	int64_t _41 = 0;
	int64_t _42 = 0;
	int64_t _43 = 0;
	int64_t _44 = 0;
	int64_t _45 = 0;
	int64_t _46 = 0;
	int64_t _47 = 0;
	int64_t _48 = 0;
	int64_t _49 = 0;
	int64_t _50 = 0;
	int64_t _51 = 0;
	int64_t _52 = 0;
	int64_t _53 = 0;
	int64_t _54 = 0;
	int64_t _55 = 0;
	int64_t _56 = 0;
	int64_t _57 = 0;
	Matrix* _58;
	//fieldload %12 = %1 width : {int[] data,int height,int width}
	_12 = b->width;
	//assign %3 = %12  : int
	width = _12;
	//fieldload %13 = %0 height : {int[] data,int height,int width}
	_13 = a->height;
	//assign %4 = %13  : int
	height = _13;
	//const %14 = 0 : int
	_14 = 0;
	//mul %15 = %3, %4 : int
	_15=width*height;
	//arraygen %16 = [14; 15] : int[]
	_NEW_1DARRAY_int64_t(_16, _15, _14);
	//assign %5 = %16  : int[]
	_UPDATE_1DARRAY(data, _16);
	//fieldload %17 = %0 data : {int[] data,int height,int width}
	_UPDATE_1DARRAY(_17, a->data);
	//assign %6 = %17  : int[]
	_UPDATE_1DARRAY(a_data, _17);
	//fieldload %18 = %1 data : {int[] data,int height,int width}
	_UPDATE_1DARRAY(_18, b->data);
	//assign %7 = %18  : int[]
	_UPDATE_1DARRAY(b_data, _18);
	//const %19 = 0 : int
	_19 = 0;
	//mul %20 = %3, %4 : int
	_20=width*height;
	//arraygen %21 = [19; 20] : int[]
	_NEW_1DARRAY_int64_t(_21, _20, _19);
	//assign %8 = %21  : int[]
	_UPDATE_1DARRAY(b_t, _21);
	//const %22 = 0 : int
	_22 = 0;
	//assign %9 = %22  : int
	i = _22;
	//const %23 = 0 : int
	_23 = 0;
	//assign %10 = %23  : int
	j = _23;
	//const %24 = 0 : int
	_24 = 0;
	//assign %11 = %24  : int
	k = _24;
	//const %25 = 0 : int
	_25 = 0;
	//assign %9 = %25  : int
	i = _25;
	//loop (%8, %9, %10, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35)
	while(true){
		//ifge %9, %4 goto blklab13 : int
		if(i>=height){goto blklab13;}
		//const %26 = 0 : int
		_26 = 0;
		//assign %10 = %26  : int
		j = _26;
		//loop (%8, %10, %27, %28, %29, %30, %31, %32, %33)
		while(true){
			//ifge %10, %3 goto blklab15 : int
			if(j>=width){goto blklab15;}
			//mul %27 = %9, %3 : int
			_27=i*width;
			//add %28 = %27, %10 : int
			_28=_27+j;
			//indexof %29 = %7, %28 : int[]
			_29=b_data[_28];
			//mul %30 = %10, %3 : int
			_30=j*width;
			//add %31 = %30, %9 : int
			_31=_30+i;
			//update %8[%31] = %29 : int[] -> int[]
			b_t[_31] = _29;
			//const %32 = 1 : int
			_32 = 1;
			//add %33 = %10, %32 : int
			_33=j+_32;
			//assign %10 = %33  : int
			j = _33;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %9, %34 : int
		_35=i+_34;
		//assign %9 = %35  : int
		i = _35;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//const %36 = 0 : int
	_36 = 0;
	//assign %9 = %36  : int
	i = _36;
	//loop (%5, %9, %10, %11, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57)
	while(true){
		//ifge %9, %4 goto blklab17 : int
		if(i>=height){goto blklab17;}
		//const %37 = 0 : int
		_37 = 0;
		//assign %10 = %37  : int
		j = _37;
		//loop (%5, %10, %11, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55)
		while(true){
			//ifge %10, %3 goto blklab19 : int
			if(j>=width){goto blklab19;}
			//const %38 = 0 : int
			_38 = 0;
			//assign %11 = %38  : int
			k = _38;
			//loop (%5, %11, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53)
			while(true){
				//ifge %11, %3 goto blklab21 : int
				if(k>=width){goto blklab21;}
				//mul %39 = %9, %3 : int
				_39=i*width;
				//add %40 = %39, %10 : int
				_40=_39+j;
				//indexof %41 = %5, %40 : int[]
				_41=data[_40];
				//mul %42 = %9, %3 : int
				_42=i*width;
				//add %43 = %42, %11 : int
				_43=_42+k;
				//indexof %44 = %6, %43 : int[]
				_44=a_data[_43];
				//mul %45 = %9, %3 : int
				_45=i*width;
				//add %46 = %45, %11 : int
				_46=_45+k;
				//indexof %47 = %8, %46 : int[]
				_47=b_t[_46];
				//mul %48 = %44, %47 : int
				_48=_44*_47;
				//add %49 = %41, %48 : int
				_49=_41+_48;
				//mul %50 = %9, %3 : int
				_50=i*width;
				//add %51 = %50, %10 : int
				_51=_50+j;
				//update %5[%51] = %49 : int[] -> int[]
				data[_51] = _49;
				//const %52 = 1 : int
				_52 = 1;
				//add %53 = %11, %52 : int
				_53=k+_52;
				//assign %11 = %53  : int
				k = _53;
//.blklab22
blklab22:;
			}
//.blklab21
blklab21:;
			//const %54 = 1 : int
			_54 = 1;
			//add %55 = %10, %54 : int
			_55=j+_54;
			//assign %10 = %55  : int
			j = _55;
//.blklab20
blklab20:;
		}
//.blklab19
blklab19:;
		//const %56 = 1 : int
		_56 = 1;
		//add %57 = %9, %56 : int
		_57=i+_56;
		//assign %9 = %57  : int
		i = _57;
//.blklab18
blklab18:;
	}
//.blklab17
blklab17:;
	//invoke (%58) = (%3, %4, %5) MatrixMult_transpose:matrix : function(MatrixMult_transpose:nat,MatrixMult_transpose:nat,int[])->(MatrixMult_transpose:Matrix)
	{
		_58 = matrix(width, height, _1DARRAY_PARAM(data));
	}
	//return %58
	return _58;
	//return
}

int main(int argc, char** args){
	int64_t* max;
	int64_t size = 0;
	Matrix* A;
	Matrix* B;
	Matrix* C;
	int64_t* _6;
	_DECL_2DARRAY(_7);
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	void* _10;
	_DECL_1DARRAY(_12);
	void* _13;
	Matrix* _15;
	Matrix* _16;
	Matrix* _17;
	void* _18;
	_DECL_1DARRAY(_20);
	void* _21;
	_DECL_1DARRAY(_23);
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	void* _31;
	_DECL_1DARRAY(_33);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_6, _9);
	}
	//assign %1 = %6  : null|int
	max = _6;
	//ifis %1, null goto blklab23 : null|int
	if(max == NULL) { goto blklab23;}
	//assign %2 = %1  : int
	size = *max;
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [115,105,122,101,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_12, 7, 0);
	_12[0] = 115; _12[1] = 105; _12[2] = 122; _12[3] = 101; _12[4] = 32; _12[5] = 61; _12[6] = 32; 
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
	//invoke (%15) = (%2, %2) MatrixMult_transpose:init : function(MatrixMult_transpose:nat,MatrixMult_transpose:nat)->(MatrixMult_transpose:Matrix)
	{
		_15 = init(size, size);
	}
	//assign %3 = %15  : {int[] data,int height,int width}
	A = _15;
	//invoke (%16) = (%2, %2) MatrixMult_transpose:init : function(MatrixMult_transpose:nat,MatrixMult_transpose:nat)->(MatrixMult_transpose:Matrix)
	{
		_16 = init(size, size);
	}
	//assign %4 = %16  : {int[] data,int height,int width}
	B = _16;
	//invoke (%17) = (%3, %4) MatrixMult_transpose:mat_mult : function(MatrixMult_transpose:Matrix,MatrixMult_transpose:Matrix)->(MatrixMult_transpose:Matrix)
	{
		_17 = mat_mult(_STRUCT_PARAM(A), _STRUCT_PARAM(B));
	}
	//assign %5 = %17  : {int[] data,int height,int width}
	C = _17;
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [77,97,116,114,105,120,32,67,91,115,105,122,101,45,49,93,91,115,105,122,101,45,49,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_20, 27, 0);
	_20[0] = 77; _20[1] = 97; _20[2] = 116; _20[3] = 114; _20[4] = 105; _20[5] = 120; _20[6] = 32; _20[7] = 67; _20[8] = 91; _20[9] = 115; _20[10] = 105; _20[11] = 122; _20[12] = 101; _20[13] = 45; _20[14] = 49; _20[15] = 93; _20[16] = 91; _20[17] = 115; _20[18] = 105; _20[19] = 122; _20[20] = 101; _20[21] = 45; _20[22] = 49; _20[23] = 93; _20[24] = 32; _20[25] = 61; _20[26] = 32; 
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_20));
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %23 = %5 data : {int[] data,int height,int width}
	_UPDATE_1DARRAY(_23, C->data);
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
	_NEW_1DARRAY_int64_t(_33, 25, 0);
	_33[0] = 80; _33[1] = 97; _33[2] = 115; _33[3] = 115; _33[4] = 32; _33[5] = 77; _33[6] = 97; _33[7] = 116; _33[8] = 114; _33[9] = 105; _33[10] = 120; _33[11] = 77; _33[12] = 117; _33[13] = 108; _33[14] = 116; _33[15] = 32; _33[16] = 116; _33[17] = 101; _33[18] = 115; _33[19] = 116; _33[20] = 32; _33[21] = 99; _33[22] = 97; _33[23] = 115; _33[24] = 101; 
	//indirectinvoke () = %32 (%33) : method(int[])->()
	{
		println_s(_33, _33_size);
	}
//.blklab23
blklab23:;
	//return
	exit(0);
}

