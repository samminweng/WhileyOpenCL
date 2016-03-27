#include "MatrixMult.h"
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
	_ADD_OWNERSHIP(data);
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
	_ADD_OWNERSHIP(data);
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
	_DECL_1DARRAY(_25);
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
		println_s(_1DARRAY_PARAM(_25));
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//return
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
	_ADD_OWNERSHIP(data);
	_REMOVE_OWNERSHIP(_15);
	//fieldload %16 = %0 data : {int[] data,int height,int width}
	_FREE(_16);
	_1DARRAY_COPY(_16, a->data);
	_ADD_OWNERSHIP(_16);
	//assign %6 = %16  : int[]
	_FREE(a_data);
	_1DARRAY_UPDATE(a_data, _16);
	_ADD_OWNERSHIP(a_data);
	_REMOVE_OWNERSHIP(_16);
	//fieldload %17 = %1 data : {int[] data,int height,int width}
	_FREE(_17);
	_1DARRAY_COPY(_17, b->data);
	_ADD_OWNERSHIP(_17);
	//assign %7 = %17  : int[]
	_FREE(b_data);
	_1DARRAY_UPDATE(b_data, _17);
	_ADD_OWNERSHIP(b_data);
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
	_ADD_OWNERSHIP(data);
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

int main(int argc, char** args){
	long long max;
	Matrix* A;
	_DECL_OWNERSHIP(A);
	Matrix* B;
	_DECL_OWNERSHIP(B);
	Matrix* C;
	_DECL_OWNERSHIP(C);
	long long _5;
	_DECL_2DARRAY(_6);
	_DECL_OWNERSHIP(_6);
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	_DECL_OWNERSHIP(_11);
	void* _12;
	Matrix* _14;
	_DECL_OWNERSHIP(_14);
	Matrix* _15;
	_DECL_OWNERSHIP(_15);
	Matrix* _16;
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
	_DECL_1DARRAY(_27);
	_DECL_OWNERSHIP(_27);
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
	_DECL_1DARRAY(_38);
	_DECL_OWNERSHIP(_38);
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	void* _47;
	_DECL_1DARRAY(_49);
	_DECL_OWNERSHIP(_49);
	void* _50;
	_DECL_1DARRAY(_52);
	_DECL_OWNERSHIP(_52);
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	long long _59 = 0;
	void* _60;
	_DECL_1DARRAY(_62);
	_DECL_OWNERSHIP(_62);
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	_ADD_OWNERSHIP(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_5, _8);
	//assign %1 = %5  : null|int
	max = _5;
	//ifis %1, null goto blklab19 : null|int
	if(max == NULL) { goto blklab19;}
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [109,97,120,32,61,32] : int[]
	_FREE(_11);
	_NEW_ARRAY(_11, 6);
	_11[0] = 109; _11[1] = 97; _11[2] = 120; _11[3] = 32; _11[4] = 61; _11[5] = 32; 
	_ADD_OWNERSHIP(_11);
	//indirectinvoke () = %10 (%11) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_11));
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %13 (%1) : method(any)->()
	printf("%d\n", max);
	//invoke (%14) = (%1, %1) MatrixMult:init : function(MatrixMult:nat,MatrixMult:nat)->(MatrixMult:Matrix)
	_FREE_STRUCT(_14, Matrix);
	_14 = init(max, max);
	_ADD_OWNERSHIP(_14);
	//assign %2 = %14  : {int[] data,int height,int width}
	_FREE_STRUCT(A, Matrix);
	A = _14;
	_ADD_OWNERSHIP(A);
	_REMOVE_OWNERSHIP(_14);
	//invoke (%15) = (%1, %1) MatrixMult:init : function(MatrixMult:nat,MatrixMult:nat)->(MatrixMult:Matrix)
	_FREE_STRUCT(_15, Matrix);
	_15 = init(max, max);
	_ADD_OWNERSHIP(_15);
	//assign %3 = %15  : {int[] data,int height,int width}
	_FREE_STRUCT(B, Matrix);
	B = _15;
	_ADD_OWNERSHIP(B);
	_REMOVE_OWNERSHIP(_15);
	//invoke (%16) = (%2, %3) MatrixMult:mat_mult : function(MatrixMult:Matrix,MatrixMult:Matrix)->(MatrixMult:Matrix)
	_FREE_STRUCT(_16, Matrix);
	_ADD_OWNERSHIP(A);
	_ADD_OWNERSHIP(B);
	_16 = mat_mult(_STRUCT_PARAM(A), false, _STRUCT_PARAM(B), false);
	_ADD_OWNERSHIP(_16);
	//assign %4 = %16  : {int[] data,int height,int width}
	_FREE_STRUCT(C, Matrix);
	C = _16;
	_ADD_OWNERSHIP(C);
	_REMOVE_OWNERSHIP(_16);
	//assert
	{
		//fieldload %17 = %2 data : {int[] data,int height,int width}
		_FREE(_17);
		_1DARRAY_COPY(_17, A->data);
		_ADD_OWNERSHIP(_17);
		//const %18 = 1 : int
		_18 = 1;
		//sub %19 = %1, %18 : int
		_19=max-_18;
		//mul %20 = %19, %1 : int
		_20=_19*max;
		//add %21 = %20, %1 : int
		_21=_20+max;
		//const %22 = 1 : int
		_22 = 1;
		//sub %23 = %21, %22 : int
		_23=_21-_22;
		//indexof %24 = %17, %23 : int[]
		_24=_17[_23];
		//const %25 = 1 : int
		_25 = 1;
		//sub %26 = %1, %25 : int
		_26=max-_25;
		//ifeq %24, %26 goto blklab20 : int
		if(_24==_26){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//assert
	{
		//fieldload %27 = %3 data : {int[] data,int height,int width}
		_FREE(_27);
		_1DARRAY_COPY(_27, B->data);
		_ADD_OWNERSHIP(_27);
		//const %28 = 1 : int
		_28 = 1;
		//sub %29 = %1, %28 : int
		_29=max-_28;
		//mul %30 = %29, %1 : int
		_30=_29*max;
		//add %31 = %30, %1 : int
		_31=_30+max;
		//const %32 = 1 : int
		_32 = 1;
		//sub %33 = %31, %32 : int
		_33=_31-_32;
		//indexof %34 = %27, %33 : int[]
		_34=_27[_33];
		//const %35 = 1 : int
		_35 = 1;
		//sub %36 = %1, %35 : int
		_36=max-_35;
		//ifeq %34, %36 goto blklab21 : int
		if(_34==_36){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//const %37 = 2000 : int
	_37 = 2000;
	//ifne %1, %37 goto blklab22 : int
	if(max!=_37){goto blklab22;}
	//assert
	{
		//fieldload %38 = %4 data : {int[] data,int height,int width}
		_FREE(_38);
		_1DARRAY_COPY(_38, C->data);
		_ADD_OWNERSHIP(_38);
		//const %39 = 1 : int
		_39 = 1;
		//sub %40 = %1, %39 : int
		_40=max-_39;
		//mul %41 = %40, %1 : int
		_41=_40*max;
		//add %42 = %41, %1 : int
		_42=_41+max;
		//const %43 = 1 : int
		_43 = 1;
		//sub %44 = %42, %43 : int
		_44=_42-_43;
		//indexof %45 = %38, %44 : int[]
		_45=_38[_44];
		//const %46 = 3996001000 : int
		_46 = 3996001000;
		//ifeq %45, %46 goto blklab23 : int
		if(_45==_46){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
//.blklab22
blklab22:;
	//fieldload %47 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %48 = %47 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %49 = [77,97,116,114,105,120,32,67,91,109,97,120,45,49,93,91,109,97,120,45,49,93,32,61,32] : int[]
	_FREE(_49);
	_NEW_ARRAY(_49, 25);
	_49[0] = 77; _49[1] = 97; _49[2] = 116; _49[3] = 114; _49[4] = 105; _49[5] = 120; _49[6] = 32; _49[7] = 67; _49[8] = 91; _49[9] = 109; _49[10] = 97; _49[11] = 120; _49[12] = 45; _49[13] = 49; _49[14] = 93; _49[15] = 91; _49[16] = 109; _49[17] = 97; _49[18] = 120; _49[19] = 45; _49[20] = 49; _49[21] = 93; _49[22] = 32; _49[23] = 61; _49[24] = 32; 
	_ADD_OWNERSHIP(_49);
	//indirectinvoke () = %48 (%49) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_49));
	//fieldload %50 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %51 = %50 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %52 = %4 data : {int[] data,int height,int width}
	_FREE(_52);
	_1DARRAY_COPY(_52, C->data);
	_ADD_OWNERSHIP(_52);
	//const %53 = 1 : int
	_53 = 1;
	//sub %54 = %1, %53 : int
	_54=max-_53;
	//mul %55 = %54, %1 : int
	_55=_54*max;
	//add %56 = %55, %1 : int
	_56=_55+max;
	//const %57 = 1 : int
	_57 = 1;
	//sub %58 = %56, %57 : int
	_58=_56-_57;
	//indexof %59 = %52, %58 : int[]
	_59=_52[_58];
	//indirectinvoke () = %51 (%59) : method(any)->()
	printf("%lld\n", _59);
	//fieldload %60 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %61 = %60 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %62 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,50,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_62);
	_NEW_ARRAY(_62, 26);
	_62[0] = 80; _62[1] = 97; _62[2] = 115; _62[3] = 115; _62[4] = 32; _62[5] = 77; _62[6] = 97; _62[7] = 116; _62[8] = 114; _62[9] = 105; _62[10] = 120; _62[11] = 77; _62[12] = 117; _62[13] = 108; _62[14] = 116; _62[15] = 50; _62[16] = 32; _62[17] = 116; _62[18] = 101; _62[19] = 115; _62[20] = 116; _62[21] = 32; _62[22] = 99; _62[23] = 97; _62[24] = 115; _62[25] = 101; 
	_ADD_OWNERSHIP(_62);
	//indirectinvoke () = %61 (%62) : method(int[])->()
	println_s(_1DARRAY_PARAM(_62));
//.blklab19
blklab19:;
	//return
	_FREE_STRUCT(A, Matrix);
	_FREE_STRUCT(B, Matrix);
	_FREE_STRUCT(C, Matrix);
	_FREE2DArray(_6);
	_FREE(_8);
	_FREE(_11);
	_FREE_STRUCT(_14, Matrix);
	_FREE_STRUCT(_15, Matrix);
	_FREE_STRUCT(_16, Matrix);
	_FREE(_17);
	_FREE(_27);
	_FREE(_38);
	_FREE(_49);
	_FREE(_52);
	_FREE(_62);
	exit(0);
}

