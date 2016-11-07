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
NQueen* nqueen(int64_t num_solutions, POS** queens, size_t queens_size);
int64_t conflict(POS* p, int64_t row, int64_t col);
NQueen* run(NQueen* nq, int64_t n, int64_t dim);
int main(int argc, char** args);
