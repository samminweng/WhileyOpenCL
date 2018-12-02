#!/bin/bash
BASEDIR="$(pwd)"
runWyOpenCL(){
    testcase=$1
    folder="$BASEDIR/sysout/$testcase"
    echo $folder
    mkdir -p $folder
    # Copy whiley program to folder
    cp $BASEDIR/Whileyfiles/$testcase.whiley $folder
    #read -p "Press enter to continue"
    cd $folder
    ./../../../../bin/wyopcl -nocopy -dealloc -ea -verbose -code $testcase.whiley > $folder/$testcase.sysout
    rm *.wyil
}

outputConsoleToSysout(){
    # Run normal test case
    for i in {1..10}
    do
        testcase="testcase$i"
        runWyOpenCL $testcase
    done
    cd $BASEDIR
    # Run special case
    for i in {1..6}
    do
        specialcase="specialcase$i"
        runWyOpenCL $specialcase
    done
}
outputConsoleToSysout