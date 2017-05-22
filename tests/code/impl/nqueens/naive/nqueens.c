#include "nqueens.h"
POS* copy_POS(POS* _POS){
	POS* new_POS = malloc(sizeof(POS));
	new_POS->r = _POS->r;
	new_POS->c = _POS->c;
	return new_POS;
}
POS** copy_array_POS(POS** _POS, size_t _POS_size){
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
	printf("%"PRId64, pos->r);
	printf(" c:");
	printf("%"PRId64, pos->c);
	printf("}");
}
NQueen* copy_NQueen(NQueen* _NQueen){
	NQueen* new_NQueen = malloc(sizeof(NQueen));
	_COPY_1DARRAY_STRUCT(new_NQueen->queens, _NQueen->queens, POS);
	new_NQueen->num_solutions = _NQueen->num_solutions;
	return new_NQueen;
}
NQueen** copy_array_NQueen(NQueen** _NQueen, size_t _NQueen_size){
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
	printf("%"PRId64, nqueen->num_solutions);
	printf("}");
}
NQueen* _nqueen_(int64_t num_solutions, POS** queens, size_t queens_size){
	NQueen* nq;
	NQueen* _3;
	//newrecord %3 = (%0, %1) : {int num_solutions,{int c,int r}[] queens}
	_3 = malloc(sizeof(NQueen));
	_3->num_solutions = num_solutions;
	_COPY_1DARRAY_STRUCT(_3->queens, queens, POS);
	//return %3
	return _3;
	//return
}

