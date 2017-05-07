#include "SobelEdge2.h"
Image* copy_Image(Image* _Image){
	Image* new_Image = malloc(sizeof(Image));
	_COPY_1DARRAY_BYTE(new_Image->pixels, _Image->pixels);
	new_Image->width = _Image->width;
	new_Image->height = _Image->height;
	return new_Image;
}
Image** copy_array_Image(Image** _Image, size_t _Image_size){
	Image** new_Image = malloc(_Image_size*sizeof(Image*));
	for(int i=0;i<_Image_size;i++){
		new_Image[i] = copy_Image(_Image[i]);
	}
	return new_Image;
}
void free_Image(Image* image){
	free(image->pixels);
	image->pixels = NULL;
	free(image);
}
void printf_Image(Image* image){
	printf("{");
	printf(" pixels:");
	_PRINT_1DARRAY_BYTE(image->pixels);
	printf(" width:");
	printf("%"PRId64, image->width);
	printf(" height:");
	printf("%"PRId64, image->height);
	printf("}");
}
Image* _image_(int64_t width, int64_t height, BYTE* pixels, size_t pixels_size){
	Image* _3;
	Image* _4;
	//newrecord %4 = (%1, %2, %0) : {int height,byte[] pixels,int width}
	_4 = malloc(sizeof(Image));
	_4->height = height;
	_UPDATE_1DARRAY(_4->pixels, pixels);
	_4->width = width;
	//return %4
	return _4;
	//return
}

int64_t _wrap_(int64_t pos, int64_t size){
	int64_t _2 = 0;
	int64_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	//iflt %0, %1 goto blklab0 : int
	if(pos<size){goto blklab0;}
	//const %3 = 1 : int
	_3 = 1;
	//sub %4 = %1, %3 : int
	_4=size-_3;
	//sub %5 = %0, %1 : int
	_5=pos-size;
	//sub %6 = %4, %5 : int
	_6=_4-_5;
	//return %6
	return _6;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %7 = 0 : int
	_7 = 0;
	//ifge %0, %7 goto blklab2 : int
	if(pos>=_7){goto blklab2;}
	//const %8 = 1 : int
	_8 = 1;
	//neg %9 = %8 : int
	_9= -_8;
	//sub %10 = %9, %0 : int
	_10=_9-pos;
	//return %10
	return _10;
	//goto blklab3
	goto blklab3;
//.blklab2
blklab2:;
	//return %0
	return pos;
//.blklab3
blklab3:;
//.blklab1
blklab1:;
	//return
}

