:: This file is part of the Whiley Development Kit (WDK).
::
:: The Whiley Development Kit is free software; you can redistribute 
:: it and/or modify it under the terms of the GNU General Public 
:: License as published by the Free Software Foundation; either 
:: version 3 of the License, or (at your option) any later version.
::
:: The Whiley Development Kit is distributed in the hope that it 
:: will be useful, but WITHOUT ANY WARRANTY; without even the 
:: implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
:: PURPOSE.  See the GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public 
:: License along with the Whiley Development Kit. If not, see 
:: <http://www.gnu.org/licenses/>
::
:: Copyright 2012, David James Pearce. 
:: modified 2014,	Min-Hsien Weng <samminweng@gmail.com>

::::::::::::::::::::::::::::::::::::
:: CONFIGURATION
::::::::::::::::::::::::::::::::::::
@echo off
set WHILEY_VERSION=v0.3.28
:: Get the parent folder of this batch file.
for %%i in ("%~dp0..") do set "parentfolder=%%~fi"
:: echo %parentfolder%
set WHILEY_CLASSPATH=%parentfolder%\lib\wyil-%WHILEY_VERSION%.jar;%parentfolder%\lib\wybs-%WHILEY_VERSION%.jar;%parentfolder%\lib\wycs-%WHILEY_VERSION%.jar;%parentfolder%\lib\wyrl-%WHILEY_VERSION%.jar;

::::::::::::::::::::::::::::::::::::::::::::
:: RUN APPLICATION
::::::::::::::::::::::::::::::::::::::::::::
java -server -Xmx128M -cp %WHILEY_CLASSPATH% wyil.Main %1
