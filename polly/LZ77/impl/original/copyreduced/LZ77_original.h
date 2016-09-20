#include "Util.h"
typedef long long nat;
typedef struct{
	long long len;
	long long offset;
} Match;
void printf_Match(Match* _match);
Match* copy_Match(Match* _match);
void free_Match(Match* _match);
long long match(BYTE* data, long long data_size, long long offset, long long end);
Match* findLongestMatch(BYTE* data, long long data_size, long long pos);
BYTE* append_byte(BYTE* items, long long items_size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
BYTE* write_u1(BYTE* bytes, long long bytes_size, long long u1, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
BYTE* compress(BYTE* data, long long data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
BYTE* decompress(BYTE* data, long long data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int main(int argc, char** args);
