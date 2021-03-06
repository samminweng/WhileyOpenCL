#include "Util.h"
typedef struct{
	int64_t r;
	int64_t c;
} POS;
void printf_POS(POS* _pos);
POS* copy_POS(POS* _pos);
void free_POS(POS* _pos);
int64_t conflict(POS* p, _DECL_DEALLOC_PARAM(p), int64_t row, int64_t col);
int64_t run(POS** queens, size_t queens_size, _DECL_DEALLOC_PARAM(queens), int64_t n, int64_t dim);
int main(int argc, char** args);
