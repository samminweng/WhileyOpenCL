#!/bin/bash
### 
export LIBCLC="$HOME/libclc"
### Use 'SED' to escape special characters 
stringifyKernel(){

	read -p "Press [Enter] to remove escape special characters"
	sed -e 's/\\/\\\\/g;s/"/\\"/g;s/^/"/;s/$/\\n"/' kernel.cl > tmp.cl
 	#sed -e 's/[;,()'\'']/ /g;s/  */ /g' kernel.cl > tmp.cl
 	mv tmp.cl kernel.cl
	read -p "Press [Enter] to continue"
}


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
compileKernelToPTX(){
	program=$1
	read -p "Press [Enter] to compile Kernel code to PTX code"
	### Compile 'kernel.cl' to LLVM IR code
	clang -Dcl_clang_storage_class_specifiers \
          -I $LIBCLC/generic/include \
          -include clc/clc.h \
          -target nvptx64-nvidia-nvcl \
          -x cl kernel.cl -emit-llvm -S -o kernel.nvptx.ll
	### Link libclc bitcode and kernel code into 'kernel.linked.bc' bitcode
	llvm-link $LIBCLC/built_libs/nvptx64--nvidiacl.bc kernel.nvptx.ll -o kernel.nvptx.bc
	### Compile to Ptx
	clang -target nvptx64-nvidia-nvcl kernel.nvptx.bc -S -o kernel.nvptx.s
	### Clean up files
	mkdir -p "llvm"
	mv *.ll "llvm/"
	mkdir -p "bitcode"
	mv *.bc "bitcode/"
}

### Compile Kernel code to AMD Intermediate Language code
compileKernelToAMDIL(){
	program=$1
	read -p "Press [Enter] to compile Kernel code to AMDIL code"
	
}

exec(){
	program=$1 
	cd "$program/impl/opencl"
	#stringifyKernel $program
	compileKernelToPTX $program
	#compileKernelToAMDGPU $program
	#compileOpenCLHost $program
	cd "../../.."
}

exec MatrixMult