#include "SobelEdge3.h"
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
Image* image(int64_t width, int64_t height, BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels)){
	Image* _3;
	_DECL_DEALLOC(_3);
	Image* _4;
	_DECL_DEALLOC(_4);
	//newrecord %4 = (%1, %2, %0) : {int height,byte[] pixels,int width}
	_DEALLOC_STRUCT(_4, Image);
	_4 = malloc(sizeof(Image));
	_4->height = height;
	_COPY_1DARRAY_BYTE(_4->pixels, pixels);
	_4->width = width;
	_ADD_DEALLOC(_4);
	//return %4
	_DEALLOC(pixels);
	_DEALLOC_STRUCT(_3, Image);
	return _4;
	//return
}

int64_t convolution(Image* A, _DECL_DEALLOC_PARAM(A), int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter)){
	int64_t _4 = 0;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
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
	_DECL_DEALLOC(_17);
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
	_DEALLOC(_17);
	_UPDATE_1DARRAY(_17, A->pixels);
	_REMOVE_DEALLOC(_17);
	//assign %5 = %17  : byte[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_BYTE(pixels, _17);
	_ADD_DEALLOC(pixels);
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
	_DEALLOC_STRUCT(A, Image);
	_DEALLOC(filter);
	_DEALLOC(pixels);
	_DEALLOC(_17);
	return sum;
	//return
}

