#include "nqueens.h"
POS* copy_POS(POS* _POS){
	POS* new_POS = malloc(sizeof(POS));
	new_POS->r = _POS->r;
	new_POS->c = _POS->c;
	return new_POS;
}
POS** copy_array_POS(POS** _POS, long long _POS_size){
	POS** new_POS = malloc(_POS_size*sizeof(POS*));
	for(int i=0;i<_POS_size;i++){
		new_POS[i] = copy_POS(_POS[i]);
	}
	return new_POS;
}
void free_POS(POS* pos){
	free(pos);
}
void printf_POS(POS* pos){
	printf("{");
	printf(" r:");
	printf("%lld", pos->r);
	printf(" c:");
	printf("%lld", pos->c);
	printf("}");
}
long long conflict(POS* p, long long row, long long col){
	long long _3;
	long long r = 0;
	long long c = 0;
	long long colDiff = 0;
	long long rowDiff = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15;
	//fieldload %8 = %0 r : {int c,int r}
	_8 = p->r;
	//assign %4 = %8  : int
	r = _8;
	//fieldload %9 = %0 c : {int c,int r}
	_9 = p->c;
	//assign %5 = %9  : int
	c = _9;
	//ifeq %4, %1 goto blklab1 : int
	if(r==row){goto blklab1;}
	//ifne %5, %2 goto blklab0 : int
	if(c!=col){goto blklab0;}
//.blklab1
blklab1:;
	//const %10 = true : bool
	_10 = true;
	//return %10
	return _10;
//.blklab0
blklab0:;
	//sub %12 = %5, %2 : int
	_12=c-col;
	//invoke (%11) = (%12) whiley/lang/Math:abs : function(int)->(int)
	_11 = llabs(_12);
	//assign %6 = %11  : int
	colDiff = _11;
	//sub %14 = %4, %1 : int
	_14=r-row;
	//invoke (%13) = (%14) whiley/lang/Math:abs : function(int)->(int)
	_13 = llabs(_14);
	//assign %7 = %13  : int
	rowDiff = _13;
	//ifeq %6, %7 goto blklab2 : int
	if(colDiff==rowDiff){goto blklab2;}
	//const %15 = false : bool
	_15 = false;
	//goto blklab3
	goto blklab3;
//.blklab2
blklab2:;
	//const %15 = true : bool
	_15 = true;
//.blklab3
blklab3:;
	//return %15
	return _15;
	//return
}

