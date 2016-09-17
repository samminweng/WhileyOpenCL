#include "SobelEdgeDetect2.h"
Image* copy_Image(Image* _Image){
	Image* new_Image = malloc(sizeof(Image));
	_COPY_1DARRAY_LONGLONG(new_Image->pixels, _Image->pixels);
	new_Image->width = _Image->width;
	new_Image->height = _Image->height;
	return new_Image;
}
Image** copy_array_Image(Image** _Image, long long _Image_size){
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
	_PRINT_1DARRAY_LONGLONG(image->pixels);
	printf(" width:");
	printf("%lld", image->width);
	printf(" height:");
	printf("%lld", image->height);
	printf("}");
}
Image* image(long long width, long long height, _DECL_1DARRAY_PARAM(pixels), _DECL_DEALLOC_PARAM(pixels)){
	Image* _3;
	_DECL_DEALLOC(_3);
	Image* _4;
	_DECL_DEALLOC(_4);
	//newrecord %4 = (%1, %2, %0) : {int height,int[] pixels,int width}
	_DEALLOC_STRUCT(_4, Image);
	_4 = malloc(sizeof(Image));
	_4->height = height;
	_COPY_1DARRAY_LONGLONG(_4->pixels, pixels);
	_4->width = width;
	_ADD_DEALLOC(_4);
	//return %4
	_DEALLOC(pixels);
	_DEALLOC_STRUCT(_3, Image);
	return _4;
	//return
}

