::
:: Copyright (c) 2011, David J. Pearce (djp@ecs.vuw.ac.nz)
:: All rights reserved.
::
:: Redistribution and use in source and binary forms, with or without
:: modification, are permitted provided that the following conditions are met:
::    * Redistributions of source code must retain the above copyright
::      notice, this list of conditions and the following disclaimer.
::    * Redistributions in binary form must reproduce the above copyright
::      notice, this list of conditions and the following disclaimer in the
::      documentation and/or other materials provided with the distribution.
::    * Neither the name of the <organization> nor the
::      names of its contributors may be used to endorse or promote products
::      derived from this software without specific prior written permission.
::
:: THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
:: ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
:: WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
:: DISCLAIMED. IN NO EVENT SHALL DAVID J. PEARCE BE LIABLE FOR ANY
:: DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
:: (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
:: LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
:: ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
:: (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
:: SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
::
:: Copyright 2012, David James Pearce. 
:: modified 2014,	Min-Hsien Weng <samminweng@gmail.com>
:: set "files=%files% %parentfolder%\lib\%%a-%WHILEY_VERSION%.jar;" 
::::::::::::::::::::::::::::::::::::
:: CONFIGURATION
::::::::::::::::::::::::::::::::::::
@echo off
set WHILEY_VERSION=v0.3.28
:: Get the parent folder of this batch file.
for %%i in ("%~dp0..") do set "parentfolder=%%~fi"
:: echo %parentfolder%
:: Create a list of library
:: set files=
:: set list=wyc wyil wycs wybs wyrl
:: (for %%a in (%list%) do (
::   set files=%files% %parentfolder%\lib\%%a-%WHILEY_VERSION%.jar; 
:: ))
:: echo %files%
set WHILEY_CLASSPATH=%parentfolder%\lib\wyc-%WHILEY_VERSION%.jar;%parentfolder%\lib\wyil-%WHILEY_VERSION%.jar;%parentfolder%\lib\wyjc-%WHILEY_VERSION%.jar;%parentfolder%\lib\wycs-%WHILEY_VERSION%.jar;%parentfolder%\lib\wybs-%WHILEY_VERSION%.jar;%parentfolder%\lib\wyrl-%WHILEY_VERSION%.jar;
set WHILEY_BOOTPATH=%parentfolder%\lib\wyrt-%WHILEY_VERSION%.jar
::::::::::::::::::::::::::::::::::::::::::::
:: RUN APPLICATION
::::::::::::::::::::::::::::::::::::::::::::
java -server -Xmx128M -cp %WHILEY_CLASSPATH% wyc.WycMain -bp %WHILEY_BOOTPATH% %1
