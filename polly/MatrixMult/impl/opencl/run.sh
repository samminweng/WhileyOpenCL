#!/bin/bash
### 
LIBCLC=$HOME/libclc
### Compile to LLVM IR
clang -Dcl_clang_storage_class_specifiers \
 -I $LIBCLC/generic/include \
 -include clc/clc.h \
 -target nvptx64-nvidia-nvcl \
 -x cl kernel.cl -emit-llvm -S -o kernel.ll
# ### Link kernel
llvm-link $LIBCLC/built_libs/nvptx--nvidiacl.bc kernel.ll -o kernel.linked.bc
# ### Compile to Ptx
clang -target nvptx64-nvidia-nvcl kernel.linked.bc -S -o kernel.nvptx.s
########Compile OpenCL kernel to executables.
### Compile 'kernel.cl' to LLVM IR code
#clang -S -emit-llvm -o kernel.ll -x cl kernel.cl
## Compile Opencl host code into executables using clang
clang -I$AMDAPPSDKROOT/include -L$AMDAPPSDKROOT/lib/x86_64 matrixmult.c -o matrixmult.gcc.out -lOpenCL
###Run the executables
./matrixmult.gcc.out
