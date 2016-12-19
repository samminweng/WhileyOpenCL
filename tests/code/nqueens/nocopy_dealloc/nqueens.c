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
NQueen* _nqueen_(int64_t num_solutions, POS** queens, size_t queens_size, _DECL_DEALLOC_PARAM(queens)){
	NQueen* nq;
	_DECL_DEALLOC(nq);
	NQueen* _3;
	_DECL_DEALLOC(_3);
	//newrecord %3 = (%0, %1) : {int num_solutions,{int c,int r}[] queens}
	_DEALLOC_STRUCT(_3, NQueen);
	_3 = malloc(sizeof(NQueen));
	_3->num_solutions = num_solutions;
	_UPDATE_1DARRAY(_3->queens, queens);
	_REMOVE_DEALLOC(queens);
	_ADD_DEALLOC(_3);
	//return %3
	_DEALLOC_1DARRAY_STRUCT(queens, POS);
	_DEALLOC_STRUCT(nq, NQueen);
	return _3;
	//return
}

int64_t _conflict_(POS* p, _DECL_DEALLOC_PARAM(p), int64_t row, int64_t col){
	int64_t _3;
	int64_t r = 0;
	int64_t c = 0;
	int64_t colDiff = 0;
	int64_t rowDiff = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15;
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
	_DEALLOC_STRUCT(p, POS);
	return _15;
	//return
}

