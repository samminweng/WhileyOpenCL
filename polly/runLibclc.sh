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
}

### Compile Kernel code to AMDGCN
### Reference: https://groups.google.com/forum/#!topic/llvm-dev/UH-T1CjbMEU
compileKernelToAMDGCN(){
	program=$1
	read -p "Press [Enter] to compile Kernel code to LLVM IR Code"
	clang -Dcl_clang_storage_class_specifiers \
	      -I $LIBCLC/generic/include\
	      -include clc/clc.h\
	      -target amdgcn -mcpu=carrizo\
	      -x cl kernel.cl -emit-llvm -S -o kernel.amdgcn.ll
	#clang -include /path/to/libclc/headers/clc.h -I /path/to/libclc/headers  -Dcl_clang_storage_class_specifiers -target amdgcn--amdhsa -mcpu=carrizo  $INPUT_FILE -o $OUTPUT_FILE
	read -p "Press [Enter] to link LLVM IR Code with libclc bitcode"
	### Link libclc bitcode and kernel code into 'kernel.linked.bc' bitcode
	llvm-link $LIBCLC/built_libs/carrizo-amdgcn--.bc kernel.amdgcn.ll -o kernel.amdgcn.bc
	read -p "Press [Enter] to compile to AMDGCN"
	clang -target amdgcn -mcpu=carrizo\
	      kernel.amdgcn.bc -S -o kernel.amdgcn.s
}

exec(){
	program=$1 
	cd "$program/impl/opencl"
	#stringifyKernel $program
	#compileKernelToPTX $program
	compileKernelToAMDGCN $program
	#compileOpenCLHost $program

	### Clean up files
	mkdir -p "llvm"
	mv *.ll "llvm/"
	mkdir -p "bitcode"
	mv *.bc "bitcode/"
	cd "../../.."
}

exec MatrixMult