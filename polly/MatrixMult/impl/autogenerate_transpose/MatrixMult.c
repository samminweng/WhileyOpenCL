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
	_DECL_1DARRAY(b_t);
	_DECL_OWNERSHIP(b_t);
	long long i = 0;
	long long j = 0;
	long long k = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	_DECL_1DARRAY(_16);
	_DECL_OWNERSHIP(_16);
	_DECL_1DARRAY(_17);
	_DECL_OWNERSHIP(_17);
	_DECL_1DARRAY(_18);
	_DECL_OWNERSHIP(_18);
	long long _19 = 0;
	long long _20 = 0;
	_DECL_1DARRAY(_21);
	_DECL_OWNERSHIP(_21);
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
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	long long _51 = 0;
	long long _52 = 0;
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	Matrix* _58;
	_DECL_OWNERSHIP(_58);
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
	_FREE(_16);
	_GEN_1DARRAY(_16, _15, _14);
	_ADD_OWNERSHIP(_16);
	//assign %5 = %16  : int[]
	_FREE(data);
	_1DARRAY_UPDATE(data, _16);
	_TRANSFER_OWNERSHIP(data, _16);
	_REMOVE_OWNERSHIP(_16);
	//fieldload %17 = %0 data : {int[] data,int height,int width}
	_FREE(_17);
	_1DARRAY_UPDATE(_17, a->data);
	_REMOVE_OWNERSHIP(_17);
	//assign %6 = %17  : int[]
	_FREE(a_data);
	_1DARRAY_UPDATE(a_data, _17);
	_TRANSFER_OWNERSHIP(a_data, _17);
	_REMOVE_OWNERSHIP(_17);
	//fieldload %18 = %1 data : {int[] data,int height,int width}
	_FREE(_18);
	_1DARRAY_UPDATE(_18, b->data);
	_REMOVE_OWNERSHIP(_18);
	//assign %7 = %18  : int[]
	_FREE(b_data);
	_1DARRAY_UPDATE(b_data, _18);
	_TRANSFER_OWNERSHIP(b_data, _18);
	_REMOVE_OWNERSHIP(_18);
	//const %19 = 0 : int
	_19 = 0;
	//mul %20 = %3, %4 : int
	_20=width*height;
	//arraygen %21 = [19; 20] : int[]
	_FREE(_21);
	_GEN_1DARRAY(_21, _20, _19);
	_ADD_OWNERSHIP(_21);
	//assign %8 = %21  : int[]
	_FREE(b_t);
	_1DARRAY_UPDATE(b_t, _21);
	_TRANSFER_OWNERSHIP(b_t, _21);
	_REMOVE_OWNERSHIP(_21);
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
	//invoke (%58) = (%3, %4, %5) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[])->(MatrixMult:Matrix)
	_FREE_STRUCT(_58, Matrix);
	_58 = matrix(width, height, _1DARRAY_PARAM(data), false);
	_ADD_OWNERSHIP(_58);
	//return %58
	_FREE_STRUCT(a, Matrix);
	_FREE_STRUCT(b, Matrix);
	_FREE_STRUCT(c, Matrix);
	_FREE(data);
	_FREE(a_data);
	_FREE(b_data);
	_FREE(b_t);
	_FREE(_16);
	_FREE(_17);
	_FREE(_18);
	_FREE(_21);
	return _58;
	//return
}

