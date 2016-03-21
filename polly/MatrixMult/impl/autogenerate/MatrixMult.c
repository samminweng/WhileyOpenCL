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
	printf("%d", matrix->width);
	printf(" height:");
	printf("%d", matrix->height);
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

Matrix* init(){
	Matrix* r;
	_DECL_OWNERSHIP(r);
	_DECL_1DARRAY(data);
	_DECL_OWNERSHIP(data);
	long long i = 0;
	long long j = 0;
	long long _4 = 0;
	long long _5 = 0;
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
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	Matrix* _25;
	_DECL_OWNERSHIP(_25);
	long long _26 = 0;
	long long _27 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 10 : int
	_5 = 10;
	//const %6 = 10 : int
	_6 = 10;
	//mul %7 = %5, %6 : int
	_7=_5*_6;
	//arraygen %8 = [4; 7] : int[]
	_FREE(_8);
	_GEN_1DARRAY(_8, _7, _4);
	_ADD_OWNERSHIP(_8);
	//assign %1 = %8  : int[]
	_FREE(data);
	_1DARRAY_UPDATE(data, _8);
	_ADD_OWNERSHIP(data);
	_REMOVE_OWNERSHIP(_8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %2 = %9  : int
	i = _9;
	//loop (%1, %2, %3, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24)
	while(true){
		//const %10 = 10 : int
		_10 = 10;
		//ifge %2, %10 goto blklab1 : int
		if(i>=_10){goto blklab1;}
		//const %11 = 0 : int
		_11 = 0;
		//assign %3 = %11  : int
		j = _11;
		//loop (%1, %3, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
		while(true){
			//const %12 = 10 : int
			_12 = 10;
			//ifge %3, %12 goto blklab3 : int
			if(j>=_12){goto blklab3;}
			//const %13 = 10 : int
			_13 = 10;
			//mul %14 = %2, %13 : int
			_14=i*_13;
			//add %15 = %14, %3 : int
			_15=_14+j;
			//indexof %16 = %1, %15 : int[]
			_16=data[_15];
			//add %17 = %16, %2 : int
			_17=_16+i;
			//const %18 = 10 : int
			_18 = 10;
			//mul %19 = %2, %18 : int
			_19=i*_18;
			//add %20 = %19, %3 : int
			_20=_19+j;
			//update %1[%20] = %17 : int[] -> int[]
			data[_20] = _17;
			//const %21 = 1 : int
			_21 = 1;
			//add %22 = %3, %21 : int
			_22=j+_21;
			//assign %3 = %22  : int
			j = _22;
//.blklab4
blklab4:;
		}
//.blklab3
blklab3:;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %2, %23 : int
		_24=i+_23;
		//assign %2 = %24  : int
		i = _24;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//const %26 = 10 : int
	_26 = 10;
	//const %27 = 10 : int
	_27 = 10;
	//invoke (%25) = (%26, %27, %1) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[])->(MatrixMult:Matrix)
	_FREE_STRUCT(_25, Matrix);
	_ADD_OWNERSHIP(data);
	_25 = matrix(_26, _27, _1DARRAY_PARAM(data), false);
	_ADD_OWNERSHIP(_25);
	//return %25
	_FREE_STRUCT(r, Matrix);
	_FREE(data);
	_FREE(_8);
	return _25;
	//return
}

Matrix* mat_mult(Matrix* a, _DECL_OWNERSHIP_PARAM(a), Matrix* b, _DECL_OWNERSHIP_PARAM(b)){
	Matrix* r;
	_DECL_OWNERSHIP(r);
	_DECL_1DARRAY(data);
	_DECL_OWNERSHIP(data);
	_DECL_1DARRAY(a_data);
	_DECL_OWNERSHIP(a_data);
	_DECL_1DARRAY(b_data);
	_DECL_OWNERSHIP(b_data);
	long long i = 0;
	long long j = 0;
	long long k = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	_DECL_1DARRAY(_13);
	_DECL_OWNERSHIP(_13);
	_DECL_1DARRAY(_14);
	_DECL_OWNERSHIP(_14);
	_DECL_1DARRAY(_15);
	_DECL_OWNERSHIP(_15);
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
	Matrix* _45;
	_DECL_OWNERSHIP(_45);
	long long _46 = 0;
	long long _47 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//const %10 = 10 : int
	_10 = 10;
	//const %11 = 10 : int
	_11 = 10;
	//mul %12 = %10, %11 : int
	_12=_10*_11;
	//arraygen %13 = [9; 12] : int[]
	_FREE(_13);
	_GEN_1DARRAY(_13, _12, _9);
	_ADD_OWNERSHIP(_13);
	//assign %3 = %13  : int[]
	_FREE(data);
	_1DARRAY_UPDATE(data, _13);
	_ADD_OWNERSHIP(data);
	_REMOVE_OWNERSHIP(_13);
	//fieldload %14 = %0 data : {int[] data,int height,int width}
	_FREE(_14);
	_1DARRAY_COPY(_14, a->data);
	_ADD_OWNERSHIP(_14);
	//assign %4 = %14  : int[]
	_FREE(a_data);
	_1DARRAY_UPDATE(a_data, _14);
	_ADD_OWNERSHIP(a_data);
	_REMOVE_OWNERSHIP(_14);
	//fieldload %15 = %1 data : {int[] data,int height,int width}
	_FREE(_15);
	_1DARRAY_COPY(_15, b->data);
	_ADD_OWNERSHIP(_15);
	//assign %5 = %15  : int[]
	_FREE(b_data);
	_1DARRAY_UPDATE(b_data, _15);
	_ADD_OWNERSHIP(b_data);
	_REMOVE_OWNERSHIP(_15);
	//const %16 = 0 : int
	_16 = 0;
	//assign %6 = %16  : int
	i = _16;
	//loop (%3, %6, %7, %8, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44)
	while(true){
		//const %17 = 10 : int
		_17 = 10;
		//ifge %6, %17 goto blklab5 : int
		if(i>=_17){goto blklab5;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %7 = %18  : int
		j = _18;
		//loop (%3, %7, %8, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42)
		while(true){
			//const %19 = 10 : int
			_19 = 10;
			//ifge %7, %19 goto blklab7 : int
			if(j>=_19){goto blklab7;}
			//const %20 = 0 : int
			_20 = 0;
			//assign %8 = %20  : int
			k = _20;
			//loop (%3, %8, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40)
			while(true){
				//const %21 = 10 : int
				_21 = 10;
				//ifge %8, %21 goto blklab9 : int
				if(k>=_21){goto blklab9;}
				//const %22 = 10 : int
				_22 = 10;
				//mul %23 = %6, %22 : int
				_23=i*_22;
				//add %24 = %23, %7 : int
				_24=_23+j;
				//indexof %25 = %3, %24 : int[]
				_25=data[_24];
				//const %26 = 10 : int
				_26 = 10;
				//mul %27 = %6, %26 : int
				_27=i*_26;
				//add %28 = %27, %8 : int
				_28=_27+k;
				//indexof %29 = %4, %28 : int[]
				_29=a_data[_28];
				//const %30 = 10 : int
				_30 = 10;
				//mul %31 = %8, %30 : int
				_31=k*_30;
				//add %32 = %31, %7 : int
				_32=_31+j;
				//indexof %33 = %5, %32 : int[]
				_33=b_data[_32];
				//mul %34 = %29, %33 : int
				_34=_29*_33;
				//add %35 = %25, %34 : int
				_35=_25+_34;
				//const %36 = 10 : int
				_36 = 10;
				//mul %37 = %6, %36 : int
				_37=i*_36;
				//add %38 = %37, %7 : int
				_38=_37+j;
				//update %3[%38] = %35 : int[] -> int[]
				data[_38] = _35;
				//const %39 = 1 : int
				_39 = 1;
				//add %40 = %8, %39 : int
				_40=k+_39;
				//assign %8 = %40  : int
				k = _40;
//.blklab10
blklab10:;
			}
//.blklab9
blklab9:;
			//const %41 = 1 : int
			_41 = 1;
			//add %42 = %7, %41 : int
			_42=j+_41;
			//assign %7 = %42  : int
			j = _42;
//.blklab8
blklab8:;
		}
//.blklab7
blklab7:;
		//const %43 = 1 : int
		_43 = 1;
		//add %44 = %6, %43 : int
		_44=i+_43;
		//assign %6 = %44  : int
		i = _44;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//const %46 = 10 : int
	_46 = 10;
	//const %47 = 10 : int
	_47 = 10;
	//invoke (%45) = (%46, %47, %3) MatrixMult:matrix : function(MatrixMult:nat,MatrixMult:nat,int[])->(MatrixMult:Matrix)
	_FREE_STRUCT(_45, Matrix);
	_ADD_OWNERSHIP(data);
	_45 = matrix(_46, _47, _1DARRAY_PARAM(data), false);
	_ADD_OWNERSHIP(_45);
	//return %45
	_FREE_STRUCT(a, Matrix);
	_FREE_STRUCT(b, Matrix);
	_FREE_STRUCT(r, Matrix);
	_FREE(data);
	_FREE(a_data);
	_FREE(b_data);
	_FREE(_13);
	_FREE(_14);
	_FREE(_15);
	return _45;
	//return
}

int main(int argc, char** args){
	Matrix* A;
	_DECL_OWNERSHIP(A);
	Matrix* B;
	_DECL_OWNERSHIP(B);
	Matrix* C;
	_DECL_OWNERSHIP(C);
	_DECL_1DARRAY(data);
	_DECL_OWNERSHIP(data);
	Matrix* _5;
	_DECL_OWNERSHIP(_5);
	void* _6;
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	_DECL_OWNERSHIP(_11);
	long long _12 = 0;
	long long _13 = 0;
	Matrix* _14;
	_DECL_OWNERSHIP(_14);
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_OWNERSHIP(_17);
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_OWNERSHIP(_20);
	long long _21 = 0;
	long long _22 = 0;
	Matrix* _23;
	_DECL_OWNERSHIP(_23);
	_DECL_1DARRAY(_24);
	_DECL_OWNERSHIP(_24);
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_OWNERSHIP(_27);
	void* _28;
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
	void* _43;
	_DECL_1DARRAY(_45);
	_DECL_OWNERSHIP(_45);
	//invoke (%5) = () MatrixMult:init : function()->(MatrixMult:Matrix)
	_FREE_STRUCT(_5, Matrix);
	_5 = init();
	_ADD_OWNERSHIP(_5);
	//assign %1 = %5  : {int[] data,int height,int width}
	_FREE_STRUCT(A, Matrix);
	A = _5;
	_ADD_OWNERSHIP(A);
	_REMOVE_OWNERSHIP(_5);
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %8 = [77,97,116,114,105,120,32,65,91,78,93,32,61,32] : int[]
	_FREE(_8);
	_NEW_ARRAY(_8, 14);
	_8[0] = 77; _8[1] = 97; _8[2] = 116; _8[3] = 114; _8[4] = 105; _8[5] = 120; _8[6] = 32; _8[7] = 65; _8[8] = 91; _8[9] = 78; _8[10] = 93; _8[11] = 32; _8[12] = 61; _8[13] = 32; 
	_ADD_OWNERSHIP(_8);
	//indirectinvoke () = %7 (%8) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_8));
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %11 = %1 data : {int[] data,int height,int width}
	_FREE(_11);
	_1DARRAY_COPY(_11, A->data);
	_ADD_OWNERSHIP(_11);
	//const %12 = 10 : int
	_12 = 10;
	//indexof %13 = %11, %12 : int[]
	_13=_11[_12];
	//indirectinvoke () = %10 (%13) : method(any)->()
	printf("%d\n", _13);
	//invoke (%14) = () MatrixMult:init : function()->(MatrixMult:Matrix)
	_FREE_STRUCT(_14, Matrix);
	_14 = init();
	_ADD_OWNERSHIP(_14);
	//assign %2 = %14  : {int[] data,int height,int width}
	_FREE_STRUCT(B, Matrix);
	B = _14;
	_ADD_OWNERSHIP(B);
	_REMOVE_OWNERSHIP(_14);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [77,97,116,114,105,120,32,66,91,78,93,32,61,32] : int[]
	_FREE(_17);
	_NEW_ARRAY(_17, 14);
	_17[0] = 77; _17[1] = 97; _17[2] = 116; _17[3] = 114; _17[4] = 105; _17[5] = 120; _17[6] = 32; _17[7] = 66; _17[8] = 91; _17[9] = 78; _17[10] = 93; _17[11] = 32; _17[12] = 61; _17[13] = 32; 
	_ADD_OWNERSHIP(_17);
	//indirectinvoke () = %16 (%17) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_17));
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %20 = %2 data : {int[] data,int height,int width}
	_FREE(_20);
	_1DARRAY_COPY(_20, B->data);
	_ADD_OWNERSHIP(_20);
	//const %21 = 10 : int
	_21 = 10;
	//indexof %22 = %20, %21 : int[]
	_22=_20[_21];
	//indirectinvoke () = %19 (%22) : method(any)->()
	printf("%d\n", _22);
	//invoke (%23) = (%1, %2) MatrixMult:mat_mult : function(MatrixMult:Matrix,MatrixMult:Matrix)->(MatrixMult:Matrix)
	_FREE_STRUCT(_23, Matrix);
	_ADD_OWNERSHIP(A);
	_ADD_OWNERSHIP(B);
	_23 = mat_mult(_STRUCT_PARAM(A), false, _STRUCT_PARAM(B), false);
	_ADD_OWNERSHIP(_23);
	//assign %3 = %23  : {int[] data,int height,int width}
	_FREE_STRUCT(C, Matrix);
	C = _23;
	_ADD_OWNERSHIP(C);
	_REMOVE_OWNERSHIP(_23);
	//fieldload %24 = %3 data : {int[] data,int height,int width}
	_FREE(_24);
	_1DARRAY_COPY(_24, C->data);
	_ADD_OWNERSHIP(_24);
	//assign %4 = %24  : int[]
	_FREE(data);
	_1DARRAY_UPDATE(data, _24);
	_ADD_OWNERSHIP(data);
	_REMOVE_OWNERSHIP(_24);
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [77,97,116,114,105,120,32,67,91,78,93,32,61,32] : int[]
	_FREE(_27);
	_NEW_ARRAY(_27, 14);
	_27[0] = 77; _27[1] = 97; _27[2] = 116; _27[3] = 114; _27[4] = 105; _27[5] = 120; _27[6] = 32; _27[7] = 67; _27[8] = 91; _27[9] = 78; _27[10] = 93; _27[11] = 32; _27[12] = 61; _27[13] = 32; 
	_ADD_OWNERSHIP(_27);
	//indirectinvoke () = %26 (%27) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_27));
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = 10 : int
	_30 = 10;
	//indexof %31 = %4, %30 : int[]
	_31=data[_30];
	//indirectinvoke () = %29 (%31) : method(any)->()
	printf("%d\n", _31);
	//assert
	{
		//const %32 = 0 : int
		_32 = 0;
		//indexof %33 = %4, %32 : int[]
		_33=data[_32];
		//const %34 = 0 : int
		_34 = 0;
		//ifeq %33, %34 goto blklab11 : int
		if(_33==_34){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//assert
	{
		//const %35 = 10 : int
		_35 = 10;
		//indexof %36 = %4, %35 : int[]
		_36=data[_35];
		//const %37 = 45 : int
		_37 = 45;
		//ifeq %36, %37 goto blklab12 : int
		if(_36==_37){goto blklab12;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab12
blklab12:;
	//assert
	}
	//assert
	{
		//const %38 = 2 : int
		_38 = 2;
		//const %39 = 10 : int
		_39 = 10;
		//mul %40 = %38, %39 : int
		_40=_38*_39;
		//indexof %41 = %4, %40 : int[]
		_41=data[_40];
		//const %42 = 90 : int
		_42 = 90;
		//ifeq %41, %42 goto blklab13 : int
		if(_41==_42){goto blklab13;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab13
blklab13:;
	//assert
	}
	//fieldload %43 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %44 = %43 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %45 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_45);
	_NEW_ARRAY(_45, 25);
	_45[0] = 80; _45[1] = 97; _45[2] = 115; _45[3] = 115; _45[4] = 32; _45[5] = 77; _45[6] = 97; _45[7] = 116; _45[8] = 114; _45[9] = 105; _45[10] = 120; _45[11] = 77; _45[12] = 117; _45[13] = 108; _45[14] = 116; _45[15] = 32; _45[16] = 116; _45[17] = 101; _45[18] = 115; _45[19] = 116; _45[20] = 32; _45[21] = 99; _45[22] = 97; _45[23] = 115; _45[24] = 101; 
	_ADD_OWNERSHIP(_45);
	//indirectinvoke () = %44 (%45) : method(int[])->()
	println_s(_1DARRAY_PARAM(_45));
	//return
	_FREE_STRUCT(A, Matrix);
	_FREE_STRUCT(B, Matrix);
	_FREE_STRUCT(C, Matrix);
	_FREE(data);
	_FREE_STRUCT(_5, Matrix);
	_FREE(_8);
	_FREE(_11);
	_FREE_STRUCT(_14, Matrix);
	_FREE(_17);
	_FREE(_20);
	_FREE_STRUCT(_23, Matrix);
	_FREE(_24);
	_FREE(_27);
	_FREE(_45);
	exit(0);
}

