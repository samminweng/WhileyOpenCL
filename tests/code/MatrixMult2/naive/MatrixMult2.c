#include "MatrixMult2.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_1DARRAY_COPY(new_Matrix->data, _Matrix->data);
	new_Matrix->width = _Matrix->width;
	new_Matrix->height = _Matrix->height;
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
Matrix* matrix(long long width, long long height, _DECL_1DARRAY_PARAM(data)){
	Matrix* r;
	Matrix* _4;
	//newrecord %4 = (%2, %1, %0) : {int[] data,int height,int width}
	_4 = malloc(sizeof(Matrix));
	_1DARRAY_COPY(_4->data, data);
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
	_GEN_1DARRAY(_8, _7, _6);
	//assign %3 = %8  : int[]
	_1DARRAY_COPY(data, _8);
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
	//invoke (%21) = (%0, %1, %3) MatrixMult2:matrix : function(MatrixMult2:nat,MatrixMult2:nat,int[])->(MatrixMult2:Matrix)
	_21 = matrix(width, height, _1DARRAY_COPY_PARAM(data));
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
	_DECL_1DARRAY(_25);
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
			_1DARRAY_COPY(_12, a->data);
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
			_NEW_ARRAY(_18, 1);
			_18[0] = 32; 
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
		_NEW_ARRAY(_25, 0);
		//indirectinvoke () = %24 (%25) : method(int[])->()
		println_s(_1DARRAY_PARAM(_25));
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
	long long i = 0;
	long long j = 0;
	long long k = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_1DARRAY(_16);
	_DECL_1DARRAY(_17);
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
	_GEN_1DARRAY(_15, _14, _13);
	//assign %5 = %15  : int[]
	_1DARRAY_COPY(data, _15);
	//fieldload %16 = %0 data : {int[] data,int height,int width}
	_1DARRAY_COPY(_16, a->data);
	//assign %6 = %16  : int[]
	_1DARRAY_COPY(a_data, _16);
	//fieldload %17 = %1 data : {int[] data,int height,int width}
	_1DARRAY_COPY(_17, b->data);
	//assign %7 = %17  : int[]
	_1DARRAY_COPY(b_data, _17);
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
	//invoke (%40) = (%3, %4, %5) MatrixMult2:matrix : function(MatrixMult2:nat,MatrixMult2:nat,int[])->(MatrixMult2:Matrix)
	_40 = matrix(width, height, _1DARRAY_COPY_PARAM(data));
	//return %40
	return _40;
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
	Matrix* _13;
	long long _14 = 0;
	long long _15 = 0;
	Matrix* _16;
	_DECL_1DARRAY(_17);
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
	_DECL_1DARRAY(_31);
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
	_NEW_ARRAY(_6, 4);
	_6[0] = 78; _6[1] = 32; _6[2] = 61; _6[3] = 32; 
	//indirectinvoke () = %5 (%6) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_6));
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = 20 : int
	_9 = 20;
	//indirectinvoke () = %8 (%9) : method(any)->()
	printf("%lld\n", _9);
	//const %11 = 20 : int
	_11 = 20;
	//const %12 = 20 : int
	_12 = 20;
	//invoke (%10) = (%11, %12) MatrixMult2:init : function(MatrixMult2:nat,MatrixMult2:nat)->(MatrixMult2:Matrix)
	_10 = init(_11, _12);
	//assign %1 = %10  : {int[] data,int height,int width}
	A = copy_Matrix(_10);
	//const %14 = 20 : int
	_14 = 20;
	//const %15 = 20 : int
	_15 = 20;
	//invoke (%13) = (%14, %15) MatrixMult2:init : function(MatrixMult2:nat,MatrixMult2:nat)->(MatrixMult2:Matrix)
	_13 = init(_14, _15);
	//assign %2 = %13  : {int[] data,int height,int width}
	B = copy_Matrix(_13);
	//invoke (%16) = (%1, %2) MatrixMult2:mat_mult : function(MatrixMult2:Matrix,MatrixMult2:Matrix)->(MatrixMult2:Matrix)
	_16 = mat_mult(_STRUCT_COPY_PARAM(A, Matrix), _STRUCT_COPY_PARAM(B, Matrix));
	//assign %3 = %16  : {int[] data,int height,int width}
	C = copy_Matrix(_16);
	//assert
	{
		//fieldload %17 = %1 data : {int[] data,int height,int width}
		_1DARRAY_COPY(_17, A->data);
		//const %18 = 20 : int
		_18 = 20;
		//const %19 = 1 : int
		_19 = 1;
		//sub %20 = %18, %19 : int
		_20=_18-_19;
		//const %21 = 20 : int
		_21 = 20;
		//mul %22 = %20, %21 : int
		_22=_20*_21;
		//const %23 = 20 : int
		_23 = 20;
		//add %24 = %22, %23 : int
		_24=_22+_23;
		//const %25 = 1 : int
		_25 = 1;
		//sub %26 = %24, %25 : int
		_26=_24-_25;
		//indexof %27 = %17, %26 : int[]
		_27=_17[_26];
		//const %28 = 20 : int
		_28 = 20;
		//const %29 = 1 : int
		_29 = 1;
		//sub %30 = %28, %29 : int
		_30=_28-_29;
		//ifeq %27, %30 goto blklab19 : int
		if(_27==_30){goto blklab19;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab19
blklab19:;
	//assert
	}
	//assert
	{
		//fieldload %31 = %2 data : {int[] data,int height,int width}
		_1DARRAY_COPY(_31, B->data);
		//const %32 = 20 : int
		_32 = 20;
		//const %33 = 1 : int
		_33 = 1;
		//sub %34 = %32, %33 : int
		_34=_32-_33;
		//const %35 = 20 : int
		_35 = 20;
		//mul %36 = %34, %35 : int
		_36=_34*_35;
		//const %37 = 20 : int
		_37 = 20;
		//add %38 = %36, %37 : int
		_38=_36+_37;
		//const %39 = 1 : int
		_39 = 1;
		//sub %40 = %38, %39 : int
		_40=_38-_39;
		//indexof %41 = %31, %40 : int[]
		_41=_31[_40];
		//const %42 = 20 : int
		_42 = 20;
		//const %43 = 1 : int
		_43 = 1;
		//sub %44 = %42, %43 : int
		_44=_42-_43;
		//ifeq %41, %44 goto blklab20 : int
		if(_41==_44){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//assert
	{
		//fieldload %45 = %3 data : {int[] data,int height,int width}
		_1DARRAY_COPY(_45, C->data);
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
		//ifeq %55, %56 goto blklab21 : int
		if(_55==_56){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//invoke () = (%0, %3) MatrixMult2:print_mat : method(whiley/lang/System:Console,MatrixMult2:Matrix)->()
print_mat(stdout, _STRUCT_COPY_PARAM(C, Matrix));
	//fieldload %57 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %58 = %57 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %59 = [77,97,116,114,105,120,32,67,91,78,45,49,93,91,78,45,49,93,32,61,32] : int[]
	_NEW_ARRAY(_59, 21);
	_59[0] = 77; _59[1] = 97; _59[2] = 116; _59[3] = 114; _59[4] = 105; _59[5] = 120; _59[6] = 32; _59[7] = 67; _59[8] = 91; _59[9] = 78; _59[10] = 45; _59[11] = 49; _59[12] = 93; _59[13] = 91; _59[14] = 78; _59[15] = 45; _59[16] = 49; _59[17] = 93; _59[18] = 32; _59[19] = 61; _59[20] = 32; 
	//indirectinvoke () = %58 (%59) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_59));
	//fieldload %60 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %61 = %60 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %62 = %3 data : {int[] data,int height,int width}
	_1DARRAY_COPY(_62, C->data);
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
	printf("%lld\n", _72);
	//fieldload %73 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %74 = %73 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %75 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,50,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_ARRAY(_75, 26);
	_75[0] = 80; _75[1] = 97; _75[2] = 115; _75[3] = 115; _75[4] = 32; _75[5] = 77; _75[6] = 97; _75[7] = 116; _75[8] = 114; _75[9] = 105; _75[10] = 120; _75[11] = 77; _75[12] = 117; _75[13] = 108; _75[14] = 116; _75[15] = 50; _75[16] = 32; _75[17] = 116; _75[18] = 101; _75[19] = 115; _75[20] = 116; _75[21] = 32; _75[22] = 99; _75[23] = 97; _75[24] = 115; _75[25] = 101; 
	//indirectinvoke () = %74 (%75) : method(int[])->()
	println_s(_1DARRAY_PARAM(_75));
	//return
	exit(0);
}