int main(int argc, char** args){
	long long* max;
	_DECL_OWNERSHIP(max);
	long long size = 0;
	Matrix* A;
	_DECL_OWNERSHIP(A);
	Matrix* B;
	_DECL_OWNERSHIP(B);
	Matrix* C;
	_DECL_OWNERSHIP(C);
	long long* _6;
	_DECL_OWNERSHIP(_6);
	_DECL_2DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_OWNERSHIP(_9);
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_OWNERSHIP(_12);
	void* _13;
	Matrix* _15;
	_DECL_OWNERSHIP(_15);
	Matrix* _16;
	_DECL_OWNERSHIP(_16);
	Matrix* _17;
	_DECL_OWNERSHIP(_17);
	_DECL_1DARRAY(_18);
	_DECL_OWNERSHIP(_18);
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	_DECL_1DARRAY(_28);
	_DECL_OWNERSHIP(_28);
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
	_DECL_1DARRAY(_39);
	_DECL_OWNERSHIP(_39);
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	void* _48;
	_DECL_1DARRAY(_50);
	_DECL_OWNERSHIP(_50);
	void* _51;
	_DECL_1DARRAY(_53);
	_DECL_OWNERSHIP(_53);
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	long long _59 = 0;
	long long _60 = 0;
	void* _61;
	_DECL_1DARRAY(_63);
	_DECL_OWNERSHIP(_63);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_FREE2DArray(_7);
	_CONV_ARGS(_7);
	_ADD_OWNERSHIP(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	_REMOVE_OWNERSHIP(_9);
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_6, _9);
	_ADD_OWNERSHIP(_6);
	_REMOVE_OWNERSHIP(_9);
	//assign %1 = %6  : null|int
	_FREE(max);
	max = _6;
	_TRANSFER_OWNERSHIP(max, _6);
	_REMOVE_OWNERSHIP(_6);
	//ifis %1, null goto blklab23 : null|int
	if(max == NULL) { goto blklab23;}
	//assign %2 = %1  : int
	size = *max;
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [115,105,122,101,32,61,32] : int[]
	_FREE(_12);
	_NEW_ARRAY(_12, 7);
	_12[0] = 115; _12[1] = 105; _12[2] = 122; _12[3] = 101; _12[4] = 32; _12[5] = 61; _12[6] = 32; 
	_ADD_OWNERSHIP(_12);
	//indirectinvoke () = %11 (%12) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_12));
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %14 (%2) : method(any)->()
	printf("%lld\n", size);
	//invoke (%15) = (%2, %2) MatrixMult:init : function(MatrixMult:nat,MatrixMult:nat)->(MatrixMult:Matrix)
	_FREE_STRUCT(_15, Matrix);
	_15 = init(size, size);
	_ADD_OWNERSHIP(_15);
	//assign %3 = %15  : {int[] data,int height,int width}
	_FREE_STRUCT(A, Matrix);
	A = _15;
	_TRANSFER_OWNERSHIP(A, _15);
	_REMOVE_OWNERSHIP(_15);
	//invoke (%16) = (%2, %2) MatrixMult:init : function(MatrixMult:nat,MatrixMult:nat)->(MatrixMult:Matrix)
	_FREE_STRUCT(_16, Matrix);
	_16 = init(size, size);
	_ADD_OWNERSHIP(_16);
	//assign %4 = %16  : {int[] data,int height,int width}
	_FREE_STRUCT(B, Matrix);
	B = _16;
	_TRANSFER_OWNERSHIP(B, _16);
	_REMOVE_OWNERSHIP(_16);
	//invoke (%17) = (%3, %4) MatrixMult:mat_mult : function(MatrixMult:Matrix,MatrixMult:Matrix)->(MatrixMult:Matrix)
	_FREE_STRUCT(_17, Matrix);
	_17 = mat_mult(_STRUCT_PARAM(A), false, _STRUCT_PARAM(B), false);
	_ADD_OWNERSHIP(_17);
	//assign %5 = %17  : {int[] data,int height,int width}
	_FREE_STRUCT(C, Matrix);
	C = _17;
	_TRANSFER_OWNERSHIP(C, _17);
	_REMOVE_OWNERSHIP(_17);
	//assert
	{
		//fieldload %18 = %3 data : {int[] data,int height,int width}
		_FREE(_18);
		_1DARRAY_COPY(_18, A->data);
		_ADD_OWNERSHIP(_18);
		//const %19 = 1 : int
		_19 = 1;
		//sub %20 = %2, %19 : int
		_20=size-_19;
		//mul %21 = %20, %2 : int
		_21=_20*size;
		//add %22 = %21, %2 : int
		_22=_21+size;
		//const %23 = 1 : int
		_23 = 1;
		//sub %24 = %22, %23 : int
		_24=_22-_23;
		//indexof %25 = %18, %24 : int[]
		_25=_18[_24];
		//const %26 = 1 : int
		_26 = 1;
		//sub %27 = %2, %26 : int
		_27=size-_26;
		//ifeq %25, %27 goto blklab24 : int
		if(_25==_27){goto blklab24;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab24
blklab24:;
	//assert
	}
	//assert
	{
		//fieldload %28 = %4 data : {int[] data,int height,int width}
		_FREE(_28);
		_1DARRAY_COPY(_28, B->data);
		_ADD_OWNERSHIP(_28);
		//const %29 = 1 : int
		_29 = 1;
		//sub %30 = %2, %29 : int
		_30=size-_29;
		//mul %31 = %30, %2 : int
		_31=_30*size;
		//add %32 = %31, %2 : int
		_32=_31+size;
		//const %33 = 1 : int
		_33 = 1;
		//sub %34 = %32, %33 : int
		_34=_32-_33;
		//indexof %35 = %28, %34 : int[]
		_35=_28[_34];
		//const %36 = 1 : int
		_36 = 1;
		//sub %37 = %2, %36 : int
		_37=size-_36;
		//ifeq %35, %37 goto blklab25 : int
		if(_35==_37){goto blklab25;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab25
blklab25:;
	//assert
	}
	//const %38 = 2000 : int
	_38 = 2000;
	//ifne %2, %38 goto blklab26 : int
	if(size!=_38){goto blklab26;}
	//assert
	{
		//fieldload %39 = %5 data : {int[] data,int height,int width}
		_FREE(_39);
		_1DARRAY_COPY(_39, C->data);
		_ADD_OWNERSHIP(_39);
		//const %40 = 1 : int
		_40 = 1;
		//sub %41 = %2, %40 : int
		_41=size-_40;
		//mul %42 = %41, %2 : int
		_42=_41*size;
		//add %43 = %42, %2 : int
		_43=_42+size;
		//const %44 = 1 : int
		_44 = 1;
		//sub %45 = %43, %44 : int
		_45=_43-_44;
		//indexof %46 = %39, %45 : int[]
		_46=_39[_45];
		//const %47 = 3996001000 : int
		_47 = 3996001000;
		//ifeq %46, %47 goto blklab27 : int
		if(_46==_47){goto blklab27;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab27
blklab27:;
	//assert
	}
//.blklab26
blklab26:;
	//fieldload %48 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %49 = %48 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %50 = [77,97,116,114,105,120,32,67,91,115,105,122,101,45,49,93,91,115,105,122,101,45,49,93,32,61,32] : int[]
	_FREE(_50);
	_NEW_ARRAY(_50, 27);
	_50[0] = 77; _50[1] = 97; _50[2] = 116; _50[3] = 114; _50[4] = 105; _50[5] = 120; _50[6] = 32; _50[7] = 67; _50[8] = 91; _50[9] = 115; _50[10] = 105; _50[11] = 122; _50[12] = 101; _50[13] = 45; _50[14] = 49; _50[15] = 93; _50[16] = 91; _50[17] = 115; _50[18] = 105; _50[19] = 122; _50[20] = 101; _50[21] = 45; _50[22] = 49; _50[23] = 93; _50[24] = 32; _50[25] = 61; _50[26] = 32; 
	_ADD_OWNERSHIP(_50);
	//indirectinvoke () = %49 (%50) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_50));
	//fieldload %51 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %52 = %51 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %53 = %5 data : {int[] data,int height,int width}
	_FREE(_53);
	_1DARRAY_UPDATE(_53, C->data);
	_REMOVE_OWNERSHIP(_53);
	//const %54 = 1 : int
	_54 = 1;
	//sub %55 = %2, %54 : int
	_55=size-_54;
	//mul %56 = %55, %2 : int
	_56=_55*size;
	//add %57 = %56, %2 : int
	_57=_56+size;
	//const %58 = 1 : int
	_58 = 1;
	//sub %59 = %57, %58 : int
	_59=_57-_58;
	//indexof %60 = %53, %59 : int[]
	_60=_53[_59];
	//indirectinvoke () = %52 (%60) : method(any)->()
	printf("%lld\n", _60);
	//fieldload %61 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %62 = %61 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %63 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_63);
	_NEW_ARRAY(_63, 25);
	_63[0] = 80; _63[1] = 97; _63[2] = 115; _63[3] = 115; _63[4] = 32; _63[5] = 77; _63[6] = 97; _63[7] = 116; _63[8] = 114; _63[9] = 105; _63[10] = 120; _63[11] = 77; _63[12] = 117; _63[13] = 108; _63[14] = 116; _63[15] = 32; _63[16] = 116; _63[17] = 101; _63[18] = 115; _63[19] = 116; _63[20] = 32; _63[21] = 99; _63[22] = 97; _63[23] = 115; _63[24] = 101; 
	_ADD_OWNERSHIP(_63);
	//indirectinvoke () = %62 (%63) : method(int[])->()
	println_s(_63, _63_size);
//.blklab23
blklab23:;
	//return
	_FREE(max);
	_FREE_STRUCT(A, Matrix);
	_FREE_STRUCT(B, Matrix);
	_FREE_STRUCT(C, Matrix);
	_FREE(_6);
	_FREE2DArray(_7);
	_FREE(_9);
	_FREE(_12);
	_FREE_STRUCT(_15, Matrix);
	_FREE_STRUCT(_16, Matrix);
	_FREE_STRUCT(_17, Matrix);
	_FREE(_18);
	_FREE(_28);
	_FREE(_39);
	_FREE(_50);
	_FREE(_53);
	_FREE(_63);
	exit(0);
}
