#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <cilk/cilk.h>
#include <cilk/cilk_api.h>

int fib(int n) {
  if (n < 2)
    return n;
  int a = cilk_spawn fib(n-1);
  int b = cilk_spawn fib(n-2);
  //int a = fib(n-1);
  //int b = fib(n-2);
  cilk_sync;
  return a + b;
}

int main(int argc, char *argv[]){
  if(argc<=1) {
        printf("Pass an integer as a command line argument...");
        exit(1);
     }  //otherwise continue on our merry way....

  int max=atoi(argv[1]);

  int result = fib(max);
  //assert(result == 832040);
  printf("Result %d\n", result);
  
  return 0;
} 
