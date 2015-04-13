cd slow\longlong
:: compiling the C program with VS x64 tool
cl While_Valid_1.slow.longlong.c
:: test the function call
set program=slow
set datatype=longlong
call :benchmark %program% %datatype%
REM change the directory to the benchmark directory
cd ..\..
goto :EOF


:benchmark
echo/%1
echo/%2
set arraysize=10000000
:: Start with 10 million, finish at 120 million and increment by 10 million. 
:loop	
While_Valid_1.%1.%2.exe %arraysize%
::rename the output files
ren result.txt result.%1.%2.%arraysize%.txt
::Increase the array size
set /a arraysize=%arraysize%+10000000
if %arraysize%==300000000 goto exit
goto loop
:exit
goto :EOF
