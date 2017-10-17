#!/bin/bash
outputConsoleToSysout(){
    testcase=$1
    mkdir -p $testcase/disable_assertion
    mkdir -p $testcase/enable_assertion
    cp ../Whileyfiles/$testcase.whiley $testcase/disable_assertion
    cp ../Whileyfiles/$testcase.whiley $testcase/enable_assertion
    cd $testcase/disable_assertion
    ./../../../../../bin/wyopcl -verbose -nocopy -da $testcase.whiley > nocopy.sysout
    cd ../enable_assertion/
    ./../../../../../bin/wyopcl -verbose -nocopy -ea $testcase.whiley > nocopy.sysout
    cd ../../
}

# ## nestedwhileloop
outputConsoleToSysout nestedwhileloop
# ## cashtill
outputConsoleToSysout cashtill
# ## ifelse
outputConsoleToSysout ifelse
# ## Reverse
outputConsoleToSysout reverse
# ## livecheck
outputConsoleToSysout livecheck
# ## livecheck1
outputConsoleToSysout livecheck1
# ## ResetMacro3
outputConsoleToSysout ResetMacro3
# ## ResetMacro4
outputConsoleToSysout ResetMacro4