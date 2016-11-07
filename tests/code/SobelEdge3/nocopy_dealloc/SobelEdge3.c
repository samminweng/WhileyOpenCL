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
	_UPDATE_1DARRAY(_4->pixels, pixels);
	_4->width = width;
	_REMOVE_DEALLOC(pixels);
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
	_UPDATE_1DARRAY(pixels, _17);
	_TRANSFER_DEALLOC(pixels, _17);
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
	int64_t _17 = 0;
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
	_DECL_1DARRAY(_29);
	_DECL_DEALLOC(_29);
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	_DECL_1DARRAY(_42);
	_DECL_DEALLOC(_42);
	int64_t _43 = 0;
	int64_t _44 = 0;
	int64_t _45 = 0;
	int64_t _46 = 0;
	BYTE _47;
	BYTE _48;
	BYTE _49;
	BYTE _50;
	int64_t _51 = 0;
	int64_t _52 = 0;
	int64_t _53 = 0;
	int64_t _54 = 0;
	int64_t _55 = 0;
	int64_t _56 = 0;
	BYTE _57;
	BYTE _58;
	int64_t _59 = 0;
	int64_t _60 = 0;
	int64_t _61 = 0;
	int64_t _62 = 0;
	Image* _63;
	_DECL_DEALLOC(_63);
	//fieldload %14 = %0 pixels : {int height,byte[] pixels,int width}
	_DEALLOC(_14);
	_UPDATE_1DARRAY(_14, input->pixels);
	_REMOVE_DEALLOC(_14);
	//assign %2 = %14  : byte[]
	_DEALLOC(pixels);
	_UPDATE_1DARRAY(pixels, _14);
	_TRANSFER_DEALLOC(pixels, _14);
	//fieldload %15 = %0 width : {int height,byte[] pixels,int width}
	_15 = input->width;
	//assign %3 = %15  : int
	width = _15;
	//fieldload %16 = %0 height : {int height,byte[] pixels,int width}
	_16 = input->height;
	//assign %4 = %16  : int
	height = _16;
	//assign %5 = %2  : byte[]
	_DEALLOC(newPixels);
	_COPY_1DARRAY_BYTE(newPixels, pixels);
	_ADD_DEALLOC(newPixels);
	//const %17 = 1 : int
	_17 = 1;
	//neg %18 = %17 : int
	_18= -_17;
	//const %19 = 0 : int
	_19 = 0;
	//const %20 = 1 : int
	_20 = 1;
	//const %21 = 2 : int
	_21 = 2;
	//neg %22 = %21 : int
	_22= -_21;
	//const %23 = 0 : int
	_23 = 0;
	//const %24 = 2 : int
	_24 = 2;
	//const %25 = 1 : int
	_25 = 1;
	//neg %26 = %25 : int
	_26= -_25;
	//const %27 = 0 : int
	_27 = 0;
	//const %28 = 1 : int
	_28 = 1;
	//newlist %29 = (%18, %19, %20, %22, %23, %24, %26, %27, %28) : int[]
	_DEALLOC(_29);
	_NEW_1DARRAY_int64_t(_29, 9, 0);
	_29[0] = _18; _29[1] = _19; _29[2] = _20; _29[3] = _22; _29[4] = _23; _29[5] = _24; _29[6] = _26; _29[7] = _27; _29[8] = _28; 
	_ADD_DEALLOC(_29);
	//assign %6 = %29  : int[]
	_DEALLOC(v_sobel);
	_UPDATE_1DARRAY(v_sobel, _29);
	_TRANSFER_DEALLOC(v_sobel, _29);
	//const %30 = 1 : int
	_30 = 1;
	//const %31 = 2 : int
	_31 = 2;
	//const %32 = 1 : int
	_32 = 1;
	//const %33 = 0 : int
	_33 = 0;
	//const %34 = 0 : int
	_34 = 0;
	//const %35 = 0 : int
	_35 = 0;
	//const %36 = 1 : int
	_36 = 1;
	//neg %37 = %36 : int
	_37= -_36;
	//const %38 = 2 : int
	_38 = 2;
	//neg %39 = %38 : int
	_39= -_38;
	//const %40 = 1 : int
	_40 = 1;
	//neg %41 = %40 : int
	_41= -_40;
	//newlist %42 = (%30, %31, %32, %33, %34, %35, %37, %39, %41) : int[]
	_DEALLOC(_42);
	_NEW_1DARRAY_int64_t(_42, 9, 0);
	_42[0] = _30; _42[1] = _31; _42[2] = _32; _42[3] = _33; _42[4] = _34; _42[5] = _35; _42[6] = _37; _42[7] = _39; _42[8] = _41; 
	_ADD_DEALLOC(_42);
	//assign %7 = %42  : int[]
	_DEALLOC(h_sobel);
	_UPDATE_1DARRAY(h_sobel, _42);
	_TRANSFER_DEALLOC(h_sobel, _42);
	//const %43 = 0 : int
	_43 = 0;
	//assign %8 = %43  : int
	x = _43;
	//loop (%5, %8, %9, %10, %11, %12, %13, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62)
	while(true){
		//ifge %8, %3 goto blklab4 : int
		if(x>=width){goto blklab4;}
		//const %44 = 0 : int
		_44 = 0;
		//assign %9 = %44  : int
		y = _44;
		//loop (%5, %9, %10, %11, %12, %13, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60)
		while(true){
			//ifge %9, %4 goto blklab6 : int
			if(y>=height){goto blklab6;}
			//mul %45 = %9, %3 : int
			_45=y*width;
			//add %46 = %45, %8 : int
			_46=_45+x;
			//assign %10 = %46  : int
			pos = _46;
			//indexof %47 = %2, %10 : byte[]
			_47=pixels[pos];
			//const %48 = 00001010b : byte
			_48 = 0b00001010;
			//ifeq %47, %48 goto blklab8 : byte
			if(_47==_48){goto blklab8;}
			//indexof %49 = %2, %10 : byte[]
			_49=pixels[pos];
			//const %50 = 00000000b : byte
			_50 = 0b00000000;
			//ifeq %49, %50 goto blklab8 : byte
			if(_49==_50){goto blklab8;}
			//invoke (%51) = (%0, %8, %9, %6) SobelEdge3:convolution : function(SobelEdge3:Image,int,int,int[])->(int)
			{
				_51 = convolution(_STRUCT_PARAM(input), false, x, y, _1DARRAY_PARAM(v_sobel), false);
				_RETAIN_DEALLOC(input, "false-false-true" , "convolution");
				_RETAIN_DEALLOC(v_sobel, "false-false-true" , "convolution");
			}
			//assign %11 = %51  : int
			v_g = _51;
			//invoke (%52) = (%0, %8, %9, %7) SobelEdge3:convolution : function(SobelEdge3:Image,int,int,int[])->(int)
			{
				_52 = convolution(_STRUCT_PARAM(input), false, x, y, _1DARRAY_PARAM(h_sobel), false);
				_RETAIN_DEALLOC(input, "false-false-true" , "convolution");
				_RETAIN_DEALLOC(h_sobel, "false-false-true" , "convolution");
			}
			//assign %12 = %52  : int
			h_g = _52;
			//invoke (%53) = (%11) whiley/lang/Math:abs : function(int)->(int)
			{
				_53 = llabs(v_g);
			}
			//invoke (%54) = (%12) whiley/lang/Math:abs : function(int)->(int)
			{
				_54 = llabs(h_g);
			}
			//add %55 = %53, %54 : int
			_55=_53+_54;
			//assign %13 = %55  : int
			t_g = _55;
			//const %56 = 128 : int
			_56 = 128;
			//ifle %13, %56 goto blklab9 : int
			if(t_g<=_56){goto blklab9;}
			//const %57 = 00100000b : byte
			_57 = 0b00100000;
			//update %5[%10] = %57 : byte[] -> byte[]
			newPixels[pos] = _57;
			//goto blklab10
			goto blklab10;
//.blklab9
blklab9:;
			//const %58 = 01100010b : byte
			_58 = 0b01100010;
			//update %5[%10] = %58 : byte[] -> byte[]
			newPixels[pos] = _58;
//.blklab10
blklab10:;
//.blklab8
blklab8:;
			//const %59 = 1 : int
			_59 = 1;
			//add %60 = %9, %59 : int
			_60=y+_59;
			//assign %9 = %60  : int
			y = _60;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %61 = 1 : int
		_61 = 1;
		//add %62 = %8, %61 : int
		_62=x+_61;
		//assign %8 = %62  : int
		x = _62;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//invoke (%63) = (%3, %4, %5) SobelEdge3:image : function(int,int,byte[])->(SobelEdge3:Image)
	{
		_DEALLOC_STRUCT(_63, Image);
		_63 = image(width, height, _1DARRAY_PARAM(newPixels), false);
		_RESET_DEALLOC(newPixels, "false-true-false" , "image");
		_ADD_DEALLOC(_63);
	}
	//return %63
	_DEALLOC_STRUCT(input, Image);
	_DEALLOC_STRUCT(_1, Image);
	_DEALLOC(pixels);
	_DEALLOC(newPixels);
	_DEALLOC(v_sobel);
	_DEALLOC(h_sobel);
	_DEALLOC(_14);
	_DEALLOC(_29);
	_DEALLOC(_42);
	return _63;
	//return
}

void write_image(FILE* sys, Image* im, _DECL_DEALLOC_PARAM(im)){
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	int64_t width = 0;
	int64_t height = 0;
	int64_t size = 0;
	FILE* w;
	_DECL_1DARRAY_BYTE(_7);
	_DECL_DEALLOC(_7);
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	void* _11;
	_DECL_DEALLOC(_11);
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13 = 0;
	//fieldload %7 = %1 pixels : {int height,byte[] pixels,int width}
	_DEALLOC(_7);
	_UPDATE_1DARRAY(_7, im->pixels);
	_REMOVE_DEALLOC(_7);
	//assign %2 = %7  : byte[]
	_DEALLOC(pixels);
	_UPDATE_1DARRAY(pixels, _7);
	_TRANSFER_DEALLOC(pixels, _7);
	//fieldload %8 = %1 width : {int height,byte[] pixels,int width}
	_8 = im->width;
	//assign %3 = %8  : int
	width = _8;
	//fieldload %9 = %1 height : {int height,byte[] pixels,int width}
	_9 = im->height;
	//assign %4 = %9  : int
	height = _9;
	//mul %10 = %3, %4 : int
	_10=width*height;
	//assign %5 = %10  : int
	size = _10;
	//const %12 = [111,117,116,112,117,116,46,116,120,116] : int[]
	_DEALLOC(_12);
	_NEW_1DARRAY_int64_t(_12, 10, 0);
	_12[0] = 111; _12[1] = 117; _12[2] = 116; _12[3] = 112; _12[4] = 117; _12[5] = 116; _12[6] = 46; _12[7] = 116; _12[8] = 120; _12[9] = 116; 
	_ADD_DEALLOC(_12);
	//invoke (%11) = (%12) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_11 = Writer(_12, _12_size);
	}
	//assign %6 = %11  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	w = _11;
	//fieldload %14 = %6 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%13) = %14 (%2) : method(byte[])->(int)
	{
		writeAll(w, pixels, pixels_size);
	}
	//fieldload %15 = %6 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %15 () : method()->()
	{
		fclose(w);
		w = NULL;
	}
	//return
	_DEALLOC_STRUCT(im, Image);
	_DEALLOC(pixels);
	if(w != NULL){fclose(w); w = NULL;}
	_DEALLOC(_7);
	_DEALLOC(_12);
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
	_DECL_1DARRAY_BYTE(_20);
	_DECL_DEALLOC(_20);
	int64_t _21 = 0;
	_DECL_1DARRAY_BYTE(_22);
	_DECL_DEALLOC(_22);
	int64_t _23 = 0;
	//const %8 = 33 : int
	_8 = 33;
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
	_UPDATE_1DARRAY(pixels, _13);
	_TRANSFER_DEALLOC(pixels, _13);
	//invoke (%15) = (%1, %2, %5) SobelEdge3:image : function(int,int,byte[])->(SobelEdge3:Image)
	{
		_DEALLOC_STRUCT(_15, Image);
		_15 = image(width, height, _1DARRAY_PARAM(pixels), false);
		_RESET_DEALLOC(pixels, "false-true-false" , "image");
		_ADD_DEALLOC(_15);
	}
	//assign %6 = %15  : {int height,byte[] pixels,int width}
	_DEALLOC_STRUCT(input, Image);
	input = _15;
	_TRANSFER_DEALLOC(input, _15);
	//invoke (%16) = (%6) SobelEdge3:sobelEdgeDetection : function(SobelEdge3:Image)->(SobelEdge3:Image)
	{
		_DEALLOC_STRUCT(_16, Image);
		_16 = sobelEdgeDetection(_STRUCT_PARAM(input), false);
		_RETAIN_DEALLOC(input, "false-false-false" , "sobelEdgeDetection");
		_ADD_DEALLOC(_16);
	}
	//assign %7 = %16  : {int height,byte[] pixels,int width}
	_DEALLOC_STRUCT(output, Image);
	output = _16;
	_TRANSFER_DEALLOC(output, _16);
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
	//invoke () = (%0, %7) SobelEdge3:write_image : method(whiley/lang/System:Console,SobelEdge3:Image)->()
	{
		write_image(stdout, _STRUCT_PARAM(output), false);
		_RETAIN_DEALLOC(output, "false-false-false" , "write_image");
	}
	//assert
	{
		//fieldload %20 = %7 pixels : {int height,byte[] pixels,int width}
		_DEALLOC(_20);
		_UPDATE_1DARRAY(_20, output->pixels);
		_REMOVE_DEALLOC(_20);
		//lengthof %21 = %20 : byte[]
		_21 = _20_size;
		//fieldload %22 = %6 pixels : {int height,byte[] pixels,int width}
		_DEALLOC(_22);
		_UPDATE_1DARRAY(_22, input->pixels);
		_REMOVE_DEALLOC(_22);
		//lengthof %23 = %22 : byte[]
		_23 = _22_size;
		//ifeq %21, %23 goto blklab11 : int
		if(_21==_23){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
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
	_DEALLOC(_20);
	_DEALLOC(_22);
	exit(0);
}

