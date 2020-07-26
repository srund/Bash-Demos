#!/bin/bash
################################################################################
#
# Demo of different ways to use for-loops.
#
# The demos are not guaranteed to be the best ways of doing stuff.
#
# Sample usage: bash demo_for_loop.sh arg1 arg2 arg3
#
################################################################################

## Init
echo "Initializing..."
SCRIPT=$(readlink -f $0)	# Full path to (and including) the script file
SCRIPTPATH=$(dirname "$SCRIPT") # Full path to (and excluding) the script file

## For loop examples
echo Demo 1 --------------------------------------------------------------------

echo "Handmade lists"
for element in 1 2 3 "test" 5
do
	echo $element
done

echo Demo 2 --------------------------------------------------------------------
echo "With incrementing array - Step of 1"
for element in {1..5} # Start Stop
do
	echo $element
done

echo Demo 3 --------------------------------------------------------------------
echo "With incrementing array - Step of Increment"
for element in {0..30..3} # Start, Stop, Increment
do
	echo $element
done

echo Demo 4 --------------------------------------------------------------------
echo "Using an actual BASH array - Note space problem"
myarray=(1 2 3 4 'Test McTestsson')
for element in ${myarray[@]} # Start Stop
do
	echo $element
done
echo "Using an actual BASH array - Possible solution: Array within quote-marks."
myarray=(1 2 3 4 'Test McTestsson')
for element in "${myarray[@]}" # Start Stop
do
	echo $element
done

echo Demo 5 --------------------------------------------------------------------
echo "Iterate over the input arguments. Nbr of args: $#"
for input_arg in "$@"
do
	echo "Argument: $input_arg"
done
echo Demo 6 --------------------------------------------------------------------
echo "C-style loop:"
for (( myvar=0; myvar<=5; myvar++ ))
do
	echo "Loop value $myvar"
done

echo Demo 7 --------------------------------------------------------------------
echo "Iterate over folder"
for file in ./*
do
	echo "File: $file"
done

echo Demo 8 --------------------------------------------------------------------
echo "Iterate over items in file"
TESTFILE=$SCRIPTPATH/TmpDemoFiles/gridfile.txt
filerows=$(cat $TESTFILE)
for row in $filerows
do
	echo "Row: $row"
done
unset TESTFILE

echo Demo 9 --------------------------------------------------------------------
echo "Iterate over rows in file"
echo "This solution is valid for Bash 4 and up."
TESTFILE=$SCRIPTPATH/TmpDemoFiles/gridfile.txt
mapfile -t rowarray < $TESTFILE	# BASH 4 and up. Delimits on newline by default
				# mapfile is also called readarray
for row in "${rowarray[@]}" # Note quotation marks. See array examples.
do
	echo "Row: $row"
done
unset TESTFILE
unset rowarray

echo Demo 10 -------------------------------------------------------------------
echo "Space-safe iteration over rows from command output:"
rowarray=(`find /usr/lib/ -name '*.so'`) # This is an example. There are probably better ways to do whatever you are trying to do with the files.
for row in "${rowarray[@]}" # Note quotation marks. See array examples.
do
	echo "Found so-file: $row"
done
unset rowarray


## End  ------------------------------------------------------------------------
exit 0 # 0 = success

