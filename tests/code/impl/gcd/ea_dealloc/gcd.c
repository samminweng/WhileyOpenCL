#include "gcd.h"
int64_t _gcd_(int64_t a, int64_t b){
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	//const %3 = 0 : int
	_3 = 0;
	//ifne %0, %3 goto blklab1 : int
	if(a!=_3){goto blklab1;}
	//return %1
	return b;
//.blklab1
blklab1:;
	//loop (%0, %1, %4, %5, %6, %7)
	while(true){
		//const %5 = 0 : int
		_5 = 0;
		//ifeq %1, %5 goto blklab2 : int
		if(b==_5){goto blklab2;}
		//ifle %0, %1 goto blklab5 : int
		if(a<=b){goto blklab5;}
		//sub %6 = %0, %1 : int
		_6=a-b;
		//assign %0 = %6  : int
		a = _6;
		//goto blklab6
		goto blklab6;
//.blklab5
blklab5:;
		//sub %7 = %1, %0 : int
		_7=b-a;
		//assign %1 = %7  : int
		b = _7;
//.blklab6
blklab6:;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %0
	return a;
	//return
}

int64_t _gcd_cached_(int64_t a, int64_t b, int64_t n, _DECL_1DARRAY_PARAM(gcds)){
	_DECL_DEALLOC(gcds);
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	//const %5 = 0 : int
	_5 = 0;
	//ifne %0, %5 goto blklab7 : int
	if(a!=_5){goto blklab7;}
	//return %1
	_DEALLOC(gcds);
	return b;
	//goto blklab8
	goto blklab8;
//.blklab7
blklab7:;
	//const %6 = 0 : int
	_6 = 0;
	//ifne %1, %6 goto blklab9 : int
	if(b!=_6){goto blklab9;}
	//return %0
	_DEALLOC(gcds);
	return a;
	//goto blklab10
	goto blklab10;
//.blklab9
blklab9:;
	//ifle %0, %1 goto blklab11 : int
	if(a<=b){goto blklab11;}
	//sub %7 = %0, %1 : int
	_7=a-b;
	//assign %0 = %7  : int
	a = _7;
	//goto blklab12
	goto blklab12;
//.blklab11
blklab11:;
	//sub %8 = %1, %0 : int
	_8=b-a;
	//assign %1 = %8  : int
	b = _8;
//.blklab12
blklab12:;
	//mul %9 = %0, %2 : int
	_9=a*n;
	//add %10 = %9, %1 : int
	_10=_9+b;
	//indexof %11 = %3, %10 : int[]
	_11=gcds[_10];
	//return %11
	_DEALLOC(gcds);
	return _11;
//.blklab10
blklab10:;
//.blklab8
blklab8:;
	//return
}

int main(int argc, char** args){
	int64_t n;
	_DECL_1DARRAY(gcds);
	_DECL_DEALLOC(gcds);
	int64_t i;
	int64_t j;
	int64_t _5;
	void* _6;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	void* _9;
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
	void* _23;
	_DECL_1DARRAY(_25);
	_DECL_DEALLOC(_25);
	void* _26;
	void* _28;
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	void* _31;
	void* _33;
	_DECL_1DARRAY(_35);
	_DECL_DEALLOC(_35);
	void* _36;
	int64_t _38;
	int64_t _39;
	int64_t _40;
	int64_t _41;
	int64_t _42;
	int64_t _43;
	int64_t _44;
	//const %5 = 10 : int
	_5 = 10;
	//assign %1 = %5  : int
	n = _5;
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %8 = [78,32,61,32] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY_int64_t(_8, 4, 0);
	_8[0] = 78; _8[1] = 32; _8[2] = 61; _8[3] = 32; 
	_8_dealloc = true;
	//indirectinvoke () = %7 (%8) : method(int[])->()
	{
		printf_s(_8, _8_size);
	}
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %10 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", n);
	}
	//const %11 = 0 : int
	_11 = 0;
	//mul %12 = %1, %1 : int
	_12=n*n;
	//arraygen %13 = [11; 12] : int[]
	_NEW1DARRAY_DEALLOC(_13, _11, _12, int64_t);
	//assign %2 = %13  : int[]
	_ADD_DEALLOC(gcds, _13, int64_t);
	//const %14 = 0 : int
	_14 = 0;
	//assign %3 = %14  : int
	i = _14;
	//loop (%2, %3, %4, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44)
	while(true){
		//ifge %3, %1 goto blklab13 : int
		if(i>=n){goto blklab13;}
		//const %15 = 0 : int
		_15 = 0;
		//assign %4 = %15  : int
		j = _15;
		//loop (%2, %4, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42)
		while(true){
			//ifge %4, %1 goto blklab15 : int
			if(j>=n){goto blklab15;}
			//invoke (%16) = (%3, %4, %1, %2) gcd:gcd_cached : function(int,int,int,int[])->(int)
			{
				_FUNCTIONCALL_COPY_PRE(_16, gcds, 3, "liveness: gcds = true, readonly: gcds = true, return:gcds = NEVER_RETURN" , "gcd_cached");
				void* tmp_gcds;
				_COPY_1DARRAY_PARAM(gcds, tmp_gcds, int64_t);
				_16 = _gcd_cached_(i, j, n, tmp_gcds, gcds_size);
				free(tmp_gcds);
			}
			//mul %17 = %3, %1 : int
			_17=i*n;
			//add %18 = %17, %4 : int
			_18=_17+j;
			//update %2[%18] = %16 : int[] -> int[]
			gcds[_18] = _16;
			//assert
			{
				//mul %19 = %3, %1 : int
				_19=i*n;
				//add %20 = %19, %4 : int
				_20=_19+j;
				//indexof %21 = %2, %20 : int[]
				_21=gcds[_20];
				//invoke (%22) = (%3, %4) gcd:gcd : function(int,int)->(int)
				{
					_22 = _gcd_(i, j);
				}
				//ifeq %21, %22 goto blklab17 : int
				if(_21==_22){goto blklab17;}
				//fail
				fprintf(stderr,"fail");
				exit(-1);
//.blklab17
blklab17:;
			//assert
			}
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = [78,117,109,98,101,114,58,32] : int[]
			_DEALLOC(_25);
			_NEW_1DARRAY_int64_t(_25, 8, 0);
			_25[0] = 78; _25[1] = 117; _25[2] = 109; _25[3] = 98; _25[4] = 101; _25[5] = 114; _25[6] = 58; _25[7] = 32; 
			_25_dealloc = true;
			//indirectinvoke () = %24 (%25) : method(int[])->()
			{
				printf_s(_25, _25_size);
			}
			//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %27 (%3) : method(any)->()
			{
				printf("%"PRId64, i);
			}
			//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %30 = [32,78,117,109,98,101,114,58,32] : int[]
			_DEALLOC(_30);
			_NEW_1DARRAY_int64_t(_30, 9, 0);
			_30[0] = 32; _30[1] = 78; _30[2] = 117; _30[3] = 109; _30[4] = 98; _30[5] = 101; _30[6] = 114; _30[7] = 58; _30[8] = 32; 
			_30_dealloc = true;
			//indirectinvoke () = %29 (%30) : method(int[])->()
			{
				printf_s(_30, _30_size);
			}
			//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %32 = %31 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %32 (%4) : method(any)->()
			{
				printf("%"PRId64, j);
			}
			//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %34 = %33 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %35 = [32,71,67,68,58] : int[]
			_DEALLOC(_35);
			_NEW_1DARRAY_int64_t(_35, 5, 0);
			_35[0] = 32; _35[1] = 71; _35[2] = 67; _35[3] = 68; _35[4] = 58; 
			_35_dealloc = true;
			//indirectinvoke () = %34 (%35) : method(int[])->()
			{
				printf_s(_35, _35_size);
			}
			//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %37 = %36 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//mul %38 = %3, %1 : int
			_38=i*n;
			//add %39 = %38, %4 : int
			_39=_38+j;
			//indexof %40 = %2, %39 : int[]
			_40=gcds[_39];
			//indirectinvoke () = %37 (%40) : method(any)->()
			{
				printf("%"PRId64"\n", _40);
			}
			//const %41 = 1 : int
			_41 = 1;
			//add %42 = %4, %41 : int
			_42=j+_41;
			//assign %4 = %42  : int
			j = _42;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
		//const %43 = 1 : int
		_43 = 1;
		//add %44 = %3, %43 : int
		_44=i+_43;
		//assign %3 = %44  : int
		i = _44;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//return
	_DEALLOC(gcds);
	_DEALLOC(_8);
	_DEALLOC(_13);
	_DEALLOC(_25);
	_DEALLOC(_30);
	_DEALLOC(_35);
	exit(0);
}