Image* sobelEdgeDetection(Image* input, _DECL_DEALLOC_PARAM(input)){
	Image* _1;
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_DEALLOC(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_DEALLOC(v_sobel);
	_DECL_1DARRAY(h_sobel);
	_DECL_DEALLOC(h_sobel);
	int64_t x = 0;
	int64_t y = 0;
	int64_t pos = 0;
	int64_t v_g = 0;
	int64_t h_g = 0;
	int64_t t_g = 0;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	int64_t _15 = 0;
	int64_t _16 = 0;
	BYTE _17;
	int64_t _18 = 0;
	_DECL_1DARRAY_BYTE(_19);
	_DECL_DEALLOC(_19);
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
	_DECL_DEALLOC(_32);
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
	_DECL_DEALLOC(_45);
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
	_DECL_DEALLOC(_62);
	//fieldload %14 = %0 pixels : {int height,byte[] pixels,int width}
	_DEALLOC(_14);
	_UPDATE_1DARRAY(_14, input->pixels);
	_REMOVE_DEALLOC(_14);
	//assign %2 = %14  : byte[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_BYTE(pixels, _14);
	_ADD_DEALLOC(pixels);
	//fieldload %15 = %0 width : {int height,byte[] pixels,int width}
	_15 = input->width;
	//assign %3 = %15  : int
	width = _15;
	//fieldload %16 = %0 height : {int height,byte[] pixels,int width}
	_16 = input->height;
	//assign %4 = %16  : int
	height = _16;
	//const %17 = 11111111b : byte
	_17 = 0b11111111;
	//lengthof %18 = %2 : byte[]
	_18 = pixels_size;
	//arraygen %19 = [17; 18] : byte[]
	_DEALLOC(_19);
	_NEW_1DARRAY_BYTE(_19, _18, _17);
	_ADD_DEALLOC(_19);
	//assign %5 = %19  : byte[]
	_DEALLOC(newPixels);
	_COPY_1DARRAY_BYTE(newPixels, _19);
	_ADD_DEALLOC(newPixels);
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
	_DEALLOC(_32);
	_NEW_1DARRAY_int64_t(_32, 9, 0);
	_32[0] = _21; _32[1] = _22; _32[2] = _23; _32[3] = _25; _32[4] = _26; _32[5] = _27; _32[6] = _29; _32[7] = _30; _32[8] = _31; 
	_ADD_DEALLOC(_32);
	//assign %6 = %32  : int[]
	_DEALLOC(v_sobel);
	_COPY_1DARRAY_int64_t(v_sobel, _32);
	_ADD_DEALLOC(v_sobel);
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
	_DEALLOC(_45);
	_NEW_1DARRAY_int64_t(_45, 9, 0);
	_45[0] = _33; _45[1] = _34; _45[2] = _35; _45[3] = _36; _45[4] = _37; _45[5] = _38; _45[6] = _40; _45[7] = _42; _45[8] = _44; 
	_ADD_DEALLOC(_45);
	//assign %7 = %45  : int[]
	_DEALLOC(h_sobel);
	_COPY_1DARRAY_int64_t(h_sobel, _45);
	_ADD_DEALLOC(h_sobel);
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
			//invoke (%50) = (%0, %8, %9, %6) SobelEdge3:convolution : function(SobelEdge3:Image,int,int,int[])->(int)
			{
				void* input_tmp;
				void* v_sobel_tmp;
				_50 = convolution(_COPY_STRUCT_PARAM(input, Image), true, x, y, _COPY_1DARRAY_PARAM_int64_t(v_sobel), true);
				_CALLEE_DEALLOC(input, "false-false-true" , "convolution");
				_CALLEE_DEALLOC(v_sobel, "false-false-true" , "convolution");
			}
			//assign %11 = %50  : int
			v_g = _50;
			//invoke (%51) = (%0, %8, %9, %7) SobelEdge3:convolution : function(SobelEdge3:Image,int,int,int[])->(int)
			{
				void* input_tmp;
				void* h_sobel_tmp;
				_51 = convolution(_COPY_STRUCT_PARAM(input, Image), true, x, y, _COPY_1DARRAY_PARAM_int64_t(h_sobel), true);
				_CALLEE_DEALLOC(input, "false-false-true" , "convolution");
				_CALLEE_DEALLOC(h_sobel, "false-false-true" , "convolution");
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
			//const %56 = 11111111b : byte
			_56 = 0b11111111;
			//update %5[%10] = %56 : byte[] -> byte[]
			newPixels[pos] = _56;
			//goto blklab9
			goto blklab9;
//.blklab8
blklab8:;
			//const %57 = 00000000b : byte
			_57 = 0b00000000;
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
	//invoke (%62) = (%3, %4, %5) SobelEdge3:image : function(int,int,byte[])->(SobelEdge3:Image)
	{
		void* newPixels_tmp;
		_DEALLOC_STRUCT(_62, Image);
		_62 = image(width, height, _COPY_1DARRAY_PARAM_BYTE(newPixels), true);
		_CALLEE_DEALLOC(newPixels, "false-false-false" , "image");
		_ADD_DEALLOC(_62);
	}
	//return %62
	_DEALLOC_STRUCT(input, Image);
	_DEALLOC_STRUCT(_1, Image);
	_DEALLOC(pixels);
	_DEALLOC(newPixels);
	_DEALLOC(v_sobel);
	_DEALLOC(h_sobel);
	_DEALLOC(_14);
	_DEALLOC(_19);
	_DEALLOC(_32);
	_DEALLOC(_45);
	return _62;
	//return
}

void print_image(FILE* sys, Image* im, _DECL_DEALLOC_PARAM(im)){
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	int64_t width = 0;
	int64_t height = 0;
	int64_t y = 0;
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t x = 0;
	int64_t pos = 0;
	FILE* w;
	_DECL_1DARRAY_BYTE(_10);
	_DECL_DEALLOC(_10);
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	BYTE _14;
	int64_t _15 = 0;
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	BYTE _20;
	BYTE _21;
	BYTE _22;
	int64_t _23 = 0;
	void* _24;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	BYTE _27;
	int64_t _28 = 0;
	void* _29;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	void* _32;
	_DECL_1DARRAY(_34);
	_DECL_DEALLOC(_34);
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	void* _39;
	void* _41;
	size_t _41_size = 0;
	_DECL_DEALLOC(_41);
	void* _42;
	_DECL_DEALLOC(_42);
	_DECL_1DARRAY(_43);
	_DECL_DEALLOC(_43);
	int64_t _44 = 0;
	//fieldload %10 = %1 pixels : {int height,byte[] pixels,int width}
	_DEALLOC(_10);
	_UPDATE_1DARRAY(_10, im->pixels);
	_REMOVE_DEALLOC(_10);
	//assign %2 = %10  : byte[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_BYTE(pixels, _10);
	_ADD_DEALLOC(pixels);
	//fieldload %11 = %1 width : {int height,byte[] pixels,int width}
	_11 = im->width;
	//assign %3 = %11  : int
	width = _11;
	//fieldload %12 = %1 height : {int height,byte[] pixels,int width}
	_12 = im->height;
	//assign %4 = %12  : int
	height = _12;
	//const %13 = 0 : int
	_13 = 0;
	//assign %5 = %13  : int
	y = _13;
	//const %14 = 11111111b : byte
	_14 = 0b11111111;
	//lengthof %15 = %2 : byte[]
	_15 = pixels_size;
	//arraygen %16 = [14; 15] : byte[]
	_DEALLOC(_16);
	_NEW_1DARRAY_BYTE(_16, _15, _14);
	_ADD_DEALLOC(_16);
	//assign %6 = %16  : byte[]
	_DEALLOC(output);
	_COPY_1DARRAY_BYTE(output, _16);
	_ADD_DEALLOC(output);
	//loop (%5, %6, %7, %8, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41)
	while(true){
		//ifge %5, %4 goto blklab10 : int
		if(y>=height){goto blklab10;}
		//const %17 = 0 : int
		_17 = 0;
		//assign %7 = %17  : int
		x = _17;
		//loop (%6, %7, %8, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36)
		while(true){
			//ifge %7, %3 goto blklab12 : int
			if(x>=width){goto blklab12;}
			//mul %18 = %5, %3 : int
			_18=y*width;
			//add %19 = %18, %7 : int
			_19=_18+x;
			//assign %8 = %19  : int
			pos = _19;
			//indexof %20 = %2, %8 : byte[]
			_20=pixels[pos];
			//const %21 = 11111111b : byte
			_21 = 0b11111111;
			//ifne %20, %21 goto blklab14 : byte
			if(_20!=_21){goto blklab14;}
			//const %23 = 32 : int
			_23 = 32;
			//invoke (%22) = (%23) whiley/lang/ASCII:toByte : function(whiley/lang/ASCII:char)->(byte)
			{
				_22 = (BYTE)_23;
			}
			//update %6[%8] = %22 : byte[] -> byte[]
			output[pos] = _22;
			//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %25 = %24 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %26 = [32] : int[]
			_DEALLOC(_26);
			_NEW_1DARRAY_int64_t(_26, 1, 0);
			_26[0] = 32; 
			_ADD_DEALLOC(_26);
			//indirectinvoke () = %25 (%26) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_26));
			}
			//goto blklab15
			goto blklab15;
//.blklab14
blklab14:;
			//const %28 = 98 : int
			_28 = 98;
			//invoke (%27) = (%28) whiley/lang/ASCII:toByte : function(whiley/lang/ASCII:char)->(byte)
			{
				_27 = (BYTE)_28;
			}
			//update %6[%8] = %27 : byte[] -> byte[]
			output[pos] = _27;
			//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %31 = [98] : int[]
			_DEALLOC(_31);
			_NEW_1DARRAY_int64_t(_31, 1, 0);
			_31[0] = 98; 
			_ADD_DEALLOC(_31);
			//indirectinvoke () = %30 (%31) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_31));
			}
//.blklab15
blklab15:;
			//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %33 = %32 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %34 = [32] : int[]
			_DEALLOC(_34);
			_NEW_1DARRAY_int64_t(_34, 1, 0);
			_34[0] = 32; 
			_ADD_DEALLOC(_34);
			//indirectinvoke () = %33 (%34) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_34));
			}
			//const %35 = 1 : int
			_35 = 1;
			//add %36 = %7, %35 : int
			_36=x+_35;
			//assign %7 = %36  : int
			x = _36;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %37 = 1 : int
		_37 = 1;
		//add %38 = %5, %37 : int
		_38=y+_37;
		//assign %5 = %38  : int
		y = _38;
		//fieldload %39 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %40 = %39 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %41 = [] : void[]
		_DEALLOC(_41);
		_NEW_1DARRAY_int64_t(_41, 0, 0);
		_ADD_DEALLOC(_41);
		//indirectinvoke () = %40 (%41) : method(int[])->()
		{
			println_s(_41, _41_size);
		}
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//const %43 = [111,117,116,112,117,116,46,105,110] : int[]
	_DEALLOC(_43);
	_NEW_1DARRAY_int64_t(_43, 9, 0);
	_43[0] = 111; _43[1] = 117; _43[2] = 116; _43[3] = 112; _43[4] = 117; _43[5] = 116; _43[6] = 46; _43[7] = 105; _43[8] = 110; 
	_ADD_DEALLOC(_43);
	//invoke (%42) = (%43) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_42 = Writer(_43, _43_size);
	}
	//assign %9 = %42  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	w = _42;
	//fieldload %45 = %9 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%44) = %45 (%6) : method(byte[])->(int)
	{
		fwrite(output, 1, output_size, w);
	}
	//fieldload %46 = %9 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %46 () : method()->()
	{
		fclose(w);
		w = NULL;
	}
	//return
	_DEALLOC_STRUCT(im, Image);
	_DEALLOC(pixels);
	_DEALLOC(output);
	if(w != NULL){fclose(w); w = NULL;}
	_DEALLOC(_10);
	_DEALLOC(_16);
	_DEALLOC(_26);
	_DEALLOC(_31);
	_DEALLOC(_34);
	_DEALLOC(_41);
	_DEALLOC(_43);
	return;
}

