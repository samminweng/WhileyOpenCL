#include "Util.h"
#include "WyRT.h"
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
bool _conflict_(POS* p, _DECL_DEALLOC_PARAM(p), int64_t row, int64_t col);
NQueen* _run_(NQueen* nq, _DECL_DEALLOC_PARAM(nq), int64_t n, int64_t dim);
int main(int argc, char** args);