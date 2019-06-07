
# Efficient Compilation of a Verification-friendly Programming Language

The Whiley programming language employs the extended static checking to eliminate the errors at the compile time, and compiles the high-level Whiley program into different kinds of implementations. However, the C implementations that the Whiley compiler generates are currently quite inefficient, due to always using unbounded integers, unbounded data structures with frequent copying, etc. This project aims to use the program analysis techniques to generate efficient parallel implementations in C and OpenCL and to gain the speed-up across heterogeneous platforms.

## Installation

Please Open Cygwin/terminal and follow the below instructions.
```
$ git clone https://github.com/samminweng/WhileyOpenCL && cd WhileyOpenCL/ && ant
```
To update the code from GitHub, use the below commands:
```
$ git reset --hard HEAD && git clean -dfx && git pull
```
Note other useful commands are:
'git reset' resets the code base to the most recent commit.
'git clean -dfx' removes all the untracked files.
'git checkout -- <file>' undoes the changes of a file.

## Usage
Whiley-to-C compiler is written in Java to generate and optimise C code automatically. We also use formal method to construct proofs and validate the correctness using automatic Boogie solver. 
<!--
* Bound Analyzer

Bound analyzer infers the bounds and checks the bounds consistent with all constraints.
```
$ cd examples && ./../bin/wyopcl -bound naive whileloop.whiley
```
Or use the gradual widening strategy to get more precise bounds.
```
$ ./../bin/wyopcl -bound gradual whileloop.whiley
```

* Pattern Matching and Pattern Transformation

Pattern matching matches patterns in a function and transforms 'AppendArray' pattern to 'ResizeArray' pattern.
```
$ cd examples && ./../bin/wyopcl -pattern compress lz77.whiley
```
-->

* Copy Elimination Analysis

Copy Elimination analysis eliminates the un-necessary copies in the C code.
```
$ cd examples && ./../bin/wyopcl -code -nocopy example.whiley
```

* Deallocation Analysis

Deallocation analysis chooses and includes pre-defined Macros in the C code to manage un-used memory.
```
$ cd examples && ./../bin/wyopcl -code -dealloc example.whiley
```

* Code Generator

Code Generator translates the Whiley program into C code, and can work with both copy and deallocation analyses to produce the most efficient C code. Note '-ea' option enables to generate C code with assertions.
```
$ cd examples && ./../bin/wyopcl -code -nocopy -dealloc -ea example.whiley
```
Note the generated C code must be compiled with external utility and runtime C library files. So 
```
$ cp ../tests/code/Util.c ../tests/code/Util.h ../tests/code/WyRT.c ../tests/code/WyRT.h .
$ gcc example.c Util.c WyRT.c -o example.out && ./example.out
```

# Unit Testing

<!-- * Bound Analyzer

The bound analyzer is tested with 5 Whiley programs. Use the below commands:
```
$ ant test-bound
```

* Pattern Matching and Pattern Transformation
The pattern matching is tested with 2 Whiley programs. Use the below commands:
```
$ ant test-pattern
```

* Copy Elimination
The copy elimination is tested with 15 Whiley programs. Use the below commands:
$ ant test-copy
-->

We provide a handy ant task to run our compiler and perform various tests. To run our unit test, we need to install GCC compiler (5.4 or above) and [Valgrind] (http://www.valgrind.org/) 

* Code Generation Tests

The code generator with copy elimination and/or memory deallocation analysers is tested with 45 Whiley programs (each program is compiled into 4 kinds of C code, so 180 test cases in total.)
```
$ ant test-code
```
To detect the memory leaks of each test case, we use the below shell script:
```
$ cd tests/code
$ ./runValgrind.sh
```

All the execution results are output to 'log_valgrind.txt'

* Model checking (Experimental)

We use model checking technique to validate the assumption at runtime with 3,602 test Whiley programs.
(722: ADD and TRANSFER macros, 1,440: FUNCTIONCALL macro, 1,440: FUNCTIONCALL_NO_COPY macro)
```
$ ant test-modelchecking
```
To detect memory leaks and check if deallocation macro satisfies the assumption at runtime,
we use the below shell script:
```
$ cd tests/modelchecking
$ ./runValgrind.sh
```
All the execution results are output to 'log_valgrind.txt'

## Benchmarks

We also provide a set of both sequential and parallel benchmark results in `benchmarks/` folder, including:

| Benchmarks                  | Folder            |
| :-------------              |:------------------|
| Micro-Benchmark             | Reverse, newTicTacToe, MergeSort, BubbleSort, MatrixMult |
| Case: Cash Till             | Cashtill      |
| Case: Coin Game             | CoinGame      |
| Case: LZ77 Algorithm        | LZ77          |
| Case: Sobel Edge Detection  | SobelEdge     |

## Publication

* Weng, M. H. (2019). [Efficient Compilation of a Verification-friendly Programming Language](https://researchcommons.waikato.ac.nz/handle/10289/12432) (Doctoral dissertation, The University of Waikato).
* Weng, M. H., Pfahringer, B., & Utting, M. (2017). [Static techniques for reducing memory usage in the C implementation of whiley programs.](https://dl.acm.org/citation.cfm?doid=3014812.3014827) In ACSW'17. ACM.
* Weng, M. H., Utting, M., & Pfahringer, B. (2016). [Bound analysis for Whiley programs.](https://www.sciencedirect.com/science/article/pii/S1571066116000062) Electronic Notes in Theoretical Computer Science, 320, 53-67.

## Built With

* [Whiley Compiler] (http://whiley.org/) - Our compiler is built as a separate module from Whiley compiler
* [Java] (Java JDK) - Implemented in Java
* [Apache ANT] (https://ant.apache.org/) - Used to compile the project and run unit testing

## Contributing

Please read [CONTRIBUTORS] for details on our code of conduct, and the process for submitting pull requests to us.

## Authors 

Min-Hsien Weng
