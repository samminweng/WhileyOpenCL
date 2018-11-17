#!/bin/bash
BASEDIR="$(pwd)"
outputConsoleToSysout(){
    # Change the source Whiley folder
    for i in {1..3}
    do
        testcase="testcase$i"
        folder="$BASEDIR/sysout/$testcase"
        echo $folder
        mkdir -p $folder
        # Copy whiley program to folder
        cp $BASEDIR/Whileyfiles/$testcase.whiley $folder
        #read -p "Press enter to continue"
        cd $folder
        ./../../../../bin/wyopcl -nocopy -ea -verbose $testcase.whiley > $folder/$testcase.sysout
        rm *.wyil
    done
}
outputConsoleToSysout