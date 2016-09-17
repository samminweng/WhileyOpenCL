#include "MatrixMult3.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_COPY_1DARRAY_LONGLONG(new_Matrix->data, _Matrix->data);
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
	matrix->data = NULL;
	free(matrix);
}
void printf_Matrix(Matrix* matrix){
	printf("{");
	printf(" data:");
	_PRINT_1DARRAY_LONGLONG(matrix->data);
	printf(" width:");
	printf("%lld", matrix->width);
	printf(" height:");
	printf("%lld", matrix->height);
	printf("}");
}
Matrix* matrix(long long width, long long height, _DECL_1DARRAY_PARAM(data)){
	Matrix* r;
	Matrix* _4;
	//newrecord %4 = (%2, %1, %0) : {int[] data,int height,int width}
	_4 = malloc(sizeof(Matrix));
	_COPY_1DARRAY_LONGLONG(_4->data, data);
	_4->height = height;
	_4->width = width;
	//return %4
	return _4;
	//return
}

Matrix* init(long long width, long long height){
	Matrix* r;
	_DECL_1DARRAY(data);
	long long i = 0;
	long long j = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
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
	//const %6 = 0 : int
	_6 = 0;
	//mul %7 = %0, %1 : int
	_7=width*height;
	//arraygen %8 = [6; 7] : int[]
	_NEW_1DARRAY_LONGLONG(_8, _7, _6);
	//assign %3 = %8  : int[]
	_COPY_1DARRAY_LONGLONG(data, _8);
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
	//invoke (%21) = (%0, %1, %3) MatrixMult3:matrix : function(MatrixMult3:nat,MatrixMult3:nat,int[])->(MatrixMult3:Matrix)
	{
		void* data_tmp;
		_21 = matrix(width, height, _COPY_1DARRAY_PARAM_LONGLONG(data));
	}
	//return %21
	return _21;
	//return
}

void print_mat(FILE* sys, Matrix* a){
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
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	void* _23;
	void* _25;
	long long _25_size = 0;
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
				printf("%lld", _15);
			}
			//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %17 = %16 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %18 = [32] : int[]
			_NEW_1DARRAY_LONGLONG(_18, 1, 0);
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
		_NEW_1DARRAY_LONGLONG(_25, 0, 0);
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
	long long width = 0;
	long long height = 0;
	_DECL_1DARRAY(data);
	_DECL_1DARRAY(a_data);
	_DECL_1DARRAY(b_data);
	_DECL_1DARRAY(b_t);
	long long i = 0;
	long long j = 0;
	long long k = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	_DECL_1DARRAY(_16);
	_DECL_1DARRAY(_17);
	_DECL_1DARRAY(_18);
	long long _19 = 0;
	long long _20 = 0;
	_DECL_1DARRAY(_21);
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
	_NEW_1DARRAY_LONGLONG(_16, _15, _14);
	//assign %5 = %16  : int[]
	_COPY_1DARRAY_LONGLONG(data, _16);
	//fieldload %17 = %0 data : {int[] data,int height,int width}
	_UPDATE_1DARRAY(_17, a->data);
	//assign %6 = %17  : int[]
	_COPY_1DARRAY_LONGLONG(a_data, _17);
	//fieldload %18 = %1 data : {int[] data,int height,int width}
	_UPDATE_1DARRAY(_18, b->data);
	//assign %7 = %18  : int[]
	_COPY_1DARRAY_LONGLONG(b_data, _18);
	//const %19 = 0 : int
	_19 = 0;
	//mul %20 = %3, %4 : int
	_20=width*height;
	//arraygen %21 = [19; 20] : int[]
	_NEW_1DARRAY_LONGLONG(_21, _20, _19);
	//assign %8 = %21  : int[]
	_COPY_1DARRAY_LONGLONG(b_t, _21);
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
	//invoke (%58) = (%3, %4, %5) MatrixMult3:matrix : function(MatrixMult3:nat,MatrixMult3:nat,int[])->(MatrixMult3:Matrix)
	{
		void* data_tmp;
		_58 = matrix(width, height, _COPY_1DARRAY_PARAM_LONGLONG(data));
	}
	//return %58
	return _58;
	//return
}