long long run(POS** queens, long long queens_size, long long n, long long dim){
	long long _3 = 0;
	long long num_solutions = 0;
	long long col = 0;
	long long solution;
	long long i = 0;
	POS* p;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	POS* _19;
	long long _20;
	long long _21;
	long long _22;
	long long _23 = 0;
	long long _24 = 0;
	long long _25;
	POS* _26;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	//ifne %2, %1 goto blklab6 : int
	if(dim!=n){goto blklab6;}
	//const %9 = 1 : int
	_9 = 1;
	//return %9
	return _9;
	//goto blklab7
	goto blklab7;
//.blklab6
blklab6:;
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	num_solutions = _10;
	//const %11 = 0 : int
	_11 = 0;
	//assign %5 = %11  : int
	col = _11;
	//loop (%0, %4, %5, %6, %7, %8, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
	while(true){
		//invariant
		{
			//lengthof %12 = %0 : {int c,int r}[]
			_12 = queens_size;
			//ifge %1, %12 goto blklab11 : int
			if(n>=_12){goto blklab11;}
			//lengthof %13 = %0 : {int c,int r}[]
			_13 = queens_size;
			//ifeq %2, %13 goto blklab10 : int
			if(dim==_13){goto blklab10;}
//.blklab11
blklab11:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab10
blklab10:;
		//invariant
		}
		//ifge %5, %2 goto blklab8 : int
		if(col>=dim){goto blklab8;}
		//const %14 = true : bool
		_14 = true;
		//assign %6 = %14  : bool
		solution = _14;
		//const %15 = 0 : int
		_15 = 0;
		//assign %7 = %15  : int
		i = _15;
		//loop (%6, %7, %8, %16, %17, %18, %19, %20, %21, %22, %23, %24)
		while(true){
			//invariant
			{
				//lengthof %16 = %0 : {int c,int r}[]
				_16 = queens_size;
				//ifge %1, %16 goto blklab15 : int
				if(n>=_16){goto blklab15;}
				//const %17 = 0 : int
				_17 = 0;
				//iflt %7, %17 goto blklab16 : int
				if(i<_17){goto blklab16;}
				//lengthof %18 = %0 : {int c,int r}[]
				_18 = queens_size;
				//ifeq %2, %18 goto blklab14 : int
				if(dim==_18){goto blklab14;}
//.blklab16
blklab16:;
//.blklab15
blklab15:;
				//fail
				fprintf(stderr,"fail");
				exit(-1);
//.blklab14
blklab14:;
			//invariant
			}
			//ifge %7, %1 goto blklab12 : int
			if(i>=n){goto blklab12;}
			//indexof %19 = %0, %7 : {int c,int r}[]
			_19 = copy_POS(queens[i]);
			//assign %8 = %19  : {int c,int r}
			p = _19;
			//invoke (%20) = (%8, %1, %5) nqueens:conflict : function(nqueens:POS,int,int)->(bool)
			_20 = conflict(_STRUCT_PARAM(p), n, col);
			//const %21 = true : bool
			_21 = true;
			//ifeq %20, %21 goto blklab18 : bool
			if(_20==_21){goto blklab18;}
			//goto blklab17
			goto blklab17;
//.blklab18
blklab18:;
			//const %22 = false : bool
			_22 = false;
			//assign %6 = %22  : bool
			solution = _22;
			//goto blklab12
			goto blklab12;
//.blklab17
blklab17:;
			//const %23 = 1 : int
			_23 = 1;
			//add %24 = %7, %23 : int
			_24=i+_23;
			//assign %7 = %24  : int
			i = _24;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %25 = true : bool
		_25 = true;
		//ifne %6, %25 goto blklab19 : bool
		if(solution!=_25){goto blklab19;}
		//newrecord %26 = (%5, %1) : {int c,int r}
		_26 = malloc(sizeof(POS));
		_26->c = col;
		_26->r = n;
		//update %0[%1] = %26 : {int c,int r}[] -> {int c,int r}[]
		queens[n] = _26;
		//const %28 = 1 : int
		_28 = 1;
		//add %29 = %1, %28 : int
		_29=n+_28;
		//invoke (%27) = (%0, %29, %2) nqueens:run : function(nqueens:POS[],int,int)->(int)
		_27 = run(_1DARRAY_PARAM(queens), _29, dim);
		//add %30 = %4, %27 : int
		_30=num_solutions+_27;
		//assign %4 = %30  : int
		num_solutions = _30;
//.blklab19
blklab19:;
		//const %31 = 1 : int
		_31 = 1;
		//add %32 = %5, %31 : int
		_32=col+_31;
		//assign %5 = %32  : int
		col = _32;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %4
	return num_solutions;
//.blklab7
blklab7:;
	//return
}

int main(int argc, char** args){
	long long n = 0;
	POS** init;
	long long init_size = 0;
	long long num_solutions = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	POS* _7;
	POS** _8;
	long long _8_size = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	_DECL_1DARRAY(_17);
	void* _18;
	void* _20;
	_DECL_1DARRAY(_22);
	void* _23;
	void* _25;
	_DECL_1DARRAY(_27);
	//const %4 = 10 : int
	_4 = 10;
	//assign %1 = %4  : int
	n = _4;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//newrecord %7 = (%5, %6) : {int c,int r}
	_7 = malloc(sizeof(POS));
	_7->c = _5;
	_7->r = _6;
	//arraygen %8 = [7; 1] : {int c,int r}[]
	_8 = malloc(n*sizeof(POS*));
	for(int _8_i=0;_8_i<n;_8_i++){_8[_8_i] = copy_POS(_7);}
	_8_size = n;
	//assign %2 = %8  : {int c,int r}[]
	_1DARRAY_UPDATE(init, _8);
	//const %10 = 0 : int
	_10 = 0;
	//invoke (%9) = (%2, %10, %1) nqueens:run : function(nqueens:POS[],int,int)->(int)
	_9 = run(_1DARRAY_PARAM(init), _10, n);
	//assign %3 = %9  : int
	num_solutions = _9;
	//assert
	{
		//const %11 = 724 : int
		_11 = 724;
		//ifeq %3, %11 goto blklab20 : int
		if(num_solutions==_11){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [78,45,81,117,101,101,110,32,80,114,111,98,108,101,109,32,111,110,32,97,32,78,32,88,32,78,32,66,111,97,114,100,46] : int[]
	_NEW_ARRAY(_14, 33);
	_14[0] = 78; _14[1] = 45; _14[2] = 81; _14[3] = 117; _14[4] = 101; _14[5] = 101; _14[6] = 110; _14[7] = 32; _14[8] = 80; _14[9] = 114; _14[10] = 111; _14[11] = 98; _14[12] = 108; _14[13] = 101; _14[14] = 109; _14[15] = 32; _14[16] = 111; _14[17] = 110; _14[18] = 32; _14[19] = 97; _14[20] = 32; _14[21] = 78; _14[22] = 32; _14[23] = 88; _14[24] = 32; _14[25] = 78; _14[26] = 32; _14[27] = 66; _14[28] = 111; _14[29] = 97; _14[30] = 114; _14[31] = 100; _14[32] = 46; 
	//indirectinvoke () = %13 (%14) : method(int[])->()
	println_s(_1DARRAY_PARAM(_14));
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [78,32,61,32] : int[]
	_NEW_ARRAY(_17, 4);
	_17[0] = 78; _17[1] = 32; _17[2] = 61; _17[3] = 32; 
	//indirectinvoke () = %16 (%17) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_17));
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %19 (%1) : method(any)->()
	printf("%lld\n", n);
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [70,111,117,110,100,32] : int[]
	_NEW_ARRAY(_22, 6);
	_22[0] = 70; _22[1] = 111; _22[2] = 117; _22[3] = 110; _22[4] = 100; _22[5] = 32; 
	//indirectinvoke () = %21 (%22) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_22));
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %24 (%3) : method(any)->()
	printf("%lld", num_solutions);
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [32,115,111,108,117,116,105,111,110,115,46] : int[]
	_NEW_ARRAY(_27, 11);
	_27[0] = 32; _27[1] = 115; _27[2] = 111; _27[3] = 108; _27[4] = 117; _27[5] = 116; _27[6] = 105; _27[7] = 111; _27[8] = 110; _27[9] = 115; _27[10] = 46; 
	//indirectinvoke () = %26 (%27) : method(int[])->()
	println_s(_1DARRAY_PARAM(_27));
	//return
	exit(0);
}

