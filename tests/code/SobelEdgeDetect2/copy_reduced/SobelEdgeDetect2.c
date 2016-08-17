#include "SobelEdgeDetect2.h"
Matrix* copy_Matrix(Matrix* _Matrix){
	Matrix* new_Matrix = malloc(sizeof(Matrix));
	_COPY_1DARRAY(new_Matrix->pixels, _Matrix->pixels);
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
	free(matrix->pixels);
	matrix->pixels = NULL;
	free(matrix);
}
void printf_Matrix(Matrix* matrix){
	printf("{");
	printf(" pixels:");
	_PRINT_1DARRAY(matrix->pixels);
	printf(" width:");
	printf("%lld", matrix->width);
	printf(" height:");
	printf("%lld", matrix->height);
	printf("}");
}
Matrix* matrix(long long width, long long height, _DECL_1DARRAY_PARAM(pixels)){
	Matrix* _3;
	Matrix* _4;
	//newrecord %4 = (%1, %2, %0) : {int height,int[] pixels,int width}
	_4 = malloc(sizeof(Matrix));
	_4->height = height;
	_UPDATE_1DARRAY(_4->pixels, pixels);
	_4->width = width;
	//return %4
	return _4;
	//return
}

long long wrap(long long pos, long long size){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//ifge %0, %3 goto blklab0 : int
	if(pos>=_3){goto blklab0;}
	//add %4 = %1, %0 : int
	_4=size+pos;
	//assign %0 = %4  : int
	pos = _4;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//iflt %0, %1 goto blklab2 : int
	if(pos<size){goto blklab2;}
	//sub %5 = %0, %1 : int
	_5=pos-size;
	//assign %0 = %5  : int
	pos = _5;
//.blklab2
blklab2:;
//.blklab1
blklab1:;
	//return %0
	return pos;
	//return
}

