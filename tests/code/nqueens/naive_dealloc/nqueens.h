#include "Util.h"
typedef struct{
	long long r;
	long long c;
} POS;
void printf_POS(POS* _pos);
POS* copy_POS(POS* _pos);
void free_POS(POS* _pos);
long long conflict(POS* p, _DECL_OWNERSHIP_PARAM(p), long long row, long long col);
long long run(POS** queens, long long queens_size, _DECL_OWNERSHIP_PARAM(queens), long long n, long long dim);
int main(int argc, char** args);