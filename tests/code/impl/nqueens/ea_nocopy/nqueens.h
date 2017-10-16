#include "Util.h"
#include "WyRT.h"
typedef struct{
	int64_t r;
	int64_t c;
} POS;
void printf_POS(POS* _pos);
POS* copy_POS(POS* _pos);
void free_POS(POS* _pos);
bool _conflict_(POS* p, int64_t row, int64_t col);
int64_t _run_(POS** queens, size_t queens_size, int64_t n, int64_t dim);
int main(int argc, char** args);