bool _conflict_(POS* p, int64_t row, int64_t col){
	bool _3;
	int64_t r = 0;
	int64_t c = 0;
	int64_t colDiff = 0;
	int64_t rowDiff = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	bool _10;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	bool _15;
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
	{
		_11 = llabs(_12);
	}
	//assign %6 = %11  : int
	colDiff = _11;
	//sub %14 = %4, %1 : int
	_14=r-row;
	//invoke (%13) = (%14) whiley/lang/Math:abs : function(int)->(int)
	{
		_13 = llabs(_14);
	}
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

NQueen* _run_(NQueen* nq, int64_t n, int64_t dim){
	NQueen* _3;
	int64_t col = 0;
	bool isSolution;
	int64_t i = 0;
	POS* p;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	POS** _12;
	size_t _12_size = 0;
	int64_t _13 = 0;
	POS** _14;
	size_t _14_size = 0;
	int64_t _15 = 0;
	bool _16;
	int64_t _17 = 0;
	POS** _18;
	size_t _18_size = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	POS** _21;
	size_t _21_size = 0;
	int64_t _22 = 0;
	POS** _23;
	size_t _23_size = 0;
	POS* _24;
	bool _25;
	bool _26;
	bool _27;
	bool _28;
	int64_t _29 = 0;
	int64_t _30 = 0;
	bool _31;
	POS* _32;
	NQueen* _33;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
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
			//ifge %6, %1 goto blklab12 : int
			if(i>=n){goto blklab12;}
			//fieldload %23 = %0 queens : {int num_solutions,{int c,int r}[] queens}
			_UPDATE_1DARRAY(_23, nq->queens);
			//indexof %24 = %23, %6 : {int c,int r}[]
			_24=_23[i];
			//assign %7 = %24  : {int c,int r}
			p = copy_POS(_24);
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
				_26 = _conflict_(_COPY_STRUCT_PARAM(p, POS), n, col);
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
		_32 = malloc(sizeof(POS));
		_32->c = col;
		_32->r = n;
		//update %0.queens[%1] = %32 : {int num_solutions,{int c,int r}[] queens} -> {int num_solutions,{int c,int r}[] queens}
		nq->queens[n] = _32;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %1, %34 : int
		_35=n+_34;
		//invoke (%33) = (%0, %35, %2) nqueens:run : function(nqueens:NQueen,int,int)->(nqueens:NQueen)
		{
			void* nq_tmp;
			_33 = _run_(_COPY_STRUCT_PARAM(nq, NQueen), _35, dim);
		}
		//assign %0 = %33  : {int num_solutions,{int c,int r}[] queens}
		nq = copy_NQueen(_33);
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
	return nq;
//.blklab7
blklab7:;
	//return
}

int main(int argc, char** args){
	int64_t n = 0;
	POS** queens;
	size_t queens_size = 0;
	int64_t num_solutions = 0;
	NQueen* nq;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	POS* _8;
	POS** _9;
	size_t _9_size = 0;
	int64_t _10 = 0;
	NQueen* _11;
	NQueen* _12;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	void* _19;
	_DECL_1DARRAY(_21);
	void* _22;
	void* _24;
	_DECL_1DARRAY(_26);
	void* _27;
	int64_t _29 = 0;
	void* _30;
	_DECL_1DARRAY(_32);
	//const %5 = 8 : int
	_5 = 8;
	//assign %1 = %5  : int
	n = _5;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//newrecord %8 = (%6, %7) : {int c,int r}
	_8 = malloc(sizeof(POS));
	_8->c = _6;
	_8->r = _7;
	//arraygen %9 = [8; 1] : {int c,int r}[]
	_NEW_1DARRAY_STRUCT(_9, n, _8, POS);
	//assign %2 = %9  : {int c,int r}[]
	_COPY_1DARRAY_STRUCT(queens, _9, POS);
	//const %10 = 0 : int
	_10 = 0;
	//assign %3 = %10  : int
	num_solutions = _10;
	//invoke (%11) = (%3, %2) nqueens:nqueen : function(int,nqueens:POS[])->(nqueens:NQueen)
	{
		void* queens_tmp;
		_11 = _nqueen_(num_solutions, _COPY_1DARRAY_PARAM_STRUCT(queens, POS));
	}
	//assign %4 = %11  : {int num_solutions,{int c,int r}[] queens}
	nq = copy_NQueen(_11);
	//const %13 = 0 : int
	_13 = 0;
	//invoke (%12) = (%4, %13, %1) nqueens:run : function(nqueens:NQueen,int,int)->(nqueens:NQueen)
	{
		void* nq_tmp;
		_12 = _run_(_COPY_STRUCT_PARAM(nq, NQueen), _13, n);
	}
	//assign %4 = %12  : {int num_solutions,{int c,int r}[] queens}
	nq = copy_NQueen(_12);
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
	_NEW_1DARRAY_int64_t(_18, 33, 0);
	_18[0] = 78; _18[1] = 45; _18[2] = 81; _18[3] = 117; _18[4] = 101; _18[5] = 101; _18[6] = 110; _18[7] = 32; _18[8] = 80; _18[9] = 114; _18[10] = 111; _18[11] = 98; _18[12] = 108; _18[13] = 101; _18[14] = 109; _18[15] = 32; _18[16] = 111; _18[17] = 110; _18[18] = 32; _18[19] = 97; _18[20] = 32; _18[21] = 78; _18[22] = 32; _18[23] = 88; _18[24] = 32; _18[25] = 78; _18[26] = 32; _18[27] = 66; _18[28] = 111; _18[29] = 97; _18[30] = 114; _18[31] = 100; _18[32] = 46; 
	//indirectinvoke () = %17 (%18) : method(int[])->()
	{
		println_s(_18, _18_size);
	}
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %21 = [78,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_21, 4, 0);
	_21[0] = 78; _21[1] = 32; _21[2] = 61; _21[3] = 32; 
	//indirectinvoke () = %20 (%21) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_21));
	}
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %23 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", n);
	}
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [70,111,117,110,100,32] : int[]
	_NEW_1DARRAY_int64_t(_26, 6, 0);
	_26[0] = 70; _26[1] = 111; _26[2] = 117; _26[3] = 110; _26[4] = 100; _26[5] = 32; 
	//indirectinvoke () = %25 (%26) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_26));
	}
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %29 = %4 num_solutions : {int num_solutions,{int c,int r}[] queens}
	_29 = nq->num_solutions;
	//indirectinvoke () = %28 (%29) : method(any)->()
	{
		printf("%"PRId64, _29);
	}
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %32 = [32,115,111,108,117,116,105,111,110,115,46] : int[]
	_NEW_1DARRAY_int64_t(_32, 11, 0);
	_32[0] = 32; _32[1] = 115; _32[2] = 111; _32[3] = 108; _32[4] = 117; _32[5] = 116; _32[6] = 105; _32[7] = 111; _32[8] = 110; _32[9] = 115; _32[10] = 46; 
	//indirectinvoke () = %31 (%32) : method(int[])->()
	{
		println_s(_32, _32_size);
	}
	//return
	exit(0);
}
