#!/bin/bash

outputConsoleToSysout(){
    testcase=$1
    cp ../Whileyfiles/$testcase.whiley $testcase
    cd $testcase/
    ./../../../../bin/wyopcl -traversal DF -bound naive $testcase.whiley > DF_naivewiden/naive_bound.sysout
    ./../../../../bin/wyopcl -traversal DF -bound naive -nocopy $testcase.whiley > DF_naivewiden/nocopy_bound.sysout
    ./../../../../bin/wyopcl -traversal DF -bound naive -nocopy -dealloc $testcase.whiley > DF_naivewiden/nocopy_dealloc_bound.sysout

    ./../../../../bin/wyopcl -traversal DF -bound gradual $testcase.whiley > DF_gradualwiden/naive_bound.sysout
    ./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy $testcase.whiley > DF_gradualwiden/nocopy_bound.sysout
    ./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy -dealloc $testcase.whiley > DF_gradualwiden/nocopy_dealloc_bound.sysout

    ./../../../../bin/wyopcl -traversal BF -bound naive $testcase.whiley > BF_naivewiden/naive_bound.sysout
    ./../../../../bin/wyopcl -traversal BF -bound naive -nocopy $testcase.whiley > BF_naivewiden/nocopy_bound.sysout
    ./../../../../bin/wyopcl -traversal BF -bound naive -nocopy -dealloc $testcase.whiley > BF_naivewiden/nocopy_dealloc_bound.sysout

    ./../../../../bin/wyopcl -traversal BF -bound gradual $testcase.whiley > BF_gradualwiden/naive_bound.sysout
    ./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy $testcase.whiley > BF_gradualwiden/nocopy_bound.sysout
    ./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy -dealloc $testcase.whiley > BF_gradualwiden/nocopy_dealloc_bound.sysout
    cd ..

}
## ifelse
outputConsoleToSysout ifelse
## whileloop
outputConsoleToSysout whileloop
## whileloop_break
outputConsoleToSysout whileloop_break
## nestedwhileloop
outputConsoleToSysout nestedwhileloop
## ResetMacro3
outputConsoleToSysout ResetMacro3
