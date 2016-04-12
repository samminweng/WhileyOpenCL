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
			//ifgt %0, %4 goto blklab4 : int
			if(a>_4){goto blklab4;}
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

long long* gcd_array(_DECL_1DARRAY_PARAM(data), _DECL_OWNERSHIP_PARAM(data), long long n){
	_DECL_1DARRAY(_2);
	_DECL_OWNERSHIP(_2);
	_DECL_1DARRAY(gcds);
	_DECL_OWNERSHIP(gcds);
	long long i = 0;
	long long j = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//mul %7 = %1, %1 : int
	_7=n*n;
	//arraygen %8 = [6; 7] : int[]
	_FREE(_8);
	_GEN_1DARRAY(_8, _7, _6);
	_ADD_OWNERSHIP(_8);
	//assign %3 = %8  : int[]
	_FREE(gcds);
	_1DARRAY_COPY(gcds, _8);
	_ADD_OWNERSHIP(gcds);
	_ADD_OWNERSHIP(_8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	i = _9;
	//loop (%3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19)
	while(true){
		//ifge %4, %1 goto blklab7 : int
		if(i>=n){goto blklab7;}
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		j = _10;
		//loop (%3, %5, %11, %12, %13, %14, %15, %16, %17)
		while(true){
			//ifge %5, %1 goto blklab9 : int
			if(j>=n){goto blklab9;}
			//indexof %12 = %0, %4 : int[]
			_12=data[i];
			//indexof %13 = %0, %5 : int[]
			_13=data[j];
			//invoke (%11) = (%12, %13) gcd:gcd : function(gcd:nat,gcd:nat)->(gcd:nat)
			_11 = gcd(_12, _13);
			//mul %14 = %4, %1 : int
			_14=i*n;
			//add %15 = %14, %5 : int
			_15=_14+j;
			//update %3[%15] = %11 : int[] -> int[]
			gcds[_15] = _11;
			//const %16 = 1 : int
			_16 = 1;
			//add %17 = %5, %16 : int
			_17=j+_16;
			//assign %5 = %17  : int
			j = _17;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %4, %18 : int
		_19=i+_18;
		//assign %4 = %19  : int
		i = _19;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return %3
	_FREE(data);
	_FREE(_2);
	_FREE(_8);
	return gcds;
	//return
	_FREE(data);
	_FREE(_2);
	_FREE(gcds);
	_FREE(_8);
}

long long* init(long long n){
	_DECL_1DARRAY(_1);
	_DECL_OWNERSHIP(_1);
	_DECL_1DARRAY(data);
	_DECL_OWNERSHIP(data);
	long long i = 0;
	long long _4 = 0;
	_DECL_1DARRAY(_5);
	_DECL_OWNERSHIP(_5);
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//arraygen %5 = [4; 0] : int[]
	_FREE(_5);
	_GEN_1DARRAY(_5, n, _4);
	_ADD_OWNERSHIP(_5);
	//assign %2 = %5  : int[]
	_FREE(data);
	_1DARRAY_COPY(data, _5);
	_ADD_OWNERSHIP(data);
	_ADD_OWNERSHIP(_5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	i = _6;
	//loop (%2, %3, %7, %8, %9, %10)
	while(true){
		//ifge %3, %0 goto blklab11 : int
		if(i>=n){goto blklab11;}
		//indexof %7 = %2, %3 : int[]
		_7=data[i];
		//add %8 = %7, %3 : int
		_8=_7+i;
		//update %2[%3] = %8 : int[] -> int[]
		data[i] = _8;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %3, %9 : int
		_10=i+_9;
		//assign %3 = %10  : int
		i = _10;
//.blklab12
blklab12:;
	}
//.blklab11
blklab11:;
	//return %2
	_FREE(_1);
	_FREE(_5);
	return data;
	//return
	_FREE(_1);
	_FREE(data);
	_FREE(_5);
}

int main(int argc, char** args){
	long long n = 0;
	_DECL_1DARRAY(data);
	_DECL_OWNERSHIP(data);
	_DECL_1DARRAY(gcds);
	_DECL_OWNERSHIP(gcds);
	long long i = 0;
	long long j = 0;
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	long long _9 = 0;
	long long _10 = 0;
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_OWNERSHIP(_13);
	void* _14;
	long long _16 = 0;
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_OWNERSHIP(_19);
	void* _20;
	long long _22 = 0;
	void* _23;
	_DECL_1DARRAY(_25);
	_DECL_OWNERSHIP(_25);
	void* _26;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	//const %6 = 5 : int
	_6 = 5;
	//assign %1 = %6  : int
	n = _6;
	//invoke (%7) = (%1) gcd:init : function(int)->(int[])
	_FREE(_7);
	_7 = init(n);
	_ADD_OWNERSHIP(_7);
	//assign %2 = %7  : int[]
	_FREE(data);
	_1DARRAY_COPY(data, _7);
	_ADD_OWNERSHIP(data);
	_ADD_OWNERSHIP(_7);
	//invoke (%8) = (%2, %1) gcd:gcd_array : function(int[],int)->(int[])
	_FREE(_8);
	_ADD_OWNERSHIP(data);
	_1DARRAY_SIZE(_8, data);
	_8 = gcd_array(_1DARRAY_COPY_PARAM(data), false, n);
	_ADD_OWNERSHIP(_8);
	//assign %3 = %8  : int[]
	_FREE(gcds);
	_1DARRAY_COPY(gcds, _8);
	_ADD_OWNERSHIP(gcds);
	_ADD_OWNERSHIP(_8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	i = _9;
	//loop (%4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34)
	while(true){
		//ifge %4, %1 goto blklab13 : int
		if(i>=n){goto blklab13;}
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		j = _10;
		//loop (%5, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
		while(true){
			//ifge %5, %1 goto blklab15 : int
			if(j>=n){goto blklab15;}
			//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %13 = [78,117,109,98,101,114,58,32] : int[]
			_FREE(_13);
			_NEW_ARRAY(_13, 8);
			_13[0] = 78; _13[1] = 117; _13[2] = 109; _13[3] = 98; _13[4] = 101; _13[5] = 114; _13[6] = 58; _13[7] = 32; 
			_ADD_OWNERSHIP(_13);
			//indirectinvoke () = %12 (%13) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_13));
			//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %15 = %14 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %16 = %2, %4 : int[]
			_16=data[i];
			//indirectinvoke () = %15 (%16) : method(any)->()
			printf("%lld", _16);
			//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %18 = %17 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %19 = [32,78,117,109,98,101,114,58,32] : int[]
			_FREE(_19);
			_NEW_ARRAY(_19, 9);
			_19[0] = 32; _19[1] = 78; _19[2] = 117; _19[3] = 109; _19[4] = 98; _19[5] = 101; _19[6] = 114; _19[7] = 58; _19[8] = 32; 
			_ADD_OWNERSHIP(_19);
			//indirectinvoke () = %18 (%19) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_19));
			//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %21 = %20 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %22 = %2, %5 : int[]
			_22=data[j];
			//indirectinvoke () = %21 (%22) : method(any)->()
			printf("%lld", _22);
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = [32,71,67,68,58] : int[]
			_FREE(_25);
			_NEW_ARRAY(_25, 5);
			_25[0] = 32; _25[1] = 71; _25[2] = 67; _25[3] = 68; _25[4] = 58; 
			_ADD_OWNERSHIP(_25);
			//indirectinvoke () = %24 (%25) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_25));
			//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %27 = %26 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//mul %28 = %4, %1 : int
			_28=i*n;
			//add %29 = %28, %5 : int
			_29=_28+j;
			//indexof %30 = %3, %29 : int[]
			_30=gcds[_29];
			//indirectinvoke () = %27 (%30) : method(any)->()
			printf("%lld\n", _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %5, %31 : int
			_32=j+_31;
			//assign %5 = %32  : int
			j = _32;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
		//const %33 = 1 : int
		_33 = 1;
		//add %34 = %4, %33 : int
		_34=i+_33;
		//assign %4 = %34  : int
		i = _34;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//return
	_FREE(data);
	_FREE(gcds);
	_FREE(_7);
	_FREE(_8);
	_FREE(_13);
	_FREE(_19);
	_FREE(_25);
	exit(0);
}