long long convolution(Image* A, _DECL_DEALLOC_PARAM(A), long long xCenter, long long yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter)){
	long long _4 = 0;
	_DECL_1DARRAY(pixels);
	_DECL_DEALLOC(pixels);
	long long width = 0;
	long long height = 0;
	long long sum = 0;
	long long filterSize = 0;
	long long filterHalf = 0;
	long long filterY = 0;
	long long y = 0;
	long long filterX = 0;
	long long x = 0;
	long long pixel = 0;
	long long filterVal = 0;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
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
	//fieldload %17 = %0 pixels : {int height,int[] pixels,int width}
	_DEALLOC(_17);
	_UPDATE_1DARRAY(_17, A->pixels);
	_REMOVE_DEALLOC(_17);
	//assign %5 = %17  : int[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_LONGLONG(pixels, _17);
	_ADD_DEALLOC(pixels);
	//fieldload %18 = %0 width : {int height,int[] pixels,int width}
	_18 = A->width;
	//assign %6 = %18  : int
	width = _18;
	//fieldload %19 = %0 height : {int height,int[] pixels,int width}
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
	//loop (%8, %11, %12, %13, %14, %15, %16, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44)
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
		//loop (%8, %13, %14, %15, %16, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42)
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
			//mul %33 = %12, %6 : int
			_33=y*width;
			//add %34 = %33, %14 : int
			_34=_33+x;
			//indexof %35 = %5, %34 : int[]
			_35=pixels[_34];
			//assign %15 = %35  : int
			pixel = _35;
			//mul %36 = %11, %9 : int
			_36=filterY*filterSize;
			//add %37 = %36, %13 : int
			_37=_36+filterX;
			//indexof %38 = %3, %37 : int[]
			_38=filter[_37];
			//assign %16 = %38  : int
			filterVal = _38;
			//mul %39 = %15, %16 : int
			_39=pixel*filterVal;
			//add %40 = %8, %39 : int
			_40=sum+_39;
			//assign %8 = %40  : int
			sum = _40;
			//const %41 = 1 : int
			_41 = 1;
			//add %42 = %13, %41 : int
			_42=filterX+_41;
			//assign %13 = %42  : int
			filterX = _42;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %43 = 1 : int
		_43 = 1;
		//add %44 = %11, %43 : int
		_44=filterY+_43;
		//assign %11 = %44  : int
		filterY = _44;
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
	_DECL_1DARRAY(pixels);
	_DECL_DEALLOC(pixels);
	long long width = 0;
	long long height = 0;
	_DECL_1DARRAY(newPixels);
	_DECL_DEALLOC(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_DEALLOC(v_sobel);
	_DECL_1DARRAY(h_sobel);
	_DECL_DEALLOC(h_sobel);
	long long x = 0;
	long long y = 0;
	long long pos = 0;
	long long v_g = 0;
	long long h_g = 0;
	long long t_g = 0;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
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
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
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
	_DECL_DEALLOC(_45);
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
	long long _58 = 0;
	long long _59 = 0;
	long long _60 = 0;
	long long _61 = 0;
	Image* _62;
	_DECL_DEALLOC(_62);
	//fieldload %14 = %0 pixels : {int height,int[] pixels,int width}
	_DEALLOC(_14);
	_UPDATE_1DARRAY(_14, input->pixels);
	_REMOVE_DEALLOC(_14);
	//assign %2 = %14  : int[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_LONGLONG(pixels, _14);
	_ADD_DEALLOC(pixels);
	//fieldload %15 = %0 width : {int height,int[] pixels,int width}
	_15 = input->width;
	//assign %3 = %15  : int
	width = _15;
	//fieldload %16 = %0 height : {int height,int[] pixels,int width}
	_16 = input->height;
	//assign %4 = %16  : int
	height = _16;
	//const %17 = 255 : int
	_17 = 255;
	//mul %18 = %3, %4 : int
	_18=width*height;
	//arraygen %19 = [17; 18] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY_LONGLONG(_19, _18, _17);
	_ADD_DEALLOC(_19);
	//assign %5 = %19  : int[]
	_DEALLOC(newPixels);
	_COPY_1DARRAY_LONGLONG(newPixels, _19);
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
	_NEW_1DARRAY_LONGLONG(_32, 9, 0);
	_32[0] = _21; _32[1] = _22; _32[2] = _23; _32[3] = _25; _32[4] = _26; _32[5] = _27; _32[6] = _29; _32[7] = _30; _32[8] = _31; 
	_ADD_DEALLOC(_32);
	//assign %6 = %32  : int[]
	_DEALLOC(v_sobel);
	_COPY_1DARRAY_LONGLONG(v_sobel, _32);
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
	_NEW_1DARRAY_LONGLONG(_45, 9, 0);
	_45[0] = _33; _45[1] = _34; _45[2] = _35; _45[3] = _36; _45[4] = _37; _45[5] = _38; _45[6] = _40; _45[7] = _42; _45[8] = _44; 
	_ADD_DEALLOC(_45);
	//assign %7 = %45  : int[]
	_DEALLOC(h_sobel);
	_COPY_1DARRAY_LONGLONG(h_sobel, _45);
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
			//invoke (%50) = (%0, %8, %9, %6) SobelEdgeDetect2:convolution : function(SobelEdgeDetect2:Image,int,int,int[])->(int)
			{
				void* input_tmp;
				void* v_sobel_tmp;
				_50 = convolution(_COPY_STRUCT_PARAM(input, Image), true, x, y, _COPY_1DARRAY_PARAM_LONGLONG(v_sobel), true);
				_CALLEE_DEALLOC(input, "false-false-true" , "convolution");
				_CALLEE_DEALLOC(v_sobel, "false-false-true" , "convolution");
			}
			//assign %11 = %50  : int
			v_g = _50;
			//invoke (%51) = (%0, %8, %9, %7) SobelEdgeDetect2:convolution : function(SobelEdgeDetect2:Image,int,int,int[])->(int)
			{
				void* input_tmp;
				void* h_sobel_tmp;
				_51 = convolution(_COPY_STRUCT_PARAM(input, Image), true, x, y, _COPY_1DARRAY_PARAM_LONGLONG(h_sobel), true);
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
			//const %56 = 255 : int
			_56 = 255;
			//update %5[%10] = %56 : int[] -> int[]
			newPixels[pos] = _56;
			//goto blklab9
			goto blklab9;
//.blklab8
blklab8:;
			//const %57 = 0 : int
			_57 = 0;
			//update %5[%10] = %57 : int[] -> int[]
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
	//invoke (%62) = (%3, %4, %5) SobelEdgeDetect2:image : function(int,int,int[])->(SobelEdgeDetect2:Image)
	{
		void* newPixels_tmp;
		_DEALLOC_STRUCT(_62, Image);
		_62 = image(width, height, _COPY_1DARRAY_PARAM_LONGLONG(newPixels), true);
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
	_DECL_1DARRAY(pixels);
	_DECL_DEALLOC(pixels);
	long long width = 0;
	long long height = 0;
	long long y = 0;
	long long x = 0;
	long long pos = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	void* _23;
	_DECL_1DARRAY(_25);
	_DECL_DEALLOC(_25);
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	void* _30;
	void* _32;
	long long _32_size = 0;
	_DECL_DEALLOC(_32);
	//fieldload %8 = %1 pixels : {int height,int[] pixels,int width}
	_DEALLOC(_8);
	_UPDATE_1DARRAY(_8, im->pixels);
	_REMOVE_DEALLOC(_8);
	//assign %2 = %8  : int[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_LONGLONG(pixels, _8);
	_ADD_DEALLOC(pixels);
	//fieldload %9 = %1 width : {int height,int[] pixels,int width}
	_9 = im->width;
	//assign %3 = %9  : int
	width = _9;
	//fieldload %10 = %1 height : {int height,int[] pixels,int width}
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
			//indexof %15 = %2, %7 : int[]
			_15=pixels[pos];
			//const %16 = 255 : int
			_16 = 255;
			//ifne %15, %16 goto blklab14 : int
			if(_15!=_16){goto blklab14;}
			//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %18 = %17 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %19 = [119] : int[]
			_DEALLOC(_19);
			_NEW_1DARRAY_LONGLONG(_19, 1, 0);
			_19[0] = 119; 
			_ADD_DEALLOC(_19);
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
			_DEALLOC(_22);
			_NEW_1DARRAY_LONGLONG(_22, 1, 0);
			_22[0] = 98; 
			_ADD_DEALLOC(_22);
			//indirectinvoke () = %21 (%22) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_22));
			}
//.blklab15
blklab15:;
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = [32] : int[]
			_DEALLOC(_25);
			_NEW_1DARRAY_LONGLONG(_25, 1, 0);
			_25[0] = 32; 
			_ADD_DEALLOC(_25);
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
		_DEALLOC(_32);
		_NEW_1DARRAY_LONGLONG(_32, 0, 0);
		_ADD_DEALLOC(_32);
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
	_DEALLOC_STRUCT(im, Image);
	_DEALLOC(pixels);
	_DEALLOC(_8);
	_DEALLOC(_19);
	_DEALLOC(_22);
	_DEALLOC(_25);
	_DEALLOC(_32);
	return;
}

int main(int argc, char** args){
	long long width = 0;
	long long height = 0;
	long long size = 0;
	_DECL_1DARRAY(pixels);
	_DECL_DEALLOC(pixels);
	Image* input;
	_DECL_DEALLOC(input);
	Image* output;
	_DECL_DEALLOC(output);
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	Image* _19;
	_DECL_DEALLOC(_19);
	Image* _20;
	_DECL_DEALLOC(_20);
	void* _21;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	void* _24;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	//const %7 = 8 : int
	_7 = 8;
	//assign %1 = %7  : int
	width = _7;
	//const %8 = 8 : int
	_8 = 8;
	//assign %2 = %8  : int
	height = _8;
	//mul %9 = %1, %2 : int
	_9=width*height;
	//assign %3 = %9  : int
	size = _9;
	//const %10 = 255 : int
	_10 = 255;
	//arraygen %11 = [10; 3] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY_LONGLONG(_11, size, _10);
	_ADD_DEALLOC(_11);
	//assign %4 = %11  : int[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_LONGLONG(pixels, _11);
	_ADD_DEALLOC(pixels);
	//const %12 = 0 : int
	_12 = 0;
	//const %13 = 0 : int
	_13 = 0;
	//update %4[%13] = %12 : int[] -> int[]
	pixels[_13] = _12;
	//const %14 = 0 : int
	_14 = 0;
	//const %15 = 4 : int
	_15 = 4;
	//mul %16 = %15, %1 : int
	_16=_15*width;
	//const %17 = 3 : int
	_17 = 3;
	//add %18 = %16, %17 : int
	_18=_16+_17;
	//update %4[%18] = %14 : int[] -> int[]
	pixels[_18] = _14;
	//invoke (%19) = (%1, %2, %4) SobelEdgeDetect2:image : function(int,int,int[])->(SobelEdgeDetect2:Image)
	{
		void* pixels_tmp;
		_DEALLOC_STRUCT(_19, Image);
		_19 = image(width, height, _COPY_1DARRAY_PARAM_LONGLONG(pixels), true);
		_CALLEE_DEALLOC(pixels, "false-false-false" , "image");
		_ADD_DEALLOC(_19);
	}
	//assign %5 = %19  : {int height,int[] pixels,int width}
	_DEALLOC_STRUCT(input, Image);
	input = copy_Image(_19);
	_ADD_DEALLOC(input);
	//invoke (%20) = (%5) SobelEdgeDetect2:sobelEdgeDetection : function(SobelEdgeDetect2:Image)->(SobelEdgeDetect2:Image)
	{
		void* input_tmp;
		_DEALLOC_STRUCT(_20, Image);
		_20 = sobelEdgeDetection(_COPY_STRUCT_PARAM(input, Image), true);
		_CALLEE_DEALLOC(input, "false-false-true" , "sobelEdgeDetection");
		_ADD_DEALLOC(_20);
	}
	//assign %6 = %20  : {int height,int[] pixels,int width}
	_DEALLOC_STRUCT(output, Image);
	output = copy_Image(_20);
	_ADD_DEALLOC(output);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [73,110,112,117,116,32,73,109,97,103,101,58] : int[]
	_DEALLOC(_23);
	_NEW_1DARRAY_LONGLONG(_23, 12, 0);
	_23[0] = 73; _23[1] = 110; _23[2] = 112; _23[3] = 117; _23[4] = 116; _23[5] = 32; _23[6] = 73; _23[7] = 109; _23[8] = 97; _23[9] = 103; _23[10] = 101; _23[11] = 58; 
	_ADD_DEALLOC(_23);
	//indirectinvoke () = %22 (%23) : method(int[])->()
	{
		println_s(_23, _23_size);
	}
	//invoke () = (%0, %5) SobelEdgeDetect2:print_image : method(whiley/lang/System:Console,SobelEdgeDetect2:Image)->()
	{
		void* input_tmp;
		print_image(stdout, _COPY_STRUCT_PARAM(input, Image), true);
		_CALLEE_DEALLOC(input, "false-false-false" , "print_image");
	}
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [83,111,98,101,108,32,69,100,103,101,32,68,101,116,101,99,116,105,111,110,58] : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY_LONGLONG(_26, 21, 0);
	_26[0] = 83; _26[1] = 111; _26[2] = 98; _26[3] = 101; _26[4] = 108; _26[5] = 32; _26[6] = 69; _26[7] = 100; _26[8] = 103; _26[9] = 101; _26[10] = 32; _26[11] = 68; _26[12] = 101; _26[13] = 116; _26[14] = 101; _26[15] = 99; _26[16] = 116; _26[17] = 105; _26[18] = 111; _26[19] = 110; _26[20] = 58; 
	_ADD_DEALLOC(_26);
	//indirectinvoke () = %25 (%26) : method(int[])->()
	{
		println_s(_26, _26_size);
	}
	//invoke () = (%0, %6) SobelEdgeDetect2:print_image : method(whiley/lang/System:Console,SobelEdgeDetect2:Image)->()
	{
		void* output_tmp;
		print_image(stdout, _COPY_STRUCT_PARAM(output, Image), true);
		_CALLEE_DEALLOC(output, "false-false-false" , "print_image");
	}
	//return
	_DEALLOC(pixels);
	_DEALLOC_STRUCT(input, Image);
	_DEALLOC_STRUCT(output, Image);
	_DEALLOC(_11);
	_DEALLOC_STRUCT(_19, Image);
	_DEALLOC_STRUCT(_20, Image);
	_DEALLOC(_23);
	_DEALLOC(_26);
	exit(0);
}

