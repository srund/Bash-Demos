#!/bin/bash
################################################################################
# Demo of the set bash built-in
# The set built-in sets script or function input
#
# Sample usage: bash demo_builtin_set.sh arg1 arg2 arg3
#
################################################################################

echo "Demo usage: bash demo_builtin_set.sh arg1 arg2 arg3"

# ------------------------------------------------------------------------------
echo "Demo of the set bash built-in"
echo "The set built-in sets script or function input."
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
echo "Printing arguments:"
printargs "$@"

# ------------------------------------------------------------------------------
echo "Using set to set input parameters to:"
newargs=(param1 param2 "param 3" param4 parameter5 "some param 6")
echo "${newargs[@]}"
set -- "${newargs[@]}" # -- delimits positional parameters from set arguments. Recommended but optional.

printargs "$@"

## End
exit 0 # 0 = success

