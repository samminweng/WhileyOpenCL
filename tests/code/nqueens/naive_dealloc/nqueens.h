#include "Util.h"
typedef struct{
	long long r;
	long long c;
} POS;
void printf_POS(POS* _pos);
POS* copy_POS(POS* _pos);
void free_POS(POS* _pos);
long long conflict(POS* p, _DECL_OWNERSHIP_PARAM(p), long long row, long long col);