int64_t _convolution_(Image* A, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter)){
	int64_t _4 = 0;
	_DECL_1DARRAY_BYTE(pixels);
	int64_t width = 0;
	int64_t height = 0;
	int64_t sum = 0;
	int64_t filterSize = 0;
	int64_t filterHalf = 0;
	int64_t filterY = 0;
	int64_t y = 0;
	int64_t filterX = 0;
	int64_t x = 0;
	int64_t pixel = 0;
	int64_t filterVal = 0;
	_DECL_1DARRAY_BYTE(_17);
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
	BYTE _34;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	int64_t _42 = 0;
	int64_t _43 = 0;
	//fieldload %17 = %0 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_17, A->pixels);
	//assign %5 = %17  : byte[]
	_UPDATE_1DARRAY(pixels, _17);
	//fieldload %18 = %0 width : {int height,byte[] pixels,int width}
	_18 = A->width;
	//assign %6 = %18  : int
	width = _18;
	//fieldload %19 = %0 height : {int height,byte[] pixels,int width}
	_19 = A->height;
	//assign %7 = %19  : int
	height = _19;
	//const %20 = 0 : int
	_20 = 0;
	//assign %8 = %20  : int
	sum = _20;
	//const %21 = 3 : int
	_21 = 3;
	//assign %9 = %21  : int
	filterSize = _21;
	//const %22 = 1 : int
	_22 = 1;
	//assign %10 = %22  : int
	filterHalf = _22;
	//const %23 = 0 : int
	_23 = 0;
	//assign %11 = %23  : int
	filterY = _23;
	//loop (%8, %11, %12, %13, %14, %15, %16, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43)
	while(true){
		//ifge %11, %9 goto blklab4 : int
		if(filterY>=filterSize){goto blklab4;}
		//add %25 = %2, %11 : int
		_25=yCenter+filterY;
		//sub %26 = %25, %10 : int
		_26=_25-filterHalf;
		//invoke (%24) = (%26, %7) SobelEdge2:wrap : function(int,int)->(int)
		{
			_24 = _wrap_(_26, height);
		}
		//assign %12 = %24  : int
		y = _24;
		//const %27 = 0 : int
		_27 = 0;
		//assign %13 = %27  : int
		filterX = _27;
		//loop (%8, %13, %14, %15, %16, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41)
		while(true){
			//ifge %13, %9 goto blklab6 : int
			if(filterX>=filterSize){goto blklab6;}
			//add %29 = %1, %13 : int
			_29=xCenter+filterX;
			//sub %30 = %29, %10 : int
			_30=_29-filterHalf;
			//invoke (%28) = (%30, %6) SobelEdge2:wrap : function(int,int)->(int)
			{
				_28 = _wrap_(_30, width);
			}
			//assign %14 = %28  : int
			x = _28;
			//mul %32 = %12, %6 : int
			_32=y*width;
			//add %33 = %32, %14 : int
			_33=_32+x;
			//indexof %34 = %5, %33 : byte[]
			_34=pixels[_33];
			//invoke (%31) = (%34) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
			{
				_31 = (unsigned int)_34;
			}
			//assign %15 = %31  : int
			pixel = _31;
			//mul %35 = %11, %9 : int
			_35=filterY*filterSize;
			//add %36 = %35, %13 : int
			_36=_35+filterX;
			//indexof %37 = %3, %36 : int[]
			_37=filter[_36];
			//assign %16 = %37  : int
			filterVal = _37;
			//mul %38 = %15, %16 : int
			_38=pixel*filterVal;
			//add %39 = %8, %38 : int
			_39=sum+_38;
			//assign %8 = %39  : int
			sum = _39;
			//const %40 = 1 : int
			_40 = 1;
			//add %41 = %13, %40 : int
			_41=filterX+_40;
			//assign %13 = %41  : int
			filterX = _41;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %42 = 1 : int
		_42 = 1;
		//add %43 = %11, %42 : int
		_43=filterY+_42;
		//assign %11 = %43  : int
		filterY = _43;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %8
	return sum;
	//return
}

Image* _sobelEdgeDetection_(Image* input){
	Image* _1;
	_DECL_1DARRAY_BYTE(pixels);
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_1DARRAY(h_sobel);
	int64_t x = 0;
	int64_t y = 0;
	int64_t pos = 0;
	int64_t v_g = 0;
	int64_t h_g = 0;
	int64_t t_g = 0;
	_DECL_1DARRAY_BYTE(_14);
	int64_t _15 = 0;
	int64_t _16 = 0;
	BYTE _17;
	int64_t _18 = 0;
	_DECL_1DARRAY_BYTE(_19);
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
	_DECL_1DARRAY(_32);
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
	_DECL_1DARRAY(_45);
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
	BYTE _56;
	int64_t _57 = 0;
	int64_t _58 = 0;
	int64_t _59 = 0;
	int64_t _60 = 0;
	Image* _61;
	//fieldload %14 = %0 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_14, input->pixels);
	//assign %2 = %14  : byte[]
	_UPDATE_1DARRAY(pixels, _14);
	//fieldload %15 = %0 width : {int height,byte[] pixels,int width}
	_15 = input->width;
	//assign %3 = %15  : int
	width = _15;
	//fieldload %16 = %0 height : {int height,byte[] pixels,int width}
	_16 = input->height;
	//assign %4 = %16  : int
	height = _16;
	//const %17 = 00100000b : byte
	_17 = 0b00100000;
	//mul %18 = %3, %4 : int
	_18=width*height;
	//arraygen %19 = [17; 18] : byte[]
	_NEW_1DARRAY_BYTE(_19, _18, _17);
	//assign %5 = %19  : byte[]
	_UPDATE_1DARRAY(newPixels, _19);
	//const %20 = 1 : int
	_20 = 1;
	//neg %21 = %20 : int
	_21= -_20;
	//const %22 = 0 : int
	_22 = 0;
	//const %23 = 1 : int
	_23 = 1;
	//const %24 = 2 : int
	_24 = 2;
	//neg %25 = %24 : int
	_25= -_24;
	//const %26 = 0 : int
	_26 = 0;
	//const %27 = 2 : int
	_27 = 2;
	//const %28 = 1 : int
	_28 = 1;
	//neg %29 = %28 : int
	_29= -_28;
	//const %30 = 0 : int
	_30 = 0;
	//const %31 = 1 : int
	_31 = 1;
	//newlist %32 = (%21, %22, %23, %25, %26, %27, %29, %30, %31) : int[]
	_NEW_1DARRAY_int64_t(_32, 9, 0);
	_32[0] = _21; _32[1] = _22; _32[2] = _23; _32[3] = _25; _32[4] = _26; _32[5] = _27; _32[6] = _29; _32[7] = _30; _32[8] = _31; 
	//assign %6 = %32  : int[]
	_UPDATE_1DARRAY(v_sobel, _32);
	//const %33 = 1 : int
	_33 = 1;
	//const %34 = 2 : int
	_34 = 2;
	//const %35 = 1 : int
	_35 = 1;
	//const %36 = 0 : int
	_36 = 0;
	//const %37 = 0 : int
	_37 = 0;
	//const %38 = 0 : int
	_38 = 0;
	//const %39 = 1 : int
	_39 = 1;
	//neg %40 = %39 : int
	_40= -_39;
	//const %41 = 2 : int
	_41 = 2;
	//neg %42 = %41 : int
	_42= -_41;
	//const %43 = 1 : int
	_43 = 1;
	//neg %44 = %43 : int
	_44= -_43;
	//newlist %45 = (%33, %34, %35, %36, %37, %38, %40, %42, %44) : int[]
	_NEW_1DARRAY_int64_t(_45, 9, 0);
	_45[0] = _33; _45[1] = _34; _45[2] = _35; _45[3] = _36; _45[4] = _37; _45[5] = _38; _45[6] = _40; _45[7] = _42; _45[8] = _44; 
	//assign %7 = %45  : int[]
	_UPDATE_1DARRAY(h_sobel, _45);
	//const %46 = 0 : int
	_46 = 0;
	//assign %8 = %46  : int
	x = _46;
	//loop (%5, %8, %9, %10, %11, %12, %13, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60)
	while(true){
		//ifge %8, %3 goto blklab8 : int
		if(x>=width){goto blklab8;}
		//const %47 = 0 : int
		_47 = 0;
		//assign %9 = %47  : int
		y = _47;
		//loop (%5, %9, %10, %11, %12, %13, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58)
		while(true){
			//ifge %9, %4 goto blklab10 : int
			if(y>=height){goto blklab10;}
			//mul %48 = %9, %3 : int
			_48=y*width;
			//add %49 = %48, %8 : int
			_49=_48+x;
			//assign %10 = %49  : int
			pos = _49;
			//invoke (%50) = (%0, %8, %9, %6) SobelEdge2:convolution : function(SobelEdge2:Image,int,int,int[])->(int)
			{
				_50 = _convolution_(_STRUCT_PARAM(input), x, y, _1DARRAY_PARAM(v_sobel));
			}
			//assign %11 = %50  : int
			v_g = _50;
			//invoke (%51) = (%0, %8, %9, %7) SobelEdge2:convolution : function(SobelEdge2:Image,int,int,int[])->(int)
			{
				_51 = _convolution_(_STRUCT_PARAM(input), x, y, _1DARRAY_PARAM(h_sobel));
			}
			//assign %12 = %51  : int
			h_g = _51;
			//invoke (%52) = (%11) whiley/lang/Math:abs : function(int)->(int)
			{
				_52 = llabs(v_g);
			}
			//invoke (%53) = (%12) whiley/lang/Math:abs : function(int)->(int)
			{
				_53 = llabs(h_g);
			}
			//add %54 = %52, %53 : int
			_54=_52+_53;
			//assign %13 = %54  : int
			t_g = _54;
			//const %55 = 64 : int
			_55 = 64;
			//ifgt %13, %55 goto blklab12 : int
			if(t_g>_55){goto blklab12;}
			//const %56 = 01100010b : byte
			_56 = 0b01100010;
			//update %5[%10] = %56 : byte[] -> byte[]
			newPixels[pos] = _56;
//.blklab12
blklab12:;
			//const %57 = 1 : int
			_57 = 1;
			//add %58 = %9, %57 : int
			_58=y+_57;
			//assign %9 = %58  : int
			y = _58;
//.blklab11
blklab11:;
		}
//.blklab10
blklab10:;
		//const %59 = 1 : int
		_59 = 1;
		//add %60 = %8, %59 : int
		_60=x+_59;
		//assign %8 = %60  : int
		x = _60;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//invoke (%61) = (%3, %4, %5) SobelEdge2:image : function(int,int,byte[])->(SobelEdge2:Image)
	{
		_61 = _image_(width, height, _1DARRAY_PARAM(newPixels));
	}
	//return %61
	return _61;
	//return
}

void _print_pbm_(FILE* sys, int64_t width, int64_t height, BYTE* pixels, size_t pixels_size){
	int64_t j = 0;
	int64_t i = 0;
	int64_t pos = 0;
	void* _7;
	_DECL_1DARRAY(_9);
	void* _10;
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	BYTE _21;
	BYTE _22;
	void* _23;
	int64_t _25 = 0;
	void* _26;
	int64_t _28 = 0;
	void* _29;
	_DECL_1DARRAY(_31);
	int64_t _32 = 0;
	int64_t _33 = 0;
	void* _34;
	void* _36;
	size_t _36_size = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = [80,49] : int[]
	_NEW_1DARRAY_int64_t(_9, 2, 0);
	_9[0] = 80; _9[1] = 49; 
	//indirectinvoke () = %8 (%9) : method(int[])->()
	{
		println_s(_9, _9_size);
	}
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %11 (%1) : method(any)->()
	{
		printf("%"PRId64, width);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [32] : int[]
	_NEW_1DARRAY_int64_t(_14, 1, 0);
	_14[0] = 32; 
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_14));
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", height);
	}
	//const %17 = 0 : int
	_17 = 0;
	//assign %4 = %17  : int
	j = _17;
	//loop (%4, %5, %6, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
	while(true){
		//ifge %4, %2 goto blklab13 : int
		if(j>=height){goto blklab13;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %5 = %18  : int
		i = _18;
		//loop (%5, %6, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
		while(true){
			//ifge %5, %1 goto blklab15 : int
			if(i>=width){goto blklab15;}
			//mul %19 = %4, %1 : int
			_19=j*width;
			//add %20 = %19, %5 : int
			_20=_19+i;
			//assign %6 = %20  : int
			pos = _20;
			//indexof %21 = %3, %6 : byte[]
			_21=pixels[pos];
			//const %22 = 00100000b : byte
			_22 = 0b00100000;
			//ifne %21, %22 goto blklab17 : byte
			if(_21!=_22){goto blklab17;}
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = 0 : int
			_25 = 0;
			//indirectinvoke () = %24 (%25) : method(any)->()
			{
				printf("%"PRId64, _25);
			}
			//goto blklab18
			goto blklab18;
//.blklab17
blklab17:;
			//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %28 = 1 : int
			_28 = 1;
			//indirectinvoke () = %27 (%28) : method(any)->()
			{
				printf("%"PRId64, _28);
			}
//.blklab18
blklab18:;
			//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %31 = [32] : int[]
			_NEW_1DARRAY_int64_t(_31, 1, 0);
			_31[0] = 32; 
			//indirectinvoke () = %30 (%31) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_31));
			}
			//const %32 = 1 : int
			_32 = 1;
			//add %33 = %5, %32 : int
			_33=i+_32;
			//assign %5 = %33  : int
			i = _33;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
		//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %35 = %34 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %36 = [] : void[]
		_NEW_1DARRAY_int64_t(_36, 0, 0);
		//indirectinvoke () = %35 (%36) : method(int[])->()
		{
			println_s(_36, _36_size);
		}
		//const %37 = 1 : int
		_37 = 1;
		//add %38 = %4, %37 : int
		_38=j+_37;
		//assign %4 = %38  : int
		j = _38;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//return
	return;
}

int main(int argc, char** args){
	FILE* r;
	int64_t width = 0;
	int64_t height = 0;
	int64_t size = 0;
	_DECL_1DARRAY_BYTE(pixels);
	Image* input;
	Image* output;
	void* _8;
	_DECL_1DARRAY(_9);
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	_DECL_1DARRAY_BYTE(_13);
	Image* _15;
	Image* _16;
	int64_t _17 = 0;
	int64_t _18 = 0;
	_DECL_1DARRAY_BYTE(_19);
	//const %9 = [105,109,97,103,101,51,50,120,51,50,46,112,98,109] : int[]
	_NEW_1DARRAY_int64_t(_9, 14, 0);
	_9[0] = 105; _9[1] = 109; _9[2] = 97; _9[3] = 103; _9[4] = 101; _9[5] = 51; _9[6] = 50; _9[7] = 120; _9[8] = 51; _9[9] = 50; _9[10] = 46; _9[11] = 112; _9[12] = 98; _9[13] = 109; 
	//invoke (%8) = (%9) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_8 = Reader(_9, _9_size);
	}
	//assign %1 = %8  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	r = _8;
	//const %10 = 32 : int
	_10 = 32;
	//assign %2 = %10  : int
	width = _10;
	//const %11 = 32 : int
	_11 = 32;
	//assign %3 = %11  : int
	height = _11;
	//mul %12 = %2, %3 : int
	_12=width*height;
	//assign %4 = %12  : int
	size = _12;
	//fieldload %14 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%13) = %14 () : method()->(byte[])
	{
		_13 = readAll(r, &_13_size);
	}
	//assign %5 = %13  : byte[]
	_UPDATE_1DARRAY(pixels, _13);
	//invoke (%15) = (%2, %3, %5) SobelEdge2:image : function(int,int,byte[])->(SobelEdge2:Image)
	{
		_15 = _image_(width, height, _1DARRAY_PARAM(pixels));
	}
	//assign %6 = %15  : {int height,byte[] pixels,int width}
	input = _15;
	//invoke (%16) = (%6) SobelEdge2:sobelEdgeDetection : function(SobelEdge2:Image)->(SobelEdge2:Image)
	{
		_16 = _sobelEdgeDetection_(_STRUCT_PARAM(input));
	}
	//assign %7 = %16  : {int height,byte[] pixels,int width}
	output = _16;
	//fieldload %17 = %7 width : {int height,byte[] pixels,int width}
	_17 = output->width;
	//fieldload %18 = %7 height : {int height,byte[] pixels,int width}
	_18 = output->height;
	//fieldload %19 = %7 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_19, output->pixels);
	//invoke () = (%0, %17, %18, %19) SobelEdge2:print_pbm : method(whiley/lang/System:Console,int,int,byte[])->()
	{
		_print_pbm_(stdout, _17, _18, _1DARRAY_PARAM(_19));
	}
	//return
	exit(0);
}

