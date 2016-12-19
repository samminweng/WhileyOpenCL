#include "Util.h"
typedef struct{
	int64_t r;
	int64_t c;
} POS;
void printf_POS(POS* _pos);
POS* copy_POS(POS* _pos);
void free_POS(POS* _pos);
typedef struct{
	POS** queens;
	size_t queens_size;
	int64_t num_solutions;
} NQueen;
void printf_NQueen(NQueen* _nqueen);
NQueen* copy_NQueen(NQueen* _nqueen);
void free_NQueen(NQueen* _nqueen);
NQueen* _nqueen_(int64_t num_solutions, POS** queens, size_t queens_size, _DECL_DEALLOC_PARAM(queens));
int64_t _conflict_(POS* p, _DECL_DEALLOC_PARAM(p), int64_t row, int64_t col);
