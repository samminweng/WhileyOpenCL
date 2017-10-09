## Reverse
cd reverse/disable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -da reverse.whiley > nocopy.sysout &&
cd ../../ &&
cd reverse/enable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -ea reverse.whiley > nocopy.sysout &&
cd ../../
## livecheck
cd livecheck/disable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -da livecheck.whiley > nocopy.sysout &&
cd ../../ &&
cd livecheck/enable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -ea livecheck.whiley > nocopy.sysout &&
cd ../../
## livecheck1
cd livecheck1/disable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -da livecheck1.whiley > nocopy.sysout &&
cd ../../ &&
cd livecheck1/enable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -ea livecheck1.whiley > nocopy.sysout &&
cd ../../
## ResetMacro3
cd ResetMacro3/disable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -da ResetMacro3.whiley > nocopy.sysout &&
cd ../../ &&
cd ResetMacro3/enable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -ea ResetMacro3.whiley > nocopy.sysout &&
cd ../../
## ResetMacro4
cd ResetMacro4/disable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -da ResetMacro4.whiley > nocopy.sysout &&
cd ../../ &&
cd ResetMacro4/enable_assertion/ &&
./../../../../../bin/wyopcl -verbose -nocopy -ea ResetMacro4.whiley > nocopy.sysout &&
cd ../../
