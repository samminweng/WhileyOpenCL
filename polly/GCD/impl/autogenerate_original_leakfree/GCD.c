#include "GCD.h"
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

int main(int argc, char** args){
	long long* max;
	long long n = 0;
	long long sum = 0;
	long long i = 0;
	long long j = 0;
	long long* _6;
	_DECL_2DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_OWNERSHIP(_9);
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_OWNERSHIP(_12);
	void* _13;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	void* _24;
	_DECL_1DARRAY(_26);
	_DECL_OWNERSHIP(_26);
	void* _27;
	void* _29;
	_DECL_1DARRAY(_31);
	_DECL_OWNERSHIP(_31);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_7);
	_ADD_OWNERSHIP(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_6, _9);
	//assign %1 = %6  : null|int
	max = _6;
	//ifis %1, null goto blklab7 : null|int
	if(max == NULL) { goto blklab7;}
	//assign %2 = %1  : int
	n = *max;
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [78,32,61,32] : int[]
	_FREE(_12);
	_NEW_ARRAY(_12, 4);
	_12[0] = 78; _12[1] = 32; _12[2] = 61; _12[3] = 32; 
	_ADD_OWNERSHIP(_12);
	//indirectinvoke () = %11 (%12) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_12));
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %14 (%2) : method(any)->()
	printf("%lld\n", n);
	//const %15 = 0 : int
	_15 = 0;
	//assign %3 = %15  : int
	sum = _15;
	//const %16 = 0 : int
	_16 = 0;
	//assign %4 = %16  : int
	i = _16;
	//loop (%3, %4, %5, %17, %18, %19, %20, %21, %22, %23)
	while(true){
		//ifge %4, %2 goto blklab8 : int
		if(i>=n){goto blklab8;}
		//const %17 = 0 : int
		_17 = 0;
		//assign %5 = %17  : int
		j = _17;
		//loop (%3, %5, %18, %19, %20, %21)
		while(true){
			//ifge %5, %2 goto blklab10 : int
			if(j>=n){goto blklab10;}
			//invoke (%18) = (%4, %5) GCD:gcd : function(int,int)->(int)
			_18 = gcd(i, j);
			//add %19 = %3, %18 : int
			_19=sum+_18;
			//assign %3 = %19  : int
			sum = _19;
			//const %20 = 1 : int
			_20 = 1;
			//add %21 = %5, %20 : int
			_21=j+_20;
			//assign %5 = %21  : int
			j = _21;
//.blklab11
blklab11:;
		}
//.blklab10
blklab10:;
		//const %22 = 1 : int
		_22 = 1;
		//add %23 = %4, %22 : int
		_23=i+_22;
		//assign %4 = %23  : int
		i = _23;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [83,117,109,58,32] : int[]
	_FREE(_26);
	_NEW_ARRAY(_26, 5);
	_26[0] = 83; _26[1] = 117; _26[2] = 109; _26[3] = 58; _26[4] = 32; 
	_ADD_OWNERSHIP(_26);
	//indirectinvoke () = %25 (%26) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_26));
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %28 (%3) : method(any)->()
	printf("%lld\n", sum);
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = [80,97,115,115,32,69,117,99,108,105,100,32,71,67,68,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_31);
	_NEW_ARRAY(_31, 25);
	_31[0] = 80; _31[1] = 97; _31[2] = 115; _31[3] = 115; _31[4] = 32; _31[5] = 69; _31[6] = 117; _31[7] = 99; _31[8] = 108; _31[9] = 105; _31[10] = 100; _31[11] = 32; _31[12] = 71; _31[13] = 67; _31[14] = 68; _31[15] = 32; _31[16] = 116; _31[17] = 101; _31[18] = 115; _31[19] = 116; _31[20] = 32; _31[21] = 99; _31[22] = 97; _31[23] = 115; _31[24] = 101; 
	_ADD_OWNERSHIP(_31);
	//indirectinvoke () = %30 (%31) : method(int[])->()
	println_s(_31, _31_size);
//.blklab7
blklab7:;
	//return
	_FREE2DArray(_7);
	_FREE(_9);
	_FREE(_12);
	_FREE(_26);
	_FREE(_31);
	exit(0);
}

