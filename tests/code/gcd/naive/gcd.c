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

long long* gcd_array(_DECL_1DARRAY_PARAM(data), long long n){
	_DECL_1DARRAY(_2);
	_DECL_1DARRAY(gcds);
	long long i = 0;
	long long j = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
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
	_GEN_1DARRAY(_8, _7, _6);
	//assign %3 = %8  : int[]
	_1DARRAY_COPY(gcds, _8);
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
	return gcds;
	//return
}

long long* init(long long n){
	_DECL_1DARRAY(_1);
	_DECL_1DARRAY(data);
	long long i = 0;
	long long _4 = 0;
	_DECL_1DARRAY(_5);
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//arraygen %5 = [4; 0] : int[]
	_GEN_1DARRAY(_5, n, _4);
	//assign %2 = %5  : int[]
	_1DARRAY_COPY(data, _5);
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
	return data;
	//return
}

int main(int argc, char** args){
	long long n = 0;
	_DECL_1DARRAY(data);
	_DECL_1DARRAY(gcds);
	long long sum = 0;
	long long i = 0;
	long long j = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_1DARRAY(_9);
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	void* _13;
	_DECL_1DARRAY(_15);
	void* _16;
	long long _18 = 0;
	void* _19;
	_DECL_1DARRAY(_21);
	void* _22;
	long long _24 = 0;
	void* _25;
	_DECL_1DARRAY(_27);
	void* _28;
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
	void* _41;
	_DECL_1DARRAY(_43);
	void* _44;
	long long _46 = 0;
	//const %7 = 10 : int
	_7 = 10;
	//assign %1 = %7  : int
	n = _7;
	//invoke (%8) = (%1) gcd:init : function(int)->(int[])
	_8 = init(n);
	//assign %2 = %8  : int[]
	_1DARRAY_COPY(data, _8);
	//invoke (%9) = (%2, %1) gcd:gcd_array : function(int[],int)->(int[])
	_1DARRAY_SIZE(_9, data);
	_9 = gcd_array(_1DARRAY_COPY_PARAM(data), n);
	//assign %3 = %9  : int[]
	_1DARRAY_COPY(gcds, _9);
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	sum = _10;
	//const %11 = 0 : int
	_11 = 0;
	//assign %5 = %11  : int
	i = _11;
	//loop (%4, %5, %6, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40)
	while(true){
		//ifge %5, %1 goto blklab13 : int
		if(i>=n){goto blklab13;}
		//const %12 = 0 : int
		_12 = 0;
		//assign %6 = %12  : int
		j = _12;
		//loop (%4, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
		while(true){
			//ifge %6, %1 goto blklab15 : int
			if(j>=n){goto blklab15;}
			//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %15 = [78,117,109,98,101,114,58,32] : int[]
			_NEW_ARRAY(_15, 8);
			_15[0] = 78; _15[1] = 117; _15[2] = 109; _15[3] = 98; _15[4] = 101; _15[5] = 114; _15[6] = 58; _15[7] = 32; 
			//indirectinvoke () = %14 (%15) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_15));
			//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %17 = %16 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %18 = %2, %5 : int[]
			_18=data[i];
			//indirectinvoke () = %17 (%18) : method(any)->()
			printf("%lld", _18);
			//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %20 = %19 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %21 = [32,78,117,109,98,101,114,58,32] : int[]
			_NEW_ARRAY(_21, 9);
			_21[0] = 32; _21[1] = 78; _21[2] = 117; _21[3] = 109; _21[4] = 98; _21[5] = 101; _21[6] = 114; _21[7] = 58; _21[8] = 32; 
			//indirectinvoke () = %20 (%21) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_21));
			//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %23 = %22 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %24 = %2, %6 : int[]
			_24=data[j];
			//indirectinvoke () = %23 (%24) : method(any)->()
			printf("%lld", _24);
			//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %26 = %25 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %27 = [32,71,67,68,58] : int[]
			_NEW_ARRAY(_27, 5);
			_27[0] = 32; _27[1] = 71; _27[2] = 67; _27[3] = 68; _27[4] = 58; 
			//indirectinvoke () = %26 (%27) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_27));
			//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %29 = %28 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//mul %30 = %5, %1 : int
			_30=i*n;
			//add %31 = %30, %6 : int
			_31=_30+j;
			//indexof %32 = %3, %31 : int[]
			_32=gcds[_31];
			//indirectinvoke () = %29 (%32) : method(any)->()
			printf("%lld\n", _32);
			//mul %33 = %5, %1 : int
			_33=i*n;
			//add %34 = %33, %6 : int
			_34=_33+j;
			//indexof %35 = %3, %34 : int[]
			_35=gcds[_34];
			//add %36 = %4, %35 : int
			_36=sum+_35;
			//assign %4 = %36  : int
			sum = _36;
			//const %37 = 1 : int
			_37 = 1;
			//add %38 = %6, %37 : int
			_38=j+_37;
			//assign %6 = %38  : int
			j = _38;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
		//const %39 = 1 : int
		_39 = 1;
		//add %40 = %5, %39 : int
		_40=i+_39;
		//assign %5 = %40  : int
		i = _40;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %43 = [83,117,109,58,32] : int[]
	_NEW_ARRAY(_43, 5);
	_43[0] = 83; _43[1] = 117; _43[2] = 109; _43[3] = 58; _43[4] = 32; 
	//indirectinvoke () = %42 (%43) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_43));
	//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %45 = %44 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %45 (%4) : method(any)->()
	printf("%lld", sum);
	//assert
	{
		//const %46 = 235 : int
		_46 = 235;
		//ifeq %4, %46 goto blklab17 : int
		if(sum==_46){goto blklab17;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab17
blklab17:;
	//assert
	}
	//return
	exit(0);
}

