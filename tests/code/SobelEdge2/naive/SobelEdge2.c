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
Image* image(int64_t width, int64_t height, BYTE* pixels, size_t pixels_size){
	Image* _3;
	Image* _4;
	//newrecord %4 = (%1, %2, %0) : {int height,byte[] pixels,int width}
	_4 = malloc(sizeof(Image));
	_4->height = height;
	_COPY_1DARRAY_BYTE(_4->pixels, pixels);
	_4->width = width;
	//return %4
	return _4;
	//return
}

int64_t convolution(Image* A, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter)){
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
	int64_t _34 = 0;
	int64_t _35 = 0;
	BYTE _36;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	int64_t _42 = 0;
	int64_t _43 = 0;
	int64_t _44 = 0;
	int64_t _45 = 0;
	//fieldload %17 = %0 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_17, A->pixels);
	//assign %5 = %17  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _17);
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
	//loop (%8, %11, %12, %13, %14, %15, %16, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45)
	while(true){
		//ifge %11, %9 goto blklab0 : int
		if(filterY>=filterSize){goto blklab0;}
		//add %25 = %2, %11 : int
		_25=yCenter+filterY;
		//sub %26 = %25, %10 : int
		_26=_25-filterHalf;
		//rem %27 = %26, %7 : int
		_27=_26%height;
		//invoke (%24) = (%27) whiley/lang/Math:abs : function(int)->(int)
		{
			_24 = llabs(_27);
		}
		//assign %12 = %24  : int
		y = _24;
		//const %28 = 0 : int
		_28 = 0;
		//assign %13 = %28  : int
		filterX = _28;
		//loop (%8, %13, %14, %15, %16, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43)
		while(true){
			//ifge %13, %9 goto blklab2 : int
			if(filterX>=filterSize){goto blklab2;}
			//add %30 = %1, %13 : int
			_30=xCenter+filterX;
			//sub %31 = %30, %10 : int
			_31=_30-filterHalf;
			//rem %32 = %31, %6 : int
			_32=_31%width;
			//invoke (%29) = (%32) whiley/lang/Math:abs : function(int)->(int)
			{
				_29 = llabs(_32);
			}
			//assign %14 = %29  : int
			x = _29;
			//mul %34 = %12, %6 : int
			_34=y*width;
			//add %35 = %34, %14 : int
			_35=_34+x;
			//indexof %36 = %5, %35 : byte[]
			_36=pixels[_35];
			//invoke (%33) = (%36) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
			{
				_33 = (unsigned int)_36;
			}
			//assign %15 = %33  : int
			pixel = _33;
			//mul %37 = %11, %9 : int
			_37=filterY*filterSize;
			//add %38 = %37, %13 : int
			_38=_37+filterX;
			//indexof %39 = %3, %38 : int[]
			_39=filter[_38];
			//assign %16 = %39  : int
			filterVal = _39;
			//mul %40 = %15, %16 : int
			_40=pixel*filterVal;
			//add %41 = %8, %40 : int
			_41=sum+_40;
			//assign %8 = %41  : int
			sum = _41;
			//const %42 = 1 : int
			_42 = 1;
			//add %43 = %13, %42 : int
			_43=filterX+_42;
			//assign %13 = %43  : int
			filterX = _43;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %44 = 1 : int
		_44 = 1;
		//add %45 = %11, %44 : int
		_45=filterY+_44;
		//assign %11 = %45  : int
		filterY = _45;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %8
	return sum;
	//return
}

Image* sobelEdgeDetection(Image* input){
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
	BYTE _57;
	int64_t _58 = 0;
	int64_t _59 = 0;
	int64_t _60 = 0;
	int64_t _61 = 0;
	Image* _62;
	//fieldload %14 = %0 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_14, input->pixels);
	//assign %2 = %14  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _14);
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
	_COPY_1DARRAY_BYTE(newPixels, _19);
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
	_COPY_1DARRAY_int64_t(v_sobel, _32);
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
	_COPY_1DARRAY_int64_t(h_sobel, _45);
	//const %46 = 0 : int
	_46 = 0;
	//assign %8 = %46  : int
	x = _46;
	//loop (%5, %8, %9, %10, %11, %12, %13, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61)
	while(true){
		//ifge %8, %3 goto blklab4 : int
		if(x>=width){goto blklab4;}
		//const %47 = 0 : int
		_47 = 0;
		//assign %9 = %47  : int
		y = _47;
		//loop (%5, %9, %10, %11, %12, %13, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59)
		while(true){
			//ifge %9, %4 goto blklab6 : int
			if(y>=height){goto blklab6;}
			//mul %48 = %9, %3 : int
			_48=y*width;
			//add %49 = %48, %8 : int
			_49=_48+x;
			//assign %10 = %49  : int
			pos = _49;
			//invoke (%50) = (%0, %8, %9, %6) SobelEdge2:convolution : function(SobelEdge2:Image,int,int,int[])->(int)
			{
				void* input_tmp;
				void* v_sobel_tmp;
				_50 = convolution(_COPY_STRUCT_PARAM(input, Image), x, y, _COPY_1DARRAY_PARAM_int64_t(v_sobel));
			}
			//assign %11 = %50  : int
			v_g = _50;
			//invoke (%51) = (%0, %8, %9, %7) SobelEdge2:convolution : function(SobelEdge2:Image,int,int,int[])->(int)
			{
				void* input_tmp;
				void* h_sobel_tmp;
				_51 = convolution(_COPY_STRUCT_PARAM(input, Image), x, y, _COPY_1DARRAY_PARAM_int64_t(h_sobel));
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
			//const %55 = 128 : int
			_55 = 128;
			//ifle %13, %55 goto blklab8 : int
			if(t_g<=_55){goto blklab8;}
			//const %56 = 00100000b : byte
			_56 = 0b00100000;
			//update %5[%10] = %56 : byte[] -> byte[]
			newPixels[pos] = _56;
			//goto blklab9
			goto blklab9;
//.blklab8
blklab8:;
			//const %57 = 01100010b : byte
			_57 = 0b01100010;
			//update %5[%10] = %57 : byte[] -> byte[]
			newPixels[pos] = _57;
//.blklab9
blklab9:;
			//const %58 = 1 : int
			_58 = 1;
			//add %59 = %9, %58 : int
			_59=y+_58;
			//assign %9 = %59  : int
			y = _59;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %60 = 1 : int
		_60 = 1;
		//add %61 = %8, %60 : int
		_61=x+_60;
		//assign %8 = %61  : int
		x = _61;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//invoke (%62) = (%3, %4, %5) SobelEdge2:image : function(int,int,byte[])->(SobelEdge2:Image)
	{
		void* newPixels_tmp;
		_62 = image(width, height, _COPY_1DARRAY_PARAM_BYTE(newPixels));
	}
	//return %62
	return _62;
	//return
}

void print_image(FILE* sys, Image* im){
	_DECL_1DARRAY_BYTE(pixels);
	int64_t width = 0;
	int64_t height = 0;
	int64_t y = 0;
	int64_t x = 0;
	int64_t pos = 0;
	_DECL_1DARRAY_BYTE(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	BYTE _15;
	BYTE _16;
	void* _17;
	_DECL_1DARRAY(_19);
	void* _20;
	_DECL_1DARRAY(_22);
	void* _23;
	_DECL_1DARRAY(_25);
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	void* _30;
	void* _32;
	size_t _32_size = 0;
	//fieldload %8 = %1 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_8, im->pixels);
	//assign %2 = %8  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _8);
	//fieldload %9 = %1 width : {int height,byte[] pixels,int width}
	_9 = im->width;
	//assign %3 = %9  : int
	width = _9;
	//fieldload %10 = %1 height : {int height,byte[] pixels,int width}
	_10 = im->height;
	//assign %4 = %10  : int
	height = _10;
	//const %11 = 0 : int
	_11 = 0;
	//assign %5 = %11  : int
	y = _11;
	//loop (%5, %6, %7, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
	while(true){
		//ifge %5, %4 goto blklab10 : int
		if(y>=height){goto blklab10;}
		//const %12 = 0 : int
		_12 = 0;
		//assign %6 = %12  : int
		x = _12;
		//loop (%6, %7, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27)
		while(true){
			//ifge %6, %3 goto blklab12 : int
			if(x>=width){goto blklab12;}
			//mul %13 = %5, %3 : int
			_13=y*width;
			//add %14 = %13, %6 : int
			_14=_13+x;
			//assign %7 = %14  : int
			pos = _14;
			//indexof %15 = %2, %7 : byte[]
			_15=pixels[pos];
			//const %16 = 00100000b : byte
			_16 = 0b00100000;
			//ifne %15, %16 goto blklab14 : byte
			if(_15!=_16){goto blklab14;}
			//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %18 = %17 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %19 = [32] : int[]
			_NEW_1DARRAY_int64_t(_19, 1, 0);
			_19[0] = 32; 
			//indirectinvoke () = %18 (%19) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_19));
			}
			//goto blklab15
			goto blklab15;
//.blklab14
blklab14:;
			//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %21 = %20 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %22 = [98] : int[]
			_NEW_1DARRAY_int64_t(_22, 1, 0);
			_22[0] = 98; 
			//indirectinvoke () = %21 (%22) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_22));
			}
//.blklab15
blklab15:;
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = [32] : int[]
			_NEW_1DARRAY_int64_t(_25, 1, 0);
			_25[0] = 32; 
			//indirectinvoke () = %24 (%25) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_25));
			}
			//const %26 = 1 : int
			_26 = 1;
			//add %27 = %6, %26 : int
			_27=x+_26;
			//assign %6 = %27  : int
			x = _27;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %28 = 1 : int
		_28 = 1;
		//add %29 = %5, %28 : int
		_29=y+_28;
		//assign %5 = %29  : int
		y = _29;
		//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %32 = [] : void[]
		_NEW_1DARRAY_int64_t(_32, 0, 0);
		//indirectinvoke () = %31 (%32) : method(int[])->()
		{
			println_s(_32, _32_size);
		}
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//return
	return;
}

int main(int argc, char** args){
	int64_t width = 0;
	int64_t height = 0;
	int64_t size = 0;
	_DECL_1DARRAY_BYTE(pixels);
	Image* input;
	Image* output;
	FILE* w;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	BYTE _11;
	_DECL_1DARRAY_BYTE(_12);
	BYTE _13;
	int64_t _14 = 0;
	BYTE _15;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	Image* _20;
	Image* _21;
	void* _22;
	_DECL_1DARRAY(_24);
	void* _25;
	_DECL_1DARRAY(_27);
	void* _28;
	_DECL_1DARRAY(_29);
	int64_t _30 = 0;
	_DECL_1DARRAY_BYTE(_32);
	//const %8 = 8 : int
	_8 = 8;
	//assign %1 = %8  : int
	width = _8;
	//const %9 = 8 : int
	_9 = 8;
	//assign %2 = %9  : int
	height = _9;
	//mul %10 = %1, %2 : int
	_10=width*height;
	//assign %3 = %10  : int
	size = _10;
	//const %11 = 00100000b : byte
	_11 = 0b00100000;
	//arraygen %12 = [11; 3] : byte[]
	_NEW_1DARRAY_BYTE(_12, size, _11);
	//assign %4 = %12  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _12);
	//const %13 = 01100010b : byte
	_13 = 0b01100010;
	//const %14 = 0 : int
	_14 = 0;
	//update %4[%14] = %13 : byte[] -> byte[]
	pixels[_14] = _13;
	//const %15 = 01100010b : byte
	_15 = 0b01100010;
	//const %16 = 4 : int
	_16 = 4;
	//mul %17 = %16, %1 : int
	_17=_16*width;
	//const %18 = 3 : int
	_18 = 3;
	//add %19 = %17, %18 : int
	_19=_17+_18;
	//update %4[%19] = %15 : byte[] -> byte[]
	pixels[_19] = _15;
	//invoke (%20) = (%1, %2, %4) SobelEdge2:image : function(int,int,byte[])->(SobelEdge2:Image)
	{
		void* pixels_tmp;
		_20 = image(width, height, _COPY_1DARRAY_PARAM_BYTE(pixels));
	}
	//assign %5 = %20  : {int height,byte[] pixels,int width}
	input = copy_Image(_20);
	//invoke (%21) = (%5) SobelEdge2:sobelEdgeDetection : function(SobelEdge2:Image)->(SobelEdge2:Image)
	{
		void* input_tmp;
		_21 = sobelEdgeDetection(_COPY_STRUCT_PARAM(input, Image));
	}
	//assign %6 = %21  : {int height,byte[] pixels,int width}
	output = copy_Image(_21);
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = [73,110,112,117,116,32,73,109,97,103,101,58] : int[]
	_NEW_1DARRAY_int64_t(_24, 12, 0);
	_24[0] = 73; _24[1] = 110; _24[2] = 112; _24[3] = 117; _24[4] = 116; _24[5] = 32; _24[6] = 73; _24[7] = 109; _24[8] = 97; _24[9] = 103; _24[10] = 101; _24[11] = 58; 
	//indirectinvoke () = %23 (%24) : method(int[])->()
	{
		println_s(_24, _24_size);
	}
	//invoke () = (%0, %5) SobelEdge2:print_image : method(whiley/lang/System:Console,SobelEdge2:Image)->()
	{
		void* input_tmp;
		print_image(stdout, _COPY_STRUCT_PARAM(input, Image));
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [83,111,98,101,108,32,69,100,103,101,32,68,101,116,101,99,116,105,111,110,58] : int[]
	_NEW_1DARRAY_int64_t(_27, 21, 0);
	_27[0] = 83; _27[1] = 111; _27[2] = 98; _27[3] = 101; _27[4] = 108; _27[5] = 32; _27[6] = 69; _27[7] = 100; _27[8] = 103; _27[9] = 101; _27[10] = 32; _27[11] = 68; _27[12] = 101; _27[13] = 116; _27[14] = 101; _27[15] = 99; _27[16] = 116; _27[17] = 105; _27[18] = 111; _27[19] = 110; _27[20] = 58; 
	//indirectinvoke () = %26 (%27) : method(int[])->()
	{
		println_s(_27, _27_size);
	}
	//invoke () = (%0, %6) SobelEdge2:print_image : method(whiley/lang/System:Console,SobelEdge2:Image)->()
	{
		void* output_tmp;
		print_image(stdout, _COPY_STRUCT_PARAM(output, Image));
	}
	//const %29 = [111,117,116,112,117,116,46,116,120,116] : int[]
	_NEW_1DARRAY_int64_t(_29, 10, 0);
	_29[0] = 111; _29[1] = 117; _29[2] = 116; _29[3] = 112; _29[4] = 117; _29[5] = 116; _29[6] = 46; _29[7] = 116; _29[8] = 120; _29[9] = 116; 
	//invoke (%28) = (%29) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_28 = Writer(_29, _29_size);
	}
	//assign %7 = %28  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	w = _28;
	//fieldload %31 = %7 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//fieldload %32 = %6 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_32, output->pixels);
	//indirectinvoke (%30) = %31 (%32) : method(byte[])->(int)
	{
		writeAll(w, _32, _32_size);
	}
	//fieldload %33 = %7 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %33 () : method()->()
	{
		fclose(w);
		w = NULL;
	}
	//return
	exit(0);
}

