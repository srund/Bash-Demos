#!/bin/bash
################################################################################
# Demo of the shift bash built-in"
# The shift built-in shifts script or function input down by 1 or optionally
# more steps.
#
# Sample usage: bash demo_builtin_set.sh arg1 arg2 arg3 arg4 arg5 arg6
#
################################################################################

if [ 4 -ge $# ]
	then
		echo 'The script expects a four or more inputs.'
		echo "Eg: bash demo_builtin_shift.sh arg1 arg2 arg3 arg4 arg5 arg6"
		echo "Aborting."
		exit 1 # Standard error code. Some others have special meanings.
	else
		echo 'Four or more arguments given. Continuing script.'
fi
# ------------------------------------------------------------------------------
function printargs {
	echo "Number of arguments: $#"
	echo "Argument zero: $0"
	echo "Arguments given:"
	
	for arg in "$@"
	do
		echo "Argument: $arg"
	done
}

# ------------------------------------------------------------------------------
echo "Demo of the shift bash built-in"
echo "The shift built-in shifts script or function input down by 1 or optionally\
 more steps."
# ------------------------------------------------------------------------------
echo "Printing arguments:"
printargs "$@"

# ------------------------------------------------------------------------------
echo "Single shift"
shift
printargs "$@"

# ------------------------------------------------------------------------------
echo "Double shift"
shift 2
printargs "$@"


## End
exit 0 # 0 = success

