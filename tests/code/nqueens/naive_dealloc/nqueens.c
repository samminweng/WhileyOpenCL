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
NQueen* copy_NQueen(NQueen* _NQueen){
	NQueen* new_NQueen = malloc(sizeof(NQueen));
	_COPY_1DARRAY_STRUCT(new_NQueen->queens, _NQueen->queens, POS);
	new_NQueen->num_solutions = _NQueen->num_solutions;
	return new_NQueen;
}
NQueen** copy_array_NQueen(NQueen** _NQueen, long long _NQueen_size){
	NQueen** new_NQueen = malloc(_NQueen_size*sizeof(NQueen*));
	for(int i=0;i<_NQueen_size;i++){
		new_NQueen[i] = copy_NQueen(_NQueen[i]);
	}
	return new_NQueen;
}
void free_NQueen(NQueen* nqueen){
	_FREE_1DARRAY_STRUCT(nqueen->queens, POS);
	free(nqueen);
}
void printf_NQueen(NQueen* nqueen){
	printf("{");
	printf(" queens:");
	_PRINT_1DARRAY_STRUCT(POS,nqueen->queens);
	printf(" num_solutions:");
	printf("%lld", nqueen->num_solutions);
	printf("}");
}
NQueen* nqueen(long long num_solutions, POS** queens, long long queens_size, _DECL_DEALLOC_PARAM(queens)){
	NQueen* nq;
	_DECL_DEALLOC(nq);
	NQueen* _3;
	_DECL_DEALLOC(_3);
	//newrecord %3 = (%0, %1) : {int num_solutions,{int c,int r}[] queens}
	_DEALLOC_STRUCT(_3, NQueen);
	_3 = malloc(sizeof(NQueen));
	_3->num_solutions = num_solutions;
	_COPY_1DARRAY_STRUCT(_3->queens, queens, POS);
	_ADD_DEALLOC(_3);
	//return %3
	_DEALLOC_1DARRAY_STRUCT(queens, POS);
	_DEALLOC_STRUCT(nq, NQueen);
	return _3;
	//return
}

long long conflict(POS* p, _DECL_DEALLOC_PARAM(p), long long row, long long col){
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
	_DEALLOC_STRUCT(p, POS);
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
	_DEALLOC_STRUCT(p, POS);
	return _15;
	//return
}