int main(int argc, char** args){
	Matrix* A;
	Matrix* B;
	Matrix* C;
	void* _4;
	_DECL_1DARRAY(_6);
	void* _7;
	long long _9 = 0;
	Matrix* _10;
	long long _11 = 0;
	long long _12 = 0;
	_DECL_1DARRAY(_13);
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
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	Matrix* _27;
	long long _28 = 0;
	long long _29 = 0;
	_DECL_1DARRAY(_30);
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
	Matrix* _44;
	_DECL_1DARRAY(_45);
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
	void* _57;
	_DECL_1DARRAY(_59);
	void* _60;
	_DECL_1DARRAY(_62);
	long long _63 = 0;
	long long _64 = 0;
	long long _65 = 0;
	long long _66 = 0;
	long long _67 = 0;
	long long _68 = 0;
	long long _69 = 0;
	long long _70 = 0;
	long long _71 = 0;
	long long _72 = 0;
	void* _73;
	_DECL_1DARRAY(_75);
	//fieldload %4 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %5 = %4 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %6 = [78,32,61,32] : int[]
	_NEW_1DARRAY_LONGLONG(_6, 4, 0);
	_6[0] = 78; _6[1] = 32; _6[2] = 61; _6[3] = 32; 
	//indirectinvoke () = %5 (%6) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_6));
	}
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = 20 : int
	_9 = 20;
	//indirectinvoke () = %8 (%9) : method(any)->()
	{
		printf("%lld\n", _9);
	}
	//const %11 = 20 : int
	_11 = 20;
	//const %12 = 20 : int
	_12 = 20;
	//invoke (%10) = (%11, %12) MatrixMult3:init : function(MatrixMult3:nat,MatrixMult3:nat)->(MatrixMult3:Matrix)
	{
		_10 = init(_11, _12);
	}
	//assign %1 = %10  : {int[] data,int height,int width}
	A = copy_Matrix(_10);
	//assert
	{
		//fieldload %13 = %1 data : {int[] data,int height,int width}
		_UPDATE_1DARRAY(_13, A->data);
		//const %14 = 20 : int
		_14 = 20;
		//const %15 = 1 : int
		_15 = 1;
		//sub %16 = %14, %15 : int
		_16=_14-_15;
		//const %17 = 20 : int
		_17 = 20;
		//mul %18 = %16, %17 : int
		_18=_16*_17;
		//const %19 = 20 : int
		_19 = 20;
		//add %20 = %18, %19 : int
		_20=_18+_19;
		//const %21 = 1 : int
		_21 = 1;
		//sub %22 = %20, %21 : int
		_22=_20-_21;
		//indexof %23 = %13, %22 : int[]
		_23=_13[_22];
		//const %24 = 20 : int
		_24 = 20;
		//const %25 = 1 : int
		_25 = 1;
		//sub %26 = %24, %25 : int
		_26=_24-_25;
		//ifeq %23, %26 goto blklab23 : int
		if(_23==_26){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//const %28 = 20 : int
	_28 = 20;
	//const %29 = 20 : int
	_29 = 20;
	//invoke (%27) = (%28, %29) MatrixMult3:init : function(MatrixMult3:nat,MatrixMult3:nat)->(MatrixMult3:Matrix)
	{
		_27 = init(_28, _29);
	}
	//assign %2 = %27  : {int[] data,int height,int width}
	B = copy_Matrix(_27);
	//assert
	{
		//fieldload %30 = %2 data : {int[] data,int height,int width}
		_UPDATE_1DARRAY(_30, B->data);
		//const %31 = 20 : int
		_31 = 20;
		//const %32 = 1 : int
		_32 = 1;
		//sub %33 = %31, %32 : int
		_33=_31-_32;
		//const %34 = 20 : int
		_34 = 20;
		//mul %35 = %33, %34 : int
		_35=_33*_34;
		//const %36 = 20 : int
		_36 = 20;
		//add %37 = %35, %36 : int
		_37=_35+_36;
		//const %38 = 1 : int
		_38 = 1;
		//sub %39 = %37, %38 : int
		_39=_37-_38;
		//indexof %40 = %30, %39 : int[]
		_40=_30[_39];
		//const %41 = 20 : int
		_41 = 20;
		//const %42 = 1 : int
		_42 = 1;
		//sub %43 = %41, %42 : int
		_43=_41-_42;
		//ifeq %40, %43 goto blklab24 : int
		if(_40==_43){goto blklab24;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab24
blklab24:;
	//assert
	}
	//invoke (%44) = (%1, %2) MatrixMult3:mat_mult : function(MatrixMult3:Matrix,MatrixMult3:Matrix)->(MatrixMult3:Matrix)
	{
		void* A_tmp;
		void* B_tmp;
		_44 = mat_mult(_COPY_STRUCT_PARAM(A, Matrix), _COPY_STRUCT_PARAM(B, Matrix));
	}
	//assign %3 = %44  : {int[] data,int height,int width}
	C = copy_Matrix(_44);
	//assert
	{
		//fieldload %45 = %3 data : {int[] data,int height,int width}
		_UPDATE_1DARRAY(_45, C->data);
		//const %46 = 20 : int
		_46 = 20;
		//const %47 = 1 : int
		_47 = 1;
		//sub %48 = %46, %47 : int
		_48=_46-_47;
		//const %49 = 20 : int
		_49 = 20;
		//mul %50 = %48, %49 : int
		_50=_48*_49;
		//const %51 = 20 : int
		_51 = 20;
		//add %52 = %50, %51 : int
		_52=_50+_51;
		//const %53 = 1 : int
		_53 = 1;
		//sub %54 = %52, %53 : int
		_54=_52-_53;
		//indexof %55 = %45, %54 : int[]
		_55=_45[_54];
		//const %56 = 3610 : int
		_56 = 3610;
		//ifeq %55, %56 goto blklab25 : int
		if(_55==_56){goto blklab25;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab25
blklab25:;
	//assert
	}
	//invoke () = (%0, %3) MatrixMult3:print_mat : method(whiley/lang/System:Console,MatrixMult3:Matrix)->()
	{
		void* C_tmp;
		print_mat(stdout, _COPY_STRUCT_PARAM(C, Matrix));
	}
	//fieldload %57 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %58 = %57 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %59 = [77,97,116,114,105,120,32,67,91,78,45,49,93,91,78,45,49,93,32,61,32] : int[]
	_NEW_1DARRAY_LONGLONG(_59, 21, 0);
	_59[0] = 77; _59[1] = 97; _59[2] = 116; _59[3] = 114; _59[4] = 105; _59[5] = 120; _59[6] = 32; _59[7] = 67; _59[8] = 91; _59[9] = 78; _59[10] = 45; _59[11] = 49; _59[12] = 93; _59[13] = 91; _59[14] = 78; _59[15] = 45; _59[16] = 49; _59[17] = 93; _59[18] = 32; _59[19] = 61; _59[20] = 32; 
	//indirectinvoke () = %58 (%59) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_59));
	}
	//fieldload %60 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %61 = %60 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %62 = %3 data : {int[] data,int height,int width}
	_UPDATE_1DARRAY(_62, C->data);
	//const %63 = 20 : int
	_63 = 20;
	//const %64 = 1 : int
	_64 = 1;
	//sub %65 = %63, %64 : int
	_65=_63-_64;
	//const %66 = 20 : int
	_66 = 20;
	//mul %67 = %65, %66 : int
	_67=_65*_66;
	//const %68 = 20 : int
	_68 = 20;
	//add %69 = %67, %68 : int
	_69=_67+_68;
	//const %70 = 1 : int
	_70 = 1;
	//sub %71 = %69, %70 : int
	_71=_69-_70;
	//indexof %72 = %62, %71 : int[]
	_72=_62[_71];
	//indirectinvoke () = %61 (%72) : method(any)->()
	{
		printf("%lld\n", _72);
	}
	//fieldload %73 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %74 = %73 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %75 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,50,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_LONGLONG(_75, 26, 0);
	_75[0] = 80; _75[1] = 97; _75[2] = 115; _75[3] = 115; _75[4] = 32; _75[5] = 77; _75[6] = 97; _75[7] = 116; _75[8] = 114; _75[9] = 105; _75[10] = 120; _75[11] = 77; _75[12] = 117; _75[13] = 108; _75[14] = 116; _75[15] = 50; _75[16] = 32; _75[17] = 116; _75[18] = 101; _75[19] = 115; _75[20] = 116; _75[21] = 32; _75[22] = 99; _75[23] = 97; _75[24] = 115; _75[25] = 101; 
	//indirectinvoke () = %74 (%75) : method(int[])->()
	{
		println_s(_75, _75_size);
	}
	//return
	exit(0);
}

