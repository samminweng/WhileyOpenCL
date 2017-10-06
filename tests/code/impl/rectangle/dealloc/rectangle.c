#include "rectangle.h"
Point* copy_Point(Point* _Point){
	Point* new_Point = malloc(sizeof(Point));
	new_Point->x = _Point->x;
	new_Point->y = _Point->y;
	return new_Point;
}
Point** copy_array_Point(Point** _Point, size_t _Point_size){
	Point** new_Point = malloc(_Point_size*sizeof(Point*));
	for(int i=0;i<_Point_size;i++){
		new_Point[i] = copy_Point(_Point[i]);
	}
	return new_Point;
}
void free_Point(Point* point){
	free(point);
}
void printf_Point(Point* point){
	printf("{");
	printf(" x:");
	printf("%"PRId64, point->x);
	printf(" y:");
	printf("%"PRId64, point->y);
	printf("}");
}
Rectangle* copy_Rectangle(Rectangle* _Rectangle){
	Rectangle* new_Rectangle = malloc(sizeof(Rectangle));
	_COPY_STRUCT(new_Rectangle->p1, _Rectangle->p1, Point);
	_COPY_STRUCT(new_Rectangle->p2, _Rectangle->p2, Point);
	return new_Rectangle;
}
Rectangle** copy_array_Rectangle(Rectangle** _Rectangle, size_t _Rectangle_size){
	Rectangle** new_Rectangle = malloc(_Rectangle_size*sizeof(Rectangle*));
	for(int i=0;i<_Rectangle_size;i++){
		new_Rectangle[i] = copy_Rectangle(_Rectangle[i]);
	}
	return new_Rectangle;
}
void free_Rectangle(Rectangle* rectangle){
	free_Point(rectangle->p1);
	rectangle->p1 = NULL;
	free_Point(rectangle->p2);
	rectangle->p2 = NULL;
	free(rectangle);
}
void printf_Rectangle(Rectangle* rectangle){
	printf("{");
	printf(" p1:");
	printf_Point(rectangle->p1);
	printf(" p2:");
	printf_Point(rectangle->p2);
	printf("}");
}
Rectangle* _updateRec_(Rectangle* rec, _DECL_DEALLOC_PARAM(rec), Point* p, _DECL_DEALLOC_PARAM(p)){
	Rectangle* r;
	_DECL_DEALLOC(r);
	//update %0.p2 = %1 : {{int x,int y} p1,{int x,int y} p2} -> {{int x,int y} p1,{int x,int y} p2}
	_DEALLOC_MEMBER_STRUCT_UPDATECODE(rec, rec->p2, Point);
	rec->p2 = p;
	_REMOVE_DEALLOC(p);
	//return %0
	_DEALLOC_STRUCT(p, Point);
	_DEALLOC_STRUCT(r, Rectangle);
	return rec;
	//return
}

