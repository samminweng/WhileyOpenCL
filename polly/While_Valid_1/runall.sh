#!/bin/sh
# Variable declaration
program=While_Valid_1

echo "1. Create LLVM code from C"
clang -S -emit-llvm $program.c -o $program.s

export PATH_TO_POLLY_LIB="/home/sam/polly/llvm_build/lib"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

echo "2. Prepare LLVM-IR for Polly"
opt -S -polly-canonicalize $program.s > $program.preopt.ll

echo "3. Show the ScoPs dectected Polly"
opt -basicaa -polly-ast -analyze -q $program.preopt.ll


echo "4. Generate SCoPs in DOT files, viewd by Graphviz"
opt -basicaa -dot-scops -disable-output $program.preopt.ll


echo "Display polyhedral representation of SCoPs."
opt -basicaa -polly-scops -analyze $program.preopt.ll

echo "5. Show the dependency of SCoPs."
opt -basicaa -polly-dependences -analyze $program.preopt.ll
read -p "Press enter to continue" nothing


echo "6. Export the polyhedral representation to jscop files in JSON format."
opt -basicaa -polly-export-jscop $program.preopt.ll

echo "7. Code generate the SCoPs"


read -p "Press enter to end" nothing


# Codegenerate the SCoPs


