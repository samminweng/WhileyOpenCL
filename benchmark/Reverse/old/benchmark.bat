@echo off
setlocal enabledelayedexpansion
:: test the function call
::call :benchmark slow longlong original
call :benchmark fast longlong original
::call :benchmark slow longlong optimized
::call :benchmark fast longlong optimized
goto :EOF

:benchmark
cd %1\%2\%3
:: compiling the C program with VS x64 tool
cl While_Valid_1.%1.%2.%3.c
:: Start with 10 million, 50 million, 100 million. 
set list[0]=10000000
set list[1]=50000000
set list[2]=100000000
set list[3]=120000000
set list[4]=150000000
set list[5]=200000000
::read the list using a FOR /L statement
for /l %%n in (0,1,5) do (
	echo !list[%%n]!
	:: run the program on the array size
	While_Valid_1.%1.%2.%3.exe !list[%%n]!
	::rename the output files
	ren result.txt result.%1.%2.%3.!list[%%n]!.txt
)
::Change the directory to the benchmark directory
cd ..\..\..
goto :EOF