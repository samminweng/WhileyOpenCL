#include "Util.h"
#include "WyRT.h"
typedef int64_t nat;
typedef struct{
	int64_t len;
	int64_t offset;
} Match;
void printf_Match(Match* _match);
Match* copy_Match(Match* _match);
void free_Match(Match* _match);
int64_t _match_(BYTE* data, size_t data_size, int64_t offset, int64_t end);
Match* _findLongestMatch_(BYTE* data, size_t data_size, int64_t pos);
BYTE* _append_(BYTE* items, size_t items_size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
BYTE* _resize_(BYTE* items, size_t items_size, int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
BYTE* null(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int main(int argc, char** args);