int main(int argc, char** args){
	Point* p1;
	_DECL_DEALLOC(p1);
	Point* p2;
	_DECL_DEALLOC(p2);
	Rectangle* rec;
	_DECL_DEALLOC(rec);
	Point* p3;
	_DECL_DEALLOC(p3);
	int64_t _5;
	int64_t _6;
	Point* _7;
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	Point* _10;
	_DECL_DEALLOC(_10);
	Rectangle* _11;
	_DECL_DEALLOC(_11);
	int64_t _12;
	int64_t _13;
	Point* _14;
	_DECL_DEALLOC(_14);
	Rectangle* _15;
	_DECL_DEALLOC(_15);
	Point* _16;
	_DECL_DEALLOC(_16);
	int64_t _17;
	int64_t _18;
	Point* _19;
	_DECL_DEALLOC(_19);
	int64_t _20;
	int64_t _21;
	void* _22;
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	void* _28;
	Point* _30;
	_DECL_DEALLOC(_30);
	int64_t _31;
	void* _32;
	_DECL_1DARRAY(_34);
	_DECL_DEALLOC(_34);
	void* _35;
	Point* _37;
	_DECL_DEALLOC(_37);
	int64_t _38;
	void* _39;
	_DECL_1DARRAY(_41);
	_DECL_DEALLOC(_41);
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//newrecord %7 = (%5, %6) : {int x,int y}
	_DEALLOC_STRUCT(_7, Point);
	_7 = malloc(sizeof(Point));
	_7->x = _5;
	_7->y = _6;
	_ADD_DEALLOC(_7);
	//assign %1 = %7  : {int x,int y}
	_DEALLOC_STRUCT(p1, Point);
	p1 = copy_Point(_7);
	_ADD_DEALLOC(p1);
	//const %8 = 3 : int
	_8 = 3;
	//const %9 = 4 : int
	_9 = 4;
	//newrecord %10 = (%8, %9) : {int x,int y}
	_DEALLOC_STRUCT(_10, Point);
	_10 = malloc(sizeof(Point));
	_10->x = _8;
	_10->y = _9;
	_ADD_DEALLOC(_10);
	//assign %2 = %10  : {int x,int y}
	_DEALLOC_STRUCT(p2, Point);
	p2 = copy_Point(_10);
	_ADD_DEALLOC(p2);
	//newrecord %11 = (%1, %2) : {{int x,int y} p1,{int x,int y} p2}
	_DEALLOC_STRUCT(_11, Rectangle);
	_11 = malloc(sizeof(Rectangle));
	_COPY_STRUCT(_11->p1, p1, Point);
	_COPY_STRUCT(_11->p2, p2, Point);
	_ADD_DEALLOC(_11);
	//assign %3 = %11  : {{int x,int y} p1,{int x,int y} p2}
	_DEALLOC_STRUCT(rec, Rectangle);
	rec = copy_Rectangle(_11);
	_ADD_DEALLOC(rec);
	//const %12 = 6 : int
	_12 = 6;
	//const %13 = 8 : int
	_13 = 8;
	//newrecord %14 = (%12, %13) : {int x,int y}
	_DEALLOC_STRUCT(_14, Point);
	_14 = malloc(sizeof(Point));
	_14->x = _12;
	_14->y = _13;
	_ADD_DEALLOC(_14);
	//assign %4 = %14  : {int x,int y}
	_DEALLOC_STRUCT(p3, Point);
	p3 = copy_Point(_14);
	_ADD_DEALLOC(p3);
	//invoke (%15) = (%3, %4) rectangle:updateRec : function(rectangle:Rectangle,rectangle:Point)->(rectangle:Rectangle)
	{
		void* tmp_rec_0;
		tmp_rec_0 = copy_Rectangle(rec);
		void* tmp_p3_1;
		tmp_p3_1 = copy_Point(p3);
		_DEALLOC_STRUCT(_15, Rectangle);
		_15 = _updateRec_(tmp_rec_0, false, tmp_p3_1, true);
		_CALLER_DEALLOC_STRUCT(_15, tmp_rec_0, "true-true-false" , "updateRec", Rectangle);
		_CALLEE_DEALLOC(p3, "false-false-false" , "updateRec");
		_15_dealloc = true;
	}
	//assign %3 = %15  : {{int x,int y} p1,{int x,int y} p2}
	_DEALLOC_STRUCT(rec, Rectangle);
	rec = copy_Rectangle(_15);
	_ADD_DEALLOC(rec);
	//assert
	{
		//fieldload %16 = %3 p2 : {{int x,int y} p1,{int x,int y} p2}
		_DEALLOC_STRUCT(_16, Point);
		_16 = rec->p2;
		_REMOVE_DEALLOC(_16);
		//fieldload %17 = %16 x : {int x,int y}
		_17 = _16->x;
		//const %18 = 6 : int
		_18 = 6;
		//ifeq %17, %18 goto blklab0 : int
		if(_17==_18){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//assert
	{
		//fieldload %19 = %3 p2 : {{int x,int y} p1,{int x,int y} p2}
		_DEALLOC_STRUCT(_19, Point);
		_19 = rec->p2;
		_REMOVE_DEALLOC(_19);
		//fieldload %20 = %19 y : {int x,int y}
		_20 = _19->y;
		//const %21 = 8 : int
		_21 = 8;
		//ifeq %20, %21 goto blklab1 : int
		if(_20==_21){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = [112,50,32,112,111,105,110,116,32,111,102,32,114,101,99,116,97,110,103,108,101] : int[]
	_DEALLOC(_24);
	_NEW_1DARRAY_int64_t(_24, 21, 0);
	_24[0] = 112; _24[1] = 50; _24[2] = 32; _24[3] = 112; _24[4] = 111; _24[5] = 105; _24[6] = 110; _24[7] = 116; _24[8] = 32; _24[9] = 111; _24[10] = 102; _24[11] = 32; _24[12] = 114; _24[13] = 101; _24[14] = 99; _24[15] = 116; _24[16] = 97; _24[17] = 110; _24[18] = 103; _24[19] = 108; _24[20] = 101; 
	_ADD_DEALLOC(_24);
	//indirectinvoke () = %23 (%24) : method(int[])->()
	{
		println_s(_24, _24_size);
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [112,50,46,120,32,105,115,32] : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY_int64_t(_27, 8, 0);
	_27[0] = 112; _27[1] = 50; _27[2] = 46; _27[3] = 120; _27[4] = 32; _27[5] = 105; _27[6] = 115; _27[7] = 32; 
	_ADD_DEALLOC(_27);
	//indirectinvoke () = %26 (%27) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_27));
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %30 = %3 p2 : {{int x,int y} p1,{int x,int y} p2}
	_DEALLOC_STRUCT(_30, Point);
	_30 = rec->p2;
	_REMOVE_DEALLOC(_30);
	//fieldload %31 = %30 x : {int x,int y}
	_31 = _30->x;
	//indirectinvoke () = %29 (%31) : method(any)->()
	{
		printf("%"PRId64"\n", _31);
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %34 = [112,50,46,121,32,105,115,32] : int[]
	_DEALLOC(_34);
	_NEW_1DARRAY_int64_t(_34, 8, 0);
	_34[0] = 112; _34[1] = 50; _34[2] = 46; _34[3] = 121; _34[4] = 32; _34[5] = 105; _34[6] = 115; _34[7] = 32; 
	_ADD_DEALLOC(_34);
	//indirectinvoke () = %33 (%34) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_34));
	}
	//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %36 = %35 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %37 = %3 p2 : {{int x,int y} p1,{int x,int y} p2}
	_DEALLOC_STRUCT(_37, Point);
	_37 = rec->p2;
	_REMOVE_DEALLOC(_37);
	//fieldload %38 = %37 y : {int x,int y}
	_38 = _37->y;
	//indirectinvoke () = %36 (%38) : method(any)->()
	{
		printf("%"PRId64"\n", _38);
	}
	//fieldload %39 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %40 = %39 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %41 = [80,97,115,115,32,117,112,100,97,116,101,32,114,101,116,97,110,103,108,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_41);
	_NEW_1DARRAY_int64_t(_41, 30, 0);
	_41[0] = 80; _41[1] = 97; _41[2] = 115; _41[3] = 115; _41[4] = 32; _41[5] = 117; _41[6] = 112; _41[7] = 100; _41[8] = 97; _41[9] = 116; _41[10] = 101; _41[11] = 32; _41[12] = 114; _41[13] = 101; _41[14] = 116; _41[15] = 97; _41[16] = 110; _41[17] = 103; _41[18] = 108; _41[19] = 101; _41[20] = 32; _41[21] = 116; _41[22] = 101; _41[23] = 115; _41[24] = 116; _41[25] = 32; _41[26] = 99; _41[27] = 97; _41[28] = 115; _41[29] = 101; 
	_ADD_DEALLOC(_41);
	//indirectinvoke () = %40 (%41) : method(int[])->()
	{
		println_s(_41, _41_size);
	}
	//return
	_DEALLOC_STRUCT(p1, Point);
	_DEALLOC_STRUCT(p2, Point);
	_DEALLOC_STRUCT(rec, Rectangle);
	_DEALLOC_STRUCT(p3, Point);
	_DEALLOC_STRUCT(_7, Point);
	_DEALLOC_STRUCT(_10, Point);
	_DEALLOC_STRUCT(_11, Rectangle);
	_DEALLOC_STRUCT(_14, Point);
	_DEALLOC_STRUCT(_15, Rectangle);
	_DEALLOC_STRUCT(_16, Point);
	_DEALLOC_STRUCT(_19, Point);
	_DEALLOC(_24);
	_DEALLOC(_27);
	_DEALLOC_STRUCT(_30, Point);
	_DEALLOC(_34);
	_DEALLOC_STRUCT(_37, Point);
	_DEALLOC(_41);
	exit(0);
}

