#include "Util.h"
#include "WyRT.h"
#define ONE_CENT 0
#define FIVE_CENTS 1
#define TEN_CENTS 2
#define TWENTY_CENTS 3
#define FIFTY_CENTS 4
#define ONE_DOLLAR 5
#define FIVE_DOLLARS 6
#define TEN_DOLLARS 7
#define Value [1,5,10,20,50,100,500,1000]
#define Descriptions [[49,99],[53,99],[49,48,99],[50,48,99],[53,48,99],[36,49],[36,53],[36,49,48]]
typedef int64_t nat;
typedef int64_t* Cash;
int64_t* _Cash_(_DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int64_t* _Cash_1_(_DECL_1DARRAY_PARAM(coins), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int64_t _total_(_DECL_1DARRAY_PARAM(c));
int64_t _contained_(_DECL_1DARRAY_PARAM(first), _DECL_1DARRAY_PARAM(second));
int64_t* _add_(_DECL_1DARRAY_PARAM(first), _DECL_1DARRAY_PARAM(second), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int64_t* _subtract_(_DECL_1DARRAY_PARAM(first), _DECL_1DARRAY_PARAM(second), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int64_t* _calculateChange_(_DECL_1DARRAY_PARAM(till), int64_t change, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int64_t* _toString_(_DECL_1DARRAY_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int64_t* _buy_(FILE* console, _DECL_1DARRAY_PARAM(till), _DECL_1DARRAY_PARAM(given), int64_t cost, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int main(int argc, char** args);
