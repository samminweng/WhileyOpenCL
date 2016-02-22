#!/bin/bash
### 
export LIBCLC="$HOME/libclc"

###
### Compile Opencl host code into executables using 'Clang' compiler
###
compileOpenCLHost(){
	program=$1
	read -p "Press [Enter] to compile OpenCL host program into executables"
	### Compile Opencl host code into executables using clang
	mkdir -p "out"
	clang -I$AMDAPPSDKROOT/include -L$AMDAPPSDKROOT/lib/x86_64 -lOpenCL $program.c -o "out/$program.opencl.out" 
	read -p "Press [Enter] to run the OpenCL executable"
	."/out/$program.opencl.out"
}

### Compile Kernel code to PTX code
compileOpenCLKernel(){
	program=$1
	read -p "Press [Enter] to compile Kernel code to PTX code"
	### Compile 'kernel.cl' to LLVM IR code
	#clang -S -emit-llvm -o kernel.ll -x cl kernel.cl
	clang -Dcl_clang_storage_class_specifiers \
          -I $LIBCLC/generic/include \
          -include clc/clc.h \
          # target list is http://clang.llvm.org/docs/CrossCompilation.html
          -target nvptx64-nvidia-nvcl \
          -x cl kernel.cl -emit-llvm -S -o kernel.ll
	### Link libclc bitcode and kernel code into 'kernel.linked.bc' bitcode
	llvm-link $LIBCLC/built_libs/nvptx64--nvidiacl.bc kernel.ll -o kernel.linked.nvptx.bc
	### Compile to Ptx
	clang -target nvptx64-nvidia-nvcl kernel.linked.nvptx.bc -S -o kernel.nvptx.s
	### Clean up files
	mkdir -p "llvm"
	mv *.ll "llvm/"
	mkdir -p "bitcode"
	mv *.bc "bitcode/"
}

exec(){
	program=$1 
	cd "$program/impl/opencl"
	compileOpenCLKernel $program
	compileOpenCLHost $program
	cd "../../.."
}

exec MatrixMult