long long convolution(Matrix* a, long long xCenter, long long yCenter, _DECL_1DARRAY_PARAM(filter)){
	long long _4 = 0;
	long long sum = 0;
	long long filterSize = 0;
	long long filterHalf = 0;
	long long filterY = 0;
	_DECL_1DARRAY(pixels);
	long long width = 0;
	long long height = 0;
	long long y = 0;
	long long filterX = 0;
	long long x = 0;
	long long pixel = 0;
	long long filterVal = 0;
	long long _17 = 0;
	long long _18 = 0;
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
	//const %17 = 0 : int
	_17 = 0;
	//assign %5 = %17  : int
	sum = _17;
	//const %18 = 3 : int
	_18 = 3;
	//assign %6 = %18  : int
	filterSize = _18;
	//const %19 = 1 : int
	_19 = 1;
	//assign %7 = %19  : int
	filterHalf = _19;
	//const %20 = 0 : int
	_20 = 0;
	//assign %8 = %20  : int
	filterY = _20;
	//fieldload %21 = %0 pixels : {int height,int[] pixels,int width}
	_UPDATE_1DARRAY(_21, a->pixels);
	//assign %9 = %21  : int[]
	_UPDATE_1DARRAY(pixels, _21);
	//fieldload %22 = %0 width : {int height,int[] pixels,int width}
	_22 = a->width;
	//assign %10 = %22  : int
	width = _22;
	//fieldload %23 = %0 height : {int height,int[] pixels,int width}
	_23 = a->height;
	//assign %11 = %23  : int
	height = _23;
	//loop (%5, %8, %12, %13, %14, %15, %16, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42)
	while(true){
		//ifge %8, %6 goto blklab3 : int
		if(filterY>=filterSize){goto blklab3;}
		//add %25 = %2, %8 : int
		_25=yCenter+filterY;
		//sub %26 = %25, %7 : int
		_26=_25-filterHalf;
		//invoke (%24) = (%26, %11) SobelEdgeDetect2:wrap : function(int,int)->(int)
		_24 = wrap(_26, height);
		//assign %12 = %24  : int
		y = _24;
		//const %27 = 0 : int
		_27 = 0;
		//assign %13 = %27  : int
		filterX = _27;
		//loop (%5, %13, %14, %15, %16, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40)
		while(true){
			//ifge %13, %6 goto blklab5 : int
			if(filterX>=filterSize){goto blklab5;}
			//add %29 = %1, %13 : int
			_29=xCenter+filterX;
			//sub %30 = %29, %7 : int
			_30=_29-filterHalf;
			//invoke (%28) = (%30, %10) SobelEdgeDetect2:wrap : function(int,int)->(int)
			_28 = wrap(_30, width);
			//assign %14 = %28  : int
			x = _28;
			//mul %31 = %12, %10 : int
			_31=y*width;
			//add %32 = %31, %14 : int
			_32=_31+x;
			//indexof %33 = %9, %32 : int[]
			_33=pixels[_32];
			//assign %15 = %33  : int
			pixel = _33;
			//mul %34 = %8, %6 : int
			_34=filterY*filterSize;
			//add %35 = %34, %13 : int
			_35=_34+filterX;
			//indexof %36 = %3, %35 : int[]
			_36=filter[_35];
			//assign %16 = %36  : int
			filterVal = _36;
			//mul %37 = %15, %16 : int
			_37=pixel*filterVal;
			//add %38 = %5, %37 : int
			_38=sum+_37;
			//assign %5 = %38  : int
			sum = _38;
			//const %39 = 1 : int
			_39 = 1;
			//add %40 = %13, %39 : int
			_40=filterX+_39;
			//assign %13 = %40  : int
			filterX = _40;
//.blklab6
blklab6:;
		}
//.blklab5
blklab5:;
		//const %41 = 1 : int
		_41 = 1;
		//add %42 = %8, %41 : int
		_42=filterY+_41;
		//assign %8 = %42  : int
		filterY = _42;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//return %5
	return sum;
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
	//fieldload %7 = %1 width : {int height,int[] pixels,int width}
	_7 = a->width;
	//assign %3 = %7  : int
	width = _7;
	//fieldload %8 = %1 height : {int height,int[] pixels,int width}
	_8 = a->height;
	//assign %4 = %8  : int
	height = _8;
	//loop (%2, %5, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
	while(true){
		//ifge %2, %4 goto blklab7 : int
		if(i>=height){goto blklab7;}
		//const %9 = 0 : int
		_9 = 0;
		//assign %5 = %9  : int
		j = _9;
		//loop (%5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20)
		while(true){
			//ifge %5, %3 goto blklab9 : int
			if(j>=width){goto blklab9;}
			//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %11 = %10 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//fieldload %12 = %1 pixels : {int height,int[] pixels,int width}
			_UPDATE_1DARRAY(_12, a->pixels);
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
			_NEW_1DARRAY(_18, 1, 0);
			_18[0] = 32; 
			//indirectinvoke () = %17 (%18) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_18));
			//const %19 = 1 : int
			_19 = 1;
			//add %20 = %5, %19 : int
			_20=j+_19;
			//assign %5 = %20  : int
			j = _20;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %2, %21 : int
		_22=i+_21;
		//assign %2 = %22  : int
		i = _22;
		//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %24 = %23 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %25 = [] : void[]
		_NEW_1DARRAY(_25, 0, 0);
		//indirectinvoke () = %24 (%25) : method(int[])->()
		println_s(_25, _25_size);
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return
	return;
}

int main(int argc, char** args){
	long long width = 0;
	long long height = 0;
	long long size = 0;
	_DECL_1DARRAY(pixels);
	Matrix* image;
	_DECL_1DARRAY(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_1DARRAY(h_sobel);
	long long x = 0;
	long long y = 0;
	long long pos = 0;
	long long v_g = 0;
	long long h_g = 0;
	long long t_g = 0;
	Matrix* newImage;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	_DECL_1DARRAY(_20);
	long long _21 = 0;
	long long _22 = 0;
	Matrix* _23;
	long long _24 = 0;
	_DECL_1DARRAY(_25);
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
	_DECL_1DARRAY(_38);
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
	_DECL_1DARRAY(_51);
	long long _52 = 0;
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	long long _59 = 0;
	long long _60 = 0;
	long long _61 = 0;
	long long _62 = 0;
	long long _63 = 0;
	long long _64 = 0;
	long long _65 = 0;
	long long _66 = 0;
	long long _67 = 0;
	Matrix* _68;
	void* _69;
	_DECL_1DARRAY(_71);
	void* _72;
	_DECL_1DARRAY(_74);
	//const %16 = 8 : int
	_16 = 8;
	//assign %1 = %16  : int
	width = _16;
	//const %17 = 8 : int
	_17 = 8;
	//assign %2 = %17  : int
	height = _17;
	//mul %18 = %1, %2 : int
	_18=width*height;
	//assign %3 = %18  : int
	size = _18;
	//const %19 = 255 : int
	_19 = 255;
	//arraygen %20 = [19; 3] : int[]
	_NEW_1DARRAY(_20, size, _19);
	//assign %4 = %20  : int[]
	_UPDATE_1DARRAY(pixels, _20);
	//const %21 = 0 : int
	_21 = 0;
	//const %22 = 0 : int
	_22 = 0;
	//update %4[%22] = %21 : int[] -> int[]
	pixels[_22] = _21;
	//invoke (%23) = (%1, %2, %4) SobelEdgeDetect2:matrix : function(int,int,int[])->(SobelEdgeDetect2:Matrix)
	_23 = matrix(width, height, _1DARRAY_PARAM(pixels));
	//assign %5 = %23  : {int height,int[] pixels,int width}
	image = _23;
	//const %24 = 255 : int
	_24 = 255;
	//arraygen %25 = [24; 3] : int[]
	_NEW_1DARRAY(_25, size, _24);
	//assign %6 = %25  : int[]
	_UPDATE_1DARRAY(newPixels, _25);
	//const %26 = 1 : int
	_26 = 1;
	//neg %27 = %26 : int
	_27= -_26;
	//const %28 = 0 : int
	_28 = 0;
	//const %29 = 1 : int
	_29 = 1;
	//const %30 = 2 : int
	_30 = 2;
	//neg %31 = %30 : int
	_31= -_30;
	//const %32 = 0 : int
	_32 = 0;
	//const %33 = 2 : int
	_33 = 2;
	//const %34 = 1 : int
	_34 = 1;
	//neg %35 = %34 : int
	_35= -_34;
	//const %36 = 0 : int
	_36 = 0;
	//const %37 = 1 : int
	_37 = 1;
	//newlist %38 = (%27, %28, %29, %31, %32, %33, %35, %36, %37) : int[]
	_NEW_1DARRAY(_38, 9, 0);
	_38[0] = _27; _38[1] = _28; _38[2] = _29; _38[3] = _31; _38[4] = _32; _38[5] = _33; _38[6] = _35; _38[7] = _36; _38[8] = _37; 
	//assign %7 = %38  : int[]
	_UPDATE_1DARRAY(v_sobel, _38);
	//const %39 = 1 : int
	_39 = 1;
	//const %40 = 2 : int
	_40 = 2;
	//const %41 = 1 : int
	_41 = 1;
	//const %42 = 0 : int
	_42 = 0;
	//const %43 = 0 : int
	_43 = 0;
	//const %44 = 0 : int
	_44 = 0;
	//const %45 = 1 : int
	_45 = 1;
	//neg %46 = %45 : int
	_46= -_45;
	//const %47 = 2 : int
	_47 = 2;
	//neg %48 = %47 : int
	_48= -_47;
	//const %49 = 1 : int
	_49 = 1;
	//neg %50 = %49 : int
	_50= -_49;
	//newlist %51 = (%39, %40, %41, %42, %43, %44, %46, %48, %50) : int[]
	_NEW_1DARRAY(_51, 9, 0);
	_51[0] = _39; _51[1] = _40; _51[2] = _41; _51[3] = _42; _51[4] = _43; _51[5] = _44; _51[6] = _46; _51[7] = _48; _51[8] = _50; 
	//assign %8 = %51  : int[]
	_UPDATE_1DARRAY(h_sobel, _51);
	//const %52 = 0 : int
	_52 = 0;
	//assign %9 = %52  : int
	x = _52;
	//loop (%6, %9, %10, %11, %12, %13, %14, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67)
	while(true){
		//ifge %9, %1 goto blklab11 : int
		if(x>=width){goto blklab11;}
		//const %53 = 0 : int
		_53 = 0;
		//assign %10 = %53  : int
		y = _53;
		//loop (%6, %10, %11, %12, %13, %14, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65)
		while(true){
			//ifge %10, %2 goto blklab13 : int
			if(y>=height){goto blklab13;}
			//mul %54 = %9, %1 : int
			_54=x*width;
			//add %55 = %54, %10 : int
			_55=_54+y;
			//assign %11 = %55  : int
			pos = _55;
			//invoke (%56) = (%5, %9, %10, %7) SobelEdgeDetect2:convolution : function(SobelEdgeDetect2:Matrix,int,int,int[])->(int)
			_56 = convolution(_STRUCT_PARAM(image), x, y, _1DARRAY_PARAM(v_sobel));
			//assign %12 = %56  : int
			v_g = _56;
			//invoke (%57) = (%5, %9, %10, %8) SobelEdgeDetect2:convolution : function(SobelEdgeDetect2:Matrix,int,int,int[])->(int)
			_57 = convolution(_STRUCT_PARAM(image), x, y, _1DARRAY_PARAM(h_sobel));
			//assign %13 = %57  : int
			h_g = _57;
			//invoke (%58) = (%12) whiley/lang/Math:abs : function(int)->(int)
			_58 = llabs(v_g);
			//invoke (%59) = (%13) whiley/lang/Math:abs : function(int)->(int)
			_59 = llabs(h_g);
			//add %60 = %58, %59 : int
			_60=_58+_59;
			//assign %14 = %60  : int
			t_g = _60;
			//const %61 = 128 : int
			_61 = 128;
			//ifle %14, %61 goto blklab15 : int
			if(t_g<=_61){goto blklab15;}
			//const %62 = 255 : int
			_62 = 255;
			//update %6[%11] = %62 : int[] -> int[]
			newPixels[pos] = _62;
			//goto blklab16
			goto blklab16;
//.blklab15
blklab15:;
			//const %63 = 0 : int
			_63 = 0;
			//update %6[%11] = %63 : int[] -> int[]
			newPixels[pos] = _63;
//.blklab16
blklab16:;
			//const %64 = 1 : int
			_64 = 1;
			//add %65 = %10, %64 : int
			_65=y+_64;
			//assign %10 = %65  : int
			y = _65;
//.blklab14
blklab14:;
		}
//.blklab13
blklab13:;
		//const %66 = 1 : int
		_66 = 1;
		//add %67 = %9, %66 : int
		_67=x+_66;
		//assign %9 = %67  : int
		x = _67;
//.blklab12
blklab12:;
	}
//.blklab11
blklab11:;
	//invoke (%68) = (%1, %2, %6) SobelEdgeDetect2:matrix : function(int,int,int[])->(SobelEdgeDetect2:Matrix)
	_68 = matrix(width, height, _1DARRAY_PARAM(newPixels));
	//assign %15 = %68  : {int height,int[] pixels,int width}
	newImage = _68;
	//fieldload %69 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %70 = %69 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %71 = [73,110,112,117,116,32,73,109,97,103,101,58] : int[]
	_NEW_1DARRAY(_71, 12, 0);
	_71[0] = 73; _71[1] = 110; _71[2] = 112; _71[3] = 117; _71[4] = 116; _71[5] = 32; _71[6] = 73; _71[7] = 109; _71[8] = 97; _71[9] = 103; _71[10] = 101; _71[11] = 58; 
	//indirectinvoke () = %70 (%71) : method(int[])->()
	println_s(_71, _71_size);
	//invoke () = (%0, %5) SobelEdgeDetect2:print_mat : method(whiley/lang/System:Console,SobelEdgeDetect2:Matrix)->()
print_mat(stdout, _STRUCT_PARAM(image));
	//fieldload %72 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %73 = %72 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %74 = [79,117,116,112,117,116,32,73,109,97,103,101,58] : int[]
	_NEW_1DARRAY(_74, 13, 0);
	_74[0] = 79; _74[1] = 117; _74[2] = 116; _74[3] = 112; _74[4] = 117; _74[5] = 116; _74[6] = 32; _74[7] = 73; _74[8] = 109; _74[9] = 97; _74[10] = 103; _74[11] = 101; _74[12] = 58; 
	//indirectinvoke () = %73 (%74) : method(int[])->()
	println_s(_74, _74_size);
	//invoke () = (%0, %15) SobelEdgeDetect2:print_mat : method(whiley/lang/System:Console,SobelEdgeDetect2:Matrix)->()
print_mat(stdout, _STRUCT_PARAM(newImage));
	//return
	exit(0);
}

