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
	//const %5 = 200 : int
	_5 = 200;
	//const %6 = 200 : int
	_6 = 200;
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
		//const %10 = 200 : int
		_10 = 200;
		//ifge %2, %10 goto blklab1 : int
		if(i>=_10){goto blklab1;}
		//const %11 = 0 : int
		_11 = 0;
		//assign %3 = %11  : int
		j = _11;
		//loop (%1, %3, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
		while(true){
			//const %12 = 200 : int
			_12 = 200;
			//ifge %3, %12 goto blklab3 : int
			if(j>=_12){goto blklab3;}
			//const %13 = 200 : int
			_13 = 200;
			//mul %14 = %2, %13 : int
			_14=i*_13;
			//add %15 = %14, %3 : int
			_15=_14+j;
			//indexof %16 = %1, %15 : int[]
			_16=data[_15];
			//add %17 = %16, %2 : int
			_17=_16+i;
			//const %18 = 200 : int
			_18 = 200;
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
	//const %26 = 200 : int
	_26 = 200;
	//const %27 = 200 : int
	_27 = 200;
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
	//const %10 = 200 : int
	_10 = 200;
	//const %11 = 200 : int
	_11 = 200;
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
		//const %17 = 200 : int
		_17 = 200;
		//ifge %6, %17 goto blklab5 : int
		if(i>=_17){goto blklab5;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %7 = %18  : int
		j = _18;
		//loop (%3, %7, %8, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42)
		while(true){
			//const %19 = 200 : int
			_19 = 200;
			//ifge %7, %19 goto blklab7 : int
			if(j>=_19){goto blklab7;}
			//const %20 = 0 : int
			_20 = 0;
			//assign %8 = %20  : int
			k = _20;
			//loop (%3, %8, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40)
			while(true){
				//const %21 = 200 : int
				_21 = 200;
				//ifge %8, %21 goto blklab9 : int
				if(k>=_21){goto blklab9;}
				//const %22 = 200 : int
				_22 = 200;
				//mul %23 = %6, %22 : int
				_23=i*_22;
				//add %24 = %23, %7 : int
				_24=_23+j;
				//indexof %25 = %3, %24 : int[]
				_25=data[_24];
				//const %26 = 200 : int
				_26 = 200;
				//mul %27 = %6, %26 : int
				_27=i*_26;
				//add %28 = %27, %8 : int
				_28=_27+k;
				//indexof %29 = %4, %28 : int[]
				_29=a_data[_28];
				//const %30 = 200 : int
				_30 = 200;
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
				//const %36 = 200 : int
				_36 = 200;
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
	//const %46 = 200 : int
	_46 = 200;
	//const %47 = 200 : int
	_47 = 200;
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
	void* _4;
	_DECL_1DARRAY(_6);
	_DECL_OWNERSHIP(_6);
	void* _7;
	long long _9 = 0;
	Matrix* _10;
	_DECL_OWNERSHIP(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_OWNERSHIP(_13);
	void* _14;
	_DECL_1DARRAY(_16);
	_DECL_OWNERSHIP(_16);
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
	_DECL_OWNERSHIP(_27);
	void* _28;
	_DECL_1DARRAY(_30);
	_DECL_OWNERSHIP(_30);
	void* _31;
	_DECL_1DARRAY(_33);
	_DECL_OWNERSHIP(_33);
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
	_DECL_OWNERSHIP(_44);
	_DECL_1DARRAY(_45);
	_DECL_OWNERSHIP(_45);
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
	_DECL_OWNERSHIP(_59);
	void* _60;
	_DECL_1DARRAY(_62);
	_DECL_OWNERSHIP(_62);
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
	_DECL_OWNERSHIP(_75);
	void* _76;
	long long _78 = 0;
	void* _79;
	_DECL_1DARRAY(_81);
	_DECL_OWNERSHIP(_81);
	void* _82;
	long long _84 = 0;
	void* _85;
	_DECL_1DARRAY(_87);
	_DECL_OWNERSHIP(_87);
	//fieldload %4 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %5 = %4 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %6 = [78,32,61,32] : int[]
	_FREE(_6);
	_NEW_ARRAY(_6, 4);
	_6[0] = 78; _6[1] = 32; _6[2] = 61; _6[3] = 32; 
	_ADD_OWNERSHIP(_6);
	//indirectinvoke () = %5 (%6) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_6));
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = 200 : int
	_9 = 200;
	//indirectinvoke () = %8 (%9) : method(any)->()
	printf("%lld\n", _9);
	//invoke (%10) = () MatrixMult:init : function()->(MatrixMult:Matrix)
	_FREE_STRUCT(_10, Matrix);
	_10 = init();
	_ADD_OWNERSHIP(_10);
	//assign %1 = %10  : {int[] data,int height,int width}
	_FREE_STRUCT(A, Matrix);
	A = _10;
	_ADD_OWNERSHIP(A);
	_REMOVE_OWNERSHIP(_10);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [77,97,116,114,105,120,32,65,91,78,45,49,93,91,78,45,49,93,32,61,32] : int[]
	_FREE(_13);
	_NEW_ARRAY(_13, 21);
	_13[0] = 77; _13[1] = 97; _13[2] = 116; _13[3] = 114; _13[4] = 105; _13[5] = 120; _13[6] = 32; _13[7] = 65; _13[8] = 91; _13[9] = 78; _13[10] = 45; _13[11] = 49; _13[12] = 93; _13[13] = 91; _13[14] = 78; _13[15] = 45; _13[16] = 49; _13[17] = 93; _13[18] = 32; _13[19] = 61; _13[20] = 32; 
	_ADD_OWNERSHIP(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_13));
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %16 = %1 data : {int[] data,int height,int width}
	_FREE(_16);
	_1DARRAY_COPY(_16, A->data);
	_ADD_OWNERSHIP(_16);
	//const %17 = 200 : int
	_17 = 200;
	//const %18 = 1 : int
	_18 = 1;
	//sub %19 = %17, %18 : int
	_19=_17-_18;
	//const %20 = 200 : int
	_20 = 200;
	//mul %21 = %19, %20 : int
	_21=_19*_20;
	//const %22 = 200 : int
	_22 = 200;
	//add %23 = %21, %22 : int
	_23=_21+_22;
	//const %24 = 1 : int
	_24 = 1;
	//sub %25 = %23, %24 : int
	_25=_23-_24;
	//indexof %26 = %16, %25 : int[]
	_26=_16[_25];
	//indirectinvoke () = %15 (%26) : method(any)->()
	printf("%lld\n", _26);
	//invoke (%27) = () MatrixMult:init : function()->(MatrixMult:Matrix)
	_FREE_STRUCT(_27, Matrix);
	_27 = init();
	_ADD_OWNERSHIP(_27);
	//assign %2 = %27  : {int[] data,int height,int width}
	_FREE_STRUCT(B, Matrix);
	B = _27;
	_ADD_OWNERSHIP(B);
	_REMOVE_OWNERSHIP(_27);
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [77,97,116,114,105,120,32,66,91,78,45,49,93,91,78,45,49,93,32,61,32] : int[]
	_FREE(_30);
	_NEW_ARRAY(_30, 21);
	_30[0] = 77; _30[1] = 97; _30[2] = 116; _30[3] = 114; _30[4] = 105; _30[5] = 120; _30[6] = 32; _30[7] = 66; _30[8] = 91; _30[9] = 78; _30[10] = 45; _30[11] = 49; _30[12] = 93; _30[13] = 91; _30[14] = 78; _30[15] = 45; _30[16] = 49; _30[17] = 93; _30[18] = 32; _30[19] = 61; _30[20] = 32; 
	_ADD_OWNERSHIP(_30);
	//indirectinvoke () = %29 (%30) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_30));
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %33 = %2 data : {int[] data,int height,int width}
	_FREE(_33);
	_1DARRAY_COPY(_33, B->data);
	_ADD_OWNERSHIP(_33);
	//const %34 = 200 : int
	_34 = 200;
	//const %35 = 1 : int
	_35 = 1;
	//sub %36 = %34, %35 : int
	_36=_34-_35;
	//const %37 = 200 : int
	_37 = 200;
	//mul %38 = %36, %37 : int
	_38=_36*_37;
	//const %39 = 200 : int
	_39 = 200;
	//add %40 = %38, %39 : int
	_40=_38+_39;
	//const %41 = 1 : int
	_41 = 1;
	//sub %42 = %40, %41 : int
	_42=_40-_41;
	//indexof %43 = %33, %42 : int[]
	_43=_33[_42];
	//indirectinvoke () = %32 (%43) : method(any)->()
	printf("%lld\n", _43);
	//invoke (%44) = (%1, %2) MatrixMult:mat_mult : function(MatrixMult:Matrix,MatrixMult:Matrix)->(MatrixMult:Matrix)
	_FREE_STRUCT(_44, Matrix);
	_ADD_OWNERSHIP(A);
	_ADD_OWNERSHIP(B);
	_44 = mat_mult(_STRUCT_PARAM(A), false, _STRUCT_PARAM(B), false);
	_ADD_OWNERSHIP(_44);
	//assign %3 = %44  : {int[] data,int height,int width}
	_FREE_STRUCT(C, Matrix);
	C = _44;
	_ADD_OWNERSHIP(C);
	_REMOVE_OWNERSHIP(_44);
	//assert
	{
		//fieldload %45 = %3 data : {int[] data,int height,int width}
		_FREE(_45);
		_1DARRAY_COPY(_45, C->data);
		_ADD_OWNERSHIP(_45);
		//const %46 = 200 : int
		_46 = 200;
		//const %47 = 1 : int
		_47 = 1;
		//sub %48 = %46, %47 : int
		_48=_46-_47;
		//const %49 = 200 : int
		_49 = 200;
		//mul %50 = %48, %49 : int
		_50=_48*_49;
		//const %51 = 200 : int
		_51 = 200;
		//add %52 = %50, %51 : int
		_52=_50+_51;
		//const %53 = 1 : int
		_53 = 1;
		//sub %54 = %52, %53 : int
		_54=_52-_53;
		//indexof %55 = %45, %54 : int[]
		_55=_45[_54];
		//const %56 = 3996001000 : int
		_56 = 3996001000;
		//ifeq %55, %56 goto blklab11 : int
		if(_55==_56){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//fieldload %57 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %58 = %57 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %59 = [77,97,116,114,105,120,32,67,91,78,45,49,93,91,78,45,49,93,32,61,32] : int[]
	_FREE(_59);
	_NEW_ARRAY(_59, 21);
	_59[0] = 77; _59[1] = 97; _59[2] = 116; _59[3] = 114; _59[4] = 105; _59[5] = 120; _59[6] = 32; _59[7] = 67; _59[8] = 91; _59[9] = 78; _59[10] = 45; _59[11] = 49; _59[12] = 93; _59[13] = 91; _59[14] = 78; _59[15] = 45; _59[16] = 49; _59[17] = 93; _59[18] = 32; _59[19] = 61; _59[20] = 32; 
	_ADD_OWNERSHIP(_59);
	//indirectinvoke () = %58 (%59) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_59));
	//fieldload %60 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %61 = %60 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %62 = %3 data : {int[] data,int height,int width}
	_FREE(_62);
	_1DARRAY_COPY(_62, C->data);
	_ADD_OWNERSHIP(_62);
	//const %63 = 200 : int
	_63 = 200;
	//const %64 = 1 : int
	_64 = 1;
	//sub %65 = %63, %64 : int
	_65=_63-_64;
	//const %66 = 200 : int
	_66 = 200;
	//mul %67 = %65, %66 : int
	_67=_65*_66;
	//const %68 = 200 : int
	_68 = 200;
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
	//const %75 = [80,97,115,115,32] : int[]
	_FREE(_75);
	_NEW_ARRAY(_75, 5);
	_75[0] = 80; _75[1] = 97; _75[2] = 115; _75[3] = 115; _75[4] = 32; 
	_ADD_OWNERSHIP(_75);
	//indirectinvoke () = %74 (%75) : method(int[])->()
	println_s(_1DARRAY_PARAM(_75));
	//fieldload %76 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %77 = %76 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %78 = 200 : int
	_78 = 200;
	//indirectinvoke () = %77 (%78) : method(any)->()
	printf("%lld", _78);
	//fieldload %79 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %80 = %79 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %81 = [32,88,32] : int[]
	_FREE(_81);
	_NEW_ARRAY(_81, 3);
	_81[0] = 32; _81[1] = 88; _81[2] = 32; 
	_ADD_OWNERSHIP(_81);
	//indirectinvoke () = %80 (%81) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_81));
	//fieldload %82 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %83 = %82 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %84 = 200 : int
	_84 = 200;
	//indirectinvoke () = %83 (%84) : method(any)->()
	printf("%lld", _84);
	//fieldload %85 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %86 = %85 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %87 = [32,77,97,116,114,105,120,77,117,108,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_87);
	_NEW_ARRAY(_87, 21);
	_87[0] = 32; _87[1] = 77; _87[2] = 97; _87[3] = 116; _87[4] = 114; _87[5] = 105; _87[6] = 120; _87[7] = 77; _87[8] = 117; _87[9] = 108; _87[10] = 116; _87[11] = 32; _87[12] = 116; _87[13] = 101; _87[14] = 115; _87[15] = 116; _87[16] = 32; _87[17] = 99; _87[18] = 97; _87[19] = 115; _87[20] = 101; 
	_ADD_OWNERSHIP(_87);
	//indirectinvoke () = %86 (%87) : method(int[])->()
	println_s(_1DARRAY_PARAM(_87));
	//return
	_FREE_STRUCT(A, Matrix);
	_FREE_STRUCT(B, Matrix);
	_FREE_STRUCT(C, Matrix);
	_FREE(_6);
	_FREE_STRUCT(_10, Matrix);
	_FREE(_13);
	_FREE(_16);
	_FREE_STRUCT(_27, Matrix);
	_FREE(_30);
	_FREE(_33);
	_FREE_STRUCT(_44, Matrix);
	_FREE(_45);
	_FREE(_59);
	_FREE(_62);
	_FREE(_75);
	_FREE(_81);
	_FREE(_87);
	exit(0);
}

