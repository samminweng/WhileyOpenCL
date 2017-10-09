## whileloop
./../../../../bin/wyopcl -traversal DF -bound naive whileloop.whiley > DF_naivewiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound naive -nocopy whileloop.whiley > DF_naivewiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound naive -nocopy -dealloc whileloop.whiley > DF_naivewiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal DF -bound gradual whileloop.whiley > DF_gradualwiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy whileloop.whiley > DF_gradualwiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy -dealloc whileloop.whiley > DF_gradualwiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal BF -bound naive whileloop.whiley > BF_naivewiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound naive -nocopy whileloop.whiley > BF_naivewiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound naive -nocopy -dealloc whileloop.whiley > BF_naivewiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal BF -bound gradual whileloop.whiley > BF_gradualwiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy whileloop.whiley > BF_gradualwiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy -dealloc whileloop.whiley > BF_gradualwiden/nocopy_dealloc_bound.sysout

## whileloop_break
./../../../../bin/wyopcl -traversal DF -bound naive whileloop_break.whiley > DF_naivewiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound naive -nocopy whileloop_break.whiley > DF_naivewiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound naive -nocopy -dealloc whileloop_break.whiley > DF_naivewiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal DF -bound gradual whileloop_break.whiley > DF_gradualwiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy whileloop_break.whiley > DF_gradualwiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy -dealloc whileloop_break.whiley > DF_gradualwiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal BF -bound naive whileloop_break.whiley > BF_naivewiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound naive -nocopy whileloop_break.whiley > BF_naivewiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound naive -nocopy -dealloc whileloop_break.whiley > BF_naivewiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal BF -bound gradual whileloop_break.whiley > BF_gradualwiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy whileloop_break.whiley > BF_gradualwiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy -dealloc whileloop_break.whiley > BF_gradualwiden/nocopy_dealloc_bound.sysout

## nestedwhileloop
./../../../../bin/wyopcl -traversal DF -bound naive nestedwhileloop.whiley > DF_naivewiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound naive -nocopy nestedwhileloop.whiley > DF_naivewiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound naive -nocopy -dealloc nestedwhileloop.whiley > DF_naivewiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal DF -bound gradual nestedwhileloop.whiley > DF_gradualwiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy nestedwhileloop.whiley > DF_gradualwiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy -dealloc nestedwhileloop.whiley > DF_gradualwiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal BF -bound naive nestedwhileloop.whiley > BF_naivewiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound naive -nocopy nestedwhileloop.whiley > BF_naivewiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound naive -nocopy -dealloc nestedwhileloop.whiley > BF_naivewiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal BF -bound gradual nestedwhileloop.whiley > BF_gradualwiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy nestedwhileloop.whiley > BF_gradualwiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy -dealloc nestedwhileloop.whiley > BF_gradualwiden/nocopy_dealloc_bound.sysout


## ResetMacro3
./../../../../bin/wyopcl -traversal DF -bound naive ResetMacro3.whiley > DF_naivewiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound naive -nocopy ResetMacro3.whiley > DF_naivewiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound naive -nocopy -dealloc ResetMacro3.whiley > DF_naivewiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal DF -bound gradual ResetMacro3.whiley > DF_gradualwiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy ResetMacro3.whiley > DF_gradualwiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal DF -bound gradual -nocopy -dealloc ResetMacro3.whiley > DF_gradualwiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal BF -bound naive ResetMacro3.whiley > BF_naivewiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound naive -nocopy ResetMacro3.whiley > BF_naivewiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound naive -nocopy -dealloc ResetMacro3.whiley > BF_naivewiden/nocopy_dealloc_bound.sysout &&

./../../../../bin/wyopcl -traversal BF -bound gradual ResetMacro3.whiley > BF_gradualwiden/naive_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy ResetMacro3.whiley > BF_gradualwiden/nocopy_bound.sysout &&
./../../../../bin/wyopcl -traversal BF -bound gradual -nocopy -dealloc ResetMacro3.whiley > BF_gradualwiden/nocopy_dealloc_bound.sysout