NQueen* run(NQueen* nq, _DECL_DEALLOC_PARAM(nq), long long n, long long dim){
	NQueen* _3;
	_DECL_DEALLOC(_3);
	long long col = 0;
	long long isSolution;
	long long i = 0;
	POS* p;
	_DECL_DEALLOC(p);
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	POS** _12;
	long long _12_size = 0;
	_DECL_DEALLOC(_12);
	long long _13 = 0;
	POS** _14;
	long long _14_size = 0;
	_DECL_DEALLOC(_14);
	long long _15 = 0;
	long long _16;
	long long _17 = 0;
	POS** _18;
	long long _18_size = 0;
	_DECL_DEALLOC(_18);
	long long _19 = 0;
	long long _20 = 0;
	POS** _21;
	long long _21_size = 0;
	_DECL_DEALLOC(_21);
	long long _22 = 0;
	POS** _23;
	long long _23_size = 0;
	_DECL_DEALLOC(_23);
	POS* _24;
	_DECL_DEALLOC(_24);
	long long _25;
	long long _26;
	long long _27;
	long long _28;
	long long _29 = 0;
	long long _30 = 0;
	long long _31;
	POS* _32;
	_DECL_DEALLOC(_32);
	NQueen* _33;
	_DECL_DEALLOC(_33);
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	//ifne %2, %1 goto blklab6 : int
	if(dim!=n){goto blklab6;}
	//fieldload %8 = %0 num_solutions : {int num_solutions,{int c,int r}[] queens}
	_8 = nq->num_solutions;
	//const %9 = 1 : int
	_9 = 1;
	//add %10 = %8, %9 : int
	_10=_8+_9;
	//update %0.num_solutions = %10 : {int num_solutions,{int c,int r}[] queens} -> {int num_solutions,{int c,int r}[] queens}
	nq->num_solutions = _10;
	//return %0
	_DEALLOC_STRUCT(_3, NQueen);
	_DEALLOC_STRUCT(p, POS);
	_DEALLOC_1DARRAY_STRUCT(_12, POS);
	_DEALLOC_1DARRAY_STRUCT(_14, POS);
	_DEALLOC_1DARRAY_STRUCT(_18, POS);
	_DEALLOC_1DARRAY_STRUCT(_21, POS);
	_DEALLOC_1DARRAY_STRUCT(_23, POS);
	_DEALLOC_STRUCT(_24, POS);
	_DEALLOC_STRUCT(_32, POS);
	_DEALLOC_STRUCT(_33, NQueen);
	return nq;
	//goto blklab7
	goto blklab7;
//.blklab6
blklab6:;
	//const %11 = 0 : int
	_11 = 0;
	//assign %4 = %11  : int
	col = _11;
	//loop (%0, %4, %5, %6, %7, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37)
	while(true){
		//invariant
		{
			//fieldload %12 = %0 queens : {int num_solutions,{int c,int r}[] queens}
			_DEALLOC_1DARRAY_STRUCT(_12, POS);
			_UPDATE_1DARRAY(_12, nq->queens);
			_REMOVE_DEALLOC(_12);
			//lengthof %13 = %12 : {int c,int r}[]
			_13 = _12_size;
			//ifge %1, %13 goto blklab11 : int
			if(n>=_13){goto blklab11;}
			//fieldload %14 = %0 queens : {int num_solutions,{int c,int r}[] queens}
			_DEALLOC_1DARRAY_STRUCT(_14, POS);
			_UPDATE_1DARRAY(_14, nq->queens);
			_REMOVE_DEALLOC(_14);
			//lengthof %15 = %14 : {int c,int r}[]
			_15 = _14_size;
			//ifeq %2, %15 goto blklab10 : int
			if(dim==_15){goto blklab10;}
//.blklab11
blklab11:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab10
blklab10:;
		//invariant
		}
		//ifge %4, %2 goto blklab8 : int
		if(col>=dim){goto blklab8;}
		//const %16 = true : bool
		_16 = true;
		//assign %5 = %16  : bool
		isSolution = _16;
		//const %17 = 0 : int
		_17 = 0;
		//assign %6 = %17  : int
		i = _17;
		//loop (%5, %6, %7, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
		while(true){
			//invariant
			{
				//fieldload %18 = %0 queens : {int num_solutions,{int c,int r}[] queens}
				_DEALLOC_1DARRAY_STRUCT(_18, POS);
				_UPDATE_1DARRAY(_18, nq->queens);
				_REMOVE_DEALLOC(_18);
				//lengthof %19 = %18 : {int c,int r}[]
				_19 = _18_size;
				//ifge %1, %19 goto blklab15 : int
				if(n>=_19){goto blklab15;}
				//const %20 = 0 : int
				_20 = 0;
				//iflt %6, %20 goto blklab16 : int
				if(i<_20){goto blklab16;}
				//fieldload %21 = %0 queens : {int num_solutions,{int c,int r}[] queens}
				_DEALLOC_1DARRAY_STRUCT(_21, POS);
				_UPDATE_1DARRAY(_21, nq->queens);
				_REMOVE_DEALLOC(_21);
				//lengthof %22 = %21 : {int c,int r}[]
				_22 = _21_size;
				//ifeq %2, %22 goto blklab14 : int
				if(dim==_22){goto blklab14;}
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
			//ifge %6, %1 goto blklab12 : int
			if(i>=n){goto blklab12;}
			//fieldload %23 = %0 queens : {int num_solutions,{int c,int r}[] queens}
			_DEALLOC_1DARRAY_STRUCT(_23, POS);
			_UPDATE_1DARRAY(_23, nq->queens);
			_REMOVE_DEALLOC(_23);
			//indexof %24 = %23, %6 : {int c,int r}[]
			_24=_23[i];
			_REMOVE_DEALLOC(_24);
			//assign %7 = %24  : {int c,int r}
			_DEALLOC_STRUCT(p, POS);
			p = copy_POS(_24);
			_ADD_DEALLOC(p);
			//const %25 = true : bool
			_25 = true;
			//ifeq %5, %25 goto blklab20 : bool
			if(isSolution==_25){goto blklab20;}
			//goto blklab19
			goto blklab19;
//.blklab20
blklab20:;
			//invoke (%26) = (%7, %1, %4) nqueens:conflict : function(nqueens:POS,int,int)->(bool)
			{
				void* p_tmp;
				_26 = conflict(p_tmp = _COPY_STRUCT_PARAM(p, POS), true, n, col);
				_CALLEE_DEALLOC(p, "false-false-false");
			}
			//const %27 = true : bool
			_27 = true;
			//ifeq %26, %27 goto blklab21 : bool
			if(_26==_27){goto blklab21;}
			//goto blklab17
			goto blklab17;
//.blklab21
blklab21:;
//.blklab19
blklab19:;
			//const %28 = false : bool
			_28 = false;
			//goto blklab18
			goto blklab18;
//.blklab17
blklab17:;
			//const %28 = true : bool
			_28 = true;
//.blklab18
blklab18:;
			//assign %5 = %28  : bool
			isSolution = _28;
			//const %29 = 1 : int
			_29 = 1;
			//add %30 = %6, %29 : int
			_30=i+_29;
			//assign %6 = %30  : int
			i = _30;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %31 = true : bool
		_31 = true;
		//ifne %5, %31 goto blklab22 : bool
		if(isSolution!=_31){goto blklab22;}
		//newrecord %32 = (%4, %1) : {int c,int r}
		_DEALLOC_STRUCT(_32, POS);
		_32 = malloc(sizeof(POS));
		_32->c = col;
		_32->r = n;
		_ADD_DEALLOC(_32);
		//update %0.queens[%1] = %32 : {int num_solutions,{int c,int r}[] queens} -> {int num_solutions,{int c,int r}[] queens}
		_DEALLOC_MEMBER_STRUCT_UPDATECODE(nq, nq->queens[n], POS);
		nq->queens[n] = _32;
		_REMOVE_DEALLOC(_32);
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %1, %34 : int
		_35=n+_34;
		//invoke (%33) = (%0, %35, %2) nqueens:run : function(nqueens:NQueen,int,int)->(nqueens:NQueen)
		{
			void* nq_tmp;
			_DEALLOC_STRUCT(_33, NQueen);
			_33 = run(nq_tmp = _COPY_STRUCT_PARAM(nq, NQueen), false, _35, dim);
			_CALLER_DEALLOC(_33, nq, "true-true-false");
			_ADD_DEALLOC(_33);
		}
		//assign %0 = %33  : {int num_solutions,{int c,int r}[] queens}
		_DEALLOC_STRUCT(nq, NQueen);
		nq = copy_NQueen(_33);
		_ADD_DEALLOC(nq);
//.blklab22
blklab22:;
		//const %36 = 1 : int
		_36 = 1;
		//add %37 = %4, %36 : int
		_37=col+_36;
		//assign %4 = %37  : int
		col = _37;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %0
	_DEALLOC_STRUCT(_3, NQueen);
	_DEALLOC_STRUCT(p, POS);
	_DEALLOC_1DARRAY_STRUCT(_12, POS);
	_DEALLOC_1DARRAY_STRUCT(_14, POS);
	_DEALLOC_1DARRAY_STRUCT(_18, POS);
	_DEALLOC_1DARRAY_STRUCT(_21, POS);
	_DEALLOC_1DARRAY_STRUCT(_23, POS);
	_DEALLOC_STRUCT(_24, POS);
	_DEALLOC_STRUCT(_32, POS);
	_DEALLOC_STRUCT(_33, NQueen);
	return nq;
//.blklab7
blklab7:;
	//return
}

int main(int argc, char** args){
	long long n = 0;
	POS** queens;
	long long queens_size = 0;
	_DECL_DEALLOC(queens);
	long long num_solutions = 0;
	NQueen* nq;
	_DECL_DEALLOC(nq);
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	POS* _8;
	_DECL_DEALLOC(_8);
	POS** _9;
	long long _9_size = 0;
	_DECL_DEALLOC(_9);
	long long _10 = 0;
	NQueen* _11;
	_DECL_DEALLOC(_11);
	NQueen* _12;
	_DECL_DEALLOC(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	void* _19;
	_DECL_1DARRAY(_21);
	_DECL_DEALLOC(_21);
	void* _22;
	void* _24;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	void* _27;
	long long _29 = 0;
	void* _30;
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	//const %5 = 8 : int
	_5 = 8;
	//assign %1 = %5  : int
	n = _5;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//newrecord %8 = (%6, %7) : {int c,int r}
	_DEALLOC_STRUCT(_8, POS);
	_8 = malloc(sizeof(POS));
	_8->c = _6;
	_8->r = _7;
	_ADD_DEALLOC(_8);
	//arraygen %9 = [8; 1] : {int c,int r}[]
	_DEALLOC_1DARRAY_STRUCT(_9, POS);
	_NEW_1DARRAY_STRUCT(_9, n, _8, POS);
	_ADD_DEALLOC(_9);
	//assign %2 = %9  : {int c,int r}[]
	_DEALLOC_1DARRAY_STRUCT(queens, POS);
	_COPY_1DARRAY_STRUCT(queens, _9, POS);
	_ADD_DEALLOC(queens);
	//const %10 = 0 : int
	_10 = 0;
	//assign %3 = %10  : int
	num_solutions = _10;
	//invoke (%11) = (%3, %2) nqueens:nqueen : function(int,nqueens:POS[])->(nqueens:NQueen)
	{
		void* queens_tmp;
		_DEALLOC_STRUCT(_11, NQueen);
		_11 = nqueen(num_solutions, queens_tmp = copy_array_POS(queens, queens_size), queens_size, true);
		_CALLEE_DEALLOC(queens, "false-false-false");
		_ADD_DEALLOC(_11);
	}
	//assign %4 = %11  : {int num_solutions,{int c,int r}[] queens}
	_DEALLOC_STRUCT(nq, NQueen);
	nq = copy_NQueen(_11);
	_ADD_DEALLOC(nq);
	//const %13 = 0 : int
	_13 = 0;
	//invoke (%12) = (%4, %13, %1) nqueens:run : function(nqueens:NQueen,int,int)->(nqueens:NQueen)
	{
		void* nq_tmp;
		_DEALLOC_STRUCT(_12, NQueen);
		_12 = run(nq_tmp = _COPY_STRUCT_PARAM(nq, NQueen), false, _13, n);
		_CALLER_DEALLOC(_12, nq, "true-true-false");
		_ADD_DEALLOC(_12);
	}
	//assign %4 = %12  : {int num_solutions,{int c,int r}[] queens}
	_DEALLOC_STRUCT(nq, NQueen);
	nq = copy_NQueen(_12);
	_ADD_DEALLOC(nq);
	//assert
	{
		//fieldload %14 = %4 num_solutions : {int num_solutions,{int c,int r}[] queens}
		_14 = nq->num_solutions;
		//const %15 = 92 : int
		_15 = 92;
		//ifeq %14, %15 goto blklab23 : int
		if(_14==_15){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = [78,45,81,117,101,101,110,32,80,114,111,98,108,101,109,32,111,110,32,97,32,78,32,88,32,78,32,66,111,97,114,100,46] : int[]
	_DEALLOC(_18);
	_NEW_1DARRAY(_18, 33, 0, T_INT);
	_18[0] = 78; _18[1] = 45; _18[2] = 81; _18[3] = 117; _18[4] = 101; _18[5] = 101; _18[6] = 110; _18[7] = 32; _18[8] = 80; _18[9] = 114; _18[10] = 111; _18[11] = 98; _18[12] = 108; _18[13] = 101; _18[14] = 109; _18[15] = 32; _18[16] = 111; _18[17] = 110; _18[18] = 32; _18[19] = 97; _18[20] = 32; _18[21] = 78; _18[22] = 32; _18[23] = 88; _18[24] = 32; _18[25] = 78; _18[26] = 32; _18[27] = 66; _18[28] = 111; _18[29] = 97; _18[30] = 114; _18[31] = 100; _18[32] = 46; 
	_ADD_DEALLOC(_18);
	//indirectinvoke () = %17 (%18) : method(int[])->()
	println_s(_18, _18_size);
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %21 = [78,32,61,32] : int[]
	_DEALLOC(_21);
	_NEW_1DARRAY(_21, 4, 0, T_INT);
	_21[0] = 78; _21[1] = 32; _21[2] = 61; _21[3] = 32; 
	_ADD_DEALLOC(_21);
	//indirectinvoke () = %20 (%21) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_21));
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %23 (%1) : method(any)->()
	printf("%lld\n", n);
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [70,111,117,110,100,32] : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY(_26, 6, 0, T_INT);
	_26[0] = 70; _26[1] = 111; _26[2] = 117; _26[3] = 110; _26[4] = 100; _26[5] = 32; 
	_ADD_DEALLOC(_26);
	//indirectinvoke () = %25 (%26) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_26));
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %29 = %4 num_solutions : {int num_solutions,{int c,int r}[] queens}
	_29 = nq->num_solutions;
	//indirectinvoke () = %28 (%29) : method(any)->()
	printf("%lld", _29);
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %32 = [32,115,111,108,117,116,105,111,110,115,46] : int[]
	_DEALLOC(_32);
	_NEW_1DARRAY(_32, 11, 0, T_INT);
	_32[0] = 32; _32[1] = 115; _32[2] = 111; _32[3] = 108; _32[4] = 117; _32[5] = 116; _32[6] = 105; _32[7] = 111; _32[8] = 110; _32[9] = 115; _32[10] = 46; 
	_ADD_DEALLOC(_32);
	//indirectinvoke () = %31 (%32) : method(int[])->()
	println_s(_32, _32_size);
	//return
	_DEALLOC_1DARRAY_STRUCT(queens, POS);
	_DEALLOC_STRUCT(nq, NQueen);
	_DEALLOC_STRUCT(_8, POS);
	_DEALLOC_1DARRAY_STRUCT(_9, POS);
	_DEALLOC_STRUCT(_11, NQueen);
	_DEALLOC_STRUCT(_12, NQueen);
	_DEALLOC(_18);
	_DEALLOC(_21);
	_DEALLOC(_26);
	_DEALLOC(_32);
	exit(0);
}

