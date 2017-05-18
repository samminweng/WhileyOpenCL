#include "Util.h"
#include "WyRT.h"
typedef int64_t nat;
typedef struct{
	int64_t len;
	_DECL_1DARRAY_MEMBER_BYTE(items);
} MyArrayList;
void printf_MyArrayList(MyArrayList* _myarraylist);
MyArrayList* copy_MyArrayList(MyArrayList* _myarraylist);
void free_MyArrayList(MyArrayList* _myarraylist);
MyArrayList* _opt_append_(MyArrayList* list, _DECL_DEALLOC_PARAM(list), BYTE item);
BYTE* _resize_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int main(int argc, char** args);
