#include "Util.h"
typedef struct{
	long long r;
	long long c;
} POS;
void printf_POS(POS* _pos);
POS* copy_POS(POS* _pos);
void free_POS(POS* _pos);
typedef struct{
	POS** queens;
	long long queens_size;
	long long num_solutions;
} NQueen;
void printf_NQueen(NQueen* _nqueen);
NQueen* copy_NQueen(NQueen* _nqueen);
void free_NQueen(NQueen* _nqueen);
NQueen* nqueen(long long num_solutions, POS** queens, long long queens_size);
long long conflict(POS* p, long long row, long long col);
NQueen* run(NQueen* nq, long long n, long long dim);
int main(int argc, char** args);