int main(int argc, char** args){
	int64_t width = 0;
	int64_t height = 0;
	int64_t size = 0;
	FILE* file;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	Image* input;
	_DECL_DEALLOC(input);
	Image* output;
	_DECL_DEALLOC(output);
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	void* _11;
	_DECL_DEALLOC(_11);
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	Image* _15;
	_DECL_DEALLOC(_15);
	Image* _16;
	_DECL_DEALLOC(_16);
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	//const %8 = 16 : int
	_8 = 16;
	//assign %1 = %8  : int
	width = _8;
	//const %9 = 16 : int
	_9 = 16;
	//assign %2 = %9  : int
	height = _9;
	//mul %10 = %1, %2 : int
	_10=width*height;
	//assign %3 = %10  : int
	size = _10;
	//const %12 = [105,109,97,103,101,46,105,110] : int[]
	_DEALLOC(_12);
	_NEW_1DARRAY_int64_t(_12, 8, 0);
	_12[0] = 105; _12[1] = 109; _12[2] = 97; _12[3] = 103; _12[4] = 101; _12[5] = 46; _12[6] = 105; _12[7] = 110; 
	_ADD_DEALLOC(_12);
	//invoke (%11) = (%12) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_11 = Reader(_12, _12_size);
	}
	//assign %4 = %11  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _11;
	//fieldload %14 = %4 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%13) = %14 () : method()->(byte[])
	{
		_13 = readAll(file, &_13_size);
		_ADD_DEALLOC(_13);
	}
	//assign %5 = %13  : byte[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_BYTE(pixels, _13);
	_ADD_DEALLOC(pixels);
	//invoke (%15) = (%1, %2, %5) SobelEdge3:image : function(int,int,byte[])->(SobelEdge3:Image)
	{
		void* pixels_tmp;
		_DEALLOC_STRUCT(_15, Image);
		_15 = image(width, height, _COPY_1DARRAY_PARAM_BYTE(pixels), true);
		_CALLEE_DEALLOC(pixels, "false-false-false" , "image");
		_ADD_DEALLOC(_15);
	}
	//assign %6 = %15  : {int height,byte[] pixels,int width}
	_DEALLOC_STRUCT(input, Image);
	input = copy_Image(_15);
	_ADD_DEALLOC(input);
	//invoke (%16) = (%6) SobelEdge3:sobelEdgeDetection : function(SobelEdge3:Image)->(SobelEdge3:Image)
	{
		void* input_tmp;
		_DEALLOC_STRUCT(_16, Image);
		_16 = sobelEdgeDetection(_COPY_STRUCT_PARAM(input, Image), true);
		_CALLEE_DEALLOC(input, "false-false-false" , "sobelEdgeDetection");
		_ADD_DEALLOC(_16);
	}
	//assign %7 = %16  : {int height,byte[] pixels,int width}
	_DEALLOC_STRUCT(output, Image);
	output = copy_Image(_16);
	_ADD_DEALLOC(output);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [79,117,116,112,117,116,32,73,109,97,103,101,58] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY_int64_t(_19, 13, 0);
	_19[0] = 79; _19[1] = 117; _19[2] = 116; _19[3] = 112; _19[4] = 117; _19[5] = 116; _19[6] = 32; _19[7] = 73; _19[8] = 109; _19[9] = 97; _19[10] = 103; _19[11] = 101; _19[12] = 58; 
	_ADD_DEALLOC(_19);
	//indirectinvoke () = %18 (%19) : method(int[])->()
	{
		println_s(_19, _19_size);
	}
	//invoke () = (%0, %7) SobelEdge3:print_image : method(whiley/lang/System:Console,SobelEdge3:Image)->()
	{
		void* output_tmp;
		print_image(stdout, _COPY_STRUCT_PARAM(output, Image), true);
		_CALLEE_DEALLOC(output, "false-false-false" , "print_image");
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(pixels);
	_DEALLOC_STRUCT(input, Image);
	_DEALLOC_STRUCT(output, Image);
	_DEALLOC(_12);
	_DEALLOC(_13);
	_DEALLOC_STRUCT(_15, Image);
	_DEALLOC_STRUCT(_16, Image);
	_DEALLOC(_19);
	exit(0);
}

