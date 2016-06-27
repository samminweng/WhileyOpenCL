#include "gcd.h"
long long gcd(long long a, long long b){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
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
		//invariant
		{
			//const %4 = 0 : int
			_4 = 0;
			//ifge %0, %4 goto blklab4 : int
			if(a>=_4){goto blklab4;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab4
blklab4:;
		//invariant
		}
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

long long gcd_cached(long long a, long long b, long long n, _DECL_1DARRAY_PARAM(gcds), _DECL_DEALLOC_PARAM(gcds)){
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
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
	long long n = 0;
	_DECL_1DARRAY(gcds);
	_DECL_DEALLOC(gcds);
	long long i = 0;
	long long j = 0;
	long long _5 = 0;
	void* _6;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	void* _9;
	long long _11 = 0;
	long long _12 = 0;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
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
	long long _38 = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	//const %5 = 10 : int
	_5 = 10;
	//assign %1 = %5  : int
	n = _5;
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %8 = [78,32,61,32] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY(_8, 4, 0);
	_8[0] = 78; _8[1] = 32; _8[2] = 61; _8[3] = 32; 
	_ADD_DEALLOC(_8);
	//indirectinvoke () = %7 (%8) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_8));
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %10 (%1) : method(any)->()
	printf("%lld\n", n);
	//const %11 = 0 : int
	_11 = 0;
	//mul %12 = %1, %1 : int
	_12=n*n;
	//arraygen %13 = [11; 12] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY(_13, _12, _11);
	_ADD_DEALLOC(_13);
	//assign %2 = %13  : int[]
	_DEALLOC(gcds);
	_1DARRAY_COPY(gcds, _13);
	_ADD_DEALLOC(gcds);
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
			_16 = gcd_cached(i, j, n, _1DARRAY_COPY_PARAM(gcds), true);
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
				_22 = gcd(i, j);
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
			_NEW_1DARRAY(_25, 8, 0);
			_25[0] = 78; _25[1] = 117; _25[2] = 109; _25[3] = 98; _25[4] = 101; _25[5] = 114; _25[6] = 58; _25[7] = 32; 
			_ADD_DEALLOC(_25);
			//indirectinvoke () = %24 (%25) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_25));
			//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %27 (%3) : method(any)->()
			printf("%lld", i);
			//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %30 = [32,78,117,109,98,101,114,58,32] : int[]
			_DEALLOC(_30);
			_NEW_1DARRAY(_30, 9, 0);
			_30[0] = 32; _30[1] = 78; _30[2] = 117; _30[3] = 109; _30[4] = 98; _30[5] = 101; _30[6] = 114; _30[7] = 58; _30[8] = 32; 
			_ADD_DEALLOC(_30);
			//indirectinvoke () = %29 (%30) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_30));
			//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %32 = %31 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %32 (%4) : method(any)->()
			printf("%lld", j);
			//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %34 = %33 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %35 = [32,71,67,68,58] : int[]
			_DEALLOC(_35);
			_NEW_1DARRAY(_35, 5, 0);
			_35[0] = 32; _35[1] = 71; _35[2] = 67; _35[3] = 68; _35[4] = 58; 
			_ADD_DEALLOC(_35);
			//indirectinvoke () = %34 (%35) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_35));
			//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %37 = %36 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//mul %38 = %3, %1 : int
			_38=i*n;
			//add %39 = %38, %4 : int
			_39=_38+j;
			//indexof %40 = %2, %39 : int[]
			_40=gcds[_39];
			//indirectinvoke () = %37 (%40) : method(any)->()
			printf("%lld\n", _40);
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

