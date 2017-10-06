#include "MatrixMult2.h"
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
Matrix* _matrix_(int64_t width, int64_t height, _DECL_1DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data)){
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

Matrix* _init_(int64_t width, int64_t height){
	Matrix* r;
	_DECL_DEALLOC(r);
	_DECL_1DARRAY(data);
	_DECL_DEALLOC(data);
	int64_t i;
	int64_t j;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
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
	//invoke (%21) = (%0, %1, %3) MatrixMult2:matrix : function(MatrixMult2:nat,MatrixMult2:nat,int[])->(MatrixMult2:Matrix)
	{
		void* tmp_data_2;
		_COPY_1DARRAY_PARAM(data, tmp_data_2, int64_t);
		_DEALLOC_STRUCT(_21, Matrix);
		_21 = _matrix_(width, height, tmp_data_2, data_size, true);
		_CALLEE_DEALLOC(data, "false-false-false" , "matrix");
		_21_dealloc = true;
	}
	//return %21
	_DEALLOC_STRUCT(r, Matrix);
	_DEALLOC(data);
	_DEALLOC(_8);
	return _21;
	//return
}

void _print_mat_(FILE* sys, Matrix* a, _DECL_DEALLOC_PARAM(a)){
	int64_t i;
	int64_t width;
	int64_t height;
	int64_t j;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13;
	int64_t _14;
	int64_t _15;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
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

Matrix* _mat_mult_(Matrix* a, _DECL_DEALLOC_PARAM(a), Matrix* b, _DECL_DEALLOC_PARAM(b)){
	Matrix* c;
	_DECL_DEALLOC(c);
	int64_t width;
	int64_t height;
	_DECL_1DARRAY(data);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY(a_data);
	_DECL_DEALLOC(a_data);
	_DECL_1DARRAY(b_data);
	_DECL_DEALLOC(b_data);
	int64_t i;
	int64_t j;
	int64_t k;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	int64_t _39;
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
	//invoke (%40) = (%3, %4, %5) MatrixMult2:matrix : function(MatrixMult2:nat,MatrixMult2:nat,int[])->(MatrixMult2:Matrix)
	{
		void* tmp_data_2;
		_COPY_1DARRAY_PARAM(data, tmp_data_2, int64_t);
		_DEALLOC_STRUCT(_40, Matrix);
		_40 = _matrix_(width, height, tmp_data_2, data_size, true);
		_CALLEE_DEALLOC(data, "false-false-false" , "matrix");
		_40_dealloc = true;
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
	Matrix* A;
	_DECL_DEALLOC(A);
	Matrix* B;
	_DECL_DEALLOC(B);
	Matrix* C;
	_DECL_DEALLOC(C);
	void* _4;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	void* _7;
	int64_t _9;
	Matrix* _10;
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	Matrix* _27;
	_DECL_DEALLOC(_27);
	int64_t _28;
	int64_t _29;
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	int64_t _31;
	int64_t _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	int64_t _39;
	int64_t _40;
	int64_t _41;
	int64_t _42;
	int64_t _43;
	Matrix* _44;
	_DECL_DEALLOC(_44);
	_DECL_1DARRAY(_45);
	_DECL_DEALLOC(_45);
	int64_t _46;
	int64_t _47;
	int64_t _48;
	int64_t _49;
	int64_t _50;
	int64_t _51;
	int64_t _52;
	int64_t _53;
	int64_t _54;
	int64_t _55;
	int64_t _56;
	void* _57;
	_DECL_1DARRAY(_59);
	_DECL_DEALLOC(_59);
	void* _60;
	_DECL_1DARRAY(_62);
	_DECL_DEALLOC(_62);
	int64_t _63;
	int64_t _64;
	int64_t _65;
	int64_t _66;
	int64_t _67;
	int64_t _68;
	int64_t _69;
	int64_t _70;
	int64_t _71;
	int64_t _72;
	void* _73;
	_DECL_1DARRAY(_75);
	_DECL_DEALLOC(_75);
	//fieldload %4 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %5 = %4 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %6 = [78,32,61,32] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 4, 0);
	_6[0] = 78; _6[1] = 32; _6[2] = 61; _6[3] = 32; 
	_ADD_DEALLOC(_6);
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
		printf("%"PRId64"\n", _9);
	}
	//const %11 = 20 : int
	_11 = 20;
	//const %12 = 20 : int
	_12 = 20;
	//invoke (%10) = (%11, %12) MatrixMult2:init : function(MatrixMult2:nat,MatrixMult2:nat)->(MatrixMult2:Matrix)
	{
		_DEALLOC_STRUCT(_10, Matrix);
		_10 = _init_(_11, _12);
		_10_dealloc = true;
	}
	//assign %1 = %10  : {int[] data,int height,int width}
	_DEALLOC_STRUCT(A, Matrix);
	A = copy_Matrix(_10);
	_ADD_DEALLOC(A);
	//assert
	{
		//fieldload %13 = %1 data : {int[] data,int height,int width}
		_DEALLOC(_13);
		_UPDATE_1DARRAY(_13, A->data);
		_REMOVE_DEALLOC(_13);
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
		//ifeq %23, %26 goto blklab19 : int
		if(_23==_26){goto blklab19;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab19
blklab19:;
	//assert
	}
	//const %28 = 20 : int
	_28 = 20;
	//const %29 = 20 : int
	_29 = 20;
	//invoke (%27) = (%28, %29) MatrixMult2:init : function(MatrixMult2:nat,MatrixMult2:nat)->(MatrixMult2:Matrix)
	{
		_DEALLOC_STRUCT(_27, Matrix);
		_27 = _init_(_28, _29);
		_27_dealloc = true;
	}
	//assign %2 = %27  : {int[] data,int height,int width}
	_DEALLOC_STRUCT(B, Matrix);
	B = copy_Matrix(_27);
	_ADD_DEALLOC(B);
	//assert
	{
		//fieldload %30 = %2 data : {int[] data,int height,int width}
		_DEALLOC(_30);
		_UPDATE_1DARRAY(_30, B->data);
		_REMOVE_DEALLOC(_30);
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
		//ifeq %40, %43 goto blklab20 : int
		if(_40==_43){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//invoke (%44) = (%1, %2) MatrixMult2:mat_mult : function(MatrixMult2:Matrix,MatrixMult2:Matrix)->(MatrixMult2:Matrix)
	{
		void* tmp_A_0;
		tmp_A_0 = copy_Matrix(A);
		void* tmp_B_1;
		tmp_B_1 = copy_Matrix(B);
		_DEALLOC_STRUCT(_44, Matrix);
		_44 = _mat_mult_(tmp_A_0, true, tmp_B_1, true);
		_CALLEE_DEALLOC(A, "false-false-false" , "mat_mult");
		_44_dealloc = true;
		_CALLEE_DEALLOC(B, "false-false-false" , "mat_mult");
		_44_dealloc = true;
	}
	//assign %3 = %44  : {int[] data,int height,int width}
	_DEALLOC_STRUCT(C, Matrix);
	C = copy_Matrix(_44);
	_ADD_DEALLOC(C);
	//assert
	{
		//fieldload %45 = %3 data : {int[] data,int height,int width}
		_DEALLOC(_45);
		_UPDATE_1DARRAY(_45, C->data);
		_REMOVE_DEALLOC(_45);
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
	{
		void* tmp_C_1;
		tmp_C_1 = copy_Matrix(C);
		_print_mat_(stdout, tmp_C_1, true);
		_CALLEE_DEALLOC(C, "false-false-true" , "print_mat");
	}
	//fieldload %57 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %58 = %57 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %59 = [77,97,116,114,105,120,32,67,91,78,45,49,93,91,78,45,49,93,32,61,32] : int[]
	_DEALLOC(_59);
	_NEW_1DARRAY_int64_t(_59, 21, 0);
	_59[0] = 77; _59[1] = 97; _59[2] = 116; _59[3] = 114; _59[4] = 105; _59[5] = 120; _59[6] = 32; _59[7] = 67; _59[8] = 91; _59[9] = 78; _59[10] = 45; _59[11] = 49; _59[12] = 93; _59[13] = 91; _59[14] = 78; _59[15] = 45; _59[16] = 49; _59[17] = 93; _59[18] = 32; _59[19] = 61; _59[20] = 32; 
	_ADD_DEALLOC(_59);
	//indirectinvoke () = %58 (%59) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_59));
	}
	//fieldload %60 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %61 = %60 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %62 = %3 data : {int[] data,int height,int width}
	_DEALLOC(_62);
	_UPDATE_1DARRAY(_62, C->data);
	_REMOVE_DEALLOC(_62);
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
		printf("%"PRId64"\n", _72);
	}
	//fieldload %73 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %74 = %73 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %75 = [80,97,115,115,32,77,97,116,114,105,120,77,117,108,116,50,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_75);
	_NEW_1DARRAY_int64_t(_75, 26, 0);
	_75[0] = 80; _75[1] = 97; _75[2] = 115; _75[3] = 115; _75[4] = 32; _75[5] = 77; _75[6] = 97; _75[7] = 116; _75[8] = 114; _75[9] = 105; _75[10] = 120; _75[11] = 77; _75[12] = 117; _75[13] = 108; _75[14] = 116; _75[15] = 50; _75[16] = 32; _75[17] = 116; _75[18] = 101; _75[19] = 115; _75[20] = 116; _75[21] = 32; _75[22] = 99; _75[23] = 97; _75[24] = 115; _75[25] = 101; 
	_ADD_DEALLOC(_75);
	//indirectinvoke () = %74 (%75) : method(int[])->()
	{
		println_s(_75, _75_size);
	}
	//return
	_DEALLOC_STRUCT(A, Matrix);
	_DEALLOC_STRUCT(B, Matrix);
	_DEALLOC_STRUCT(C, Matrix);
	_DEALLOC(_6);
	_DEALLOC_STRUCT(_10, Matrix);
	_DEALLOC(_13);
	_DEALLOC_STRUCT(_27, Matrix);
	_DEALLOC(_30);
	_DEALLOC_STRUCT(_44, Matrix);
	_DEALLOC(_45);
	_DEALLOC(_59);
	_DEALLOC(_62);
	_DEALLOC(_75);
	exit(0);
}

