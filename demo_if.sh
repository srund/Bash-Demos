#!/bin/bash
################################################################################
#
#   Demo of the if clause
#
#   TODO: Populate with more if tests
#
################################################################################

STRING="Hello World!"
STRING_EMPTY=""
NUMBER1=1
NUMBER2=2

# ---------------------------------------------------------------------------- #
# General structure
echo "The general structure of an if expression is:"
echo "    if CMD1"
echo "    then CMD2"
echo "    elif CMD3"
echo "    else CMD4"
echo "    fi"
echo "CMD1-4 can be any bash expression and if works on the return values."
echo "With 0 being success/true as usual for bash."
echo "For example: (Read the code)"
if find . -name 0; then
	echo "This file exist"
fi
echo "if-tests within square brackets invoke the test-command."
echo "'if [ 1 -eq 2 ]' is equivalent to 'if test 1 -eq 2'"
echo "There are other similar bracket to program translations such as [[]], (())"
echo ", which correspond to extended or specialized test-functionalities."
echo "() that represent a subshell can also be used as 'if' will operate on the"
echo "subshells return value."
echo "What extra tests are available depend on the shell."
echo "Bash support [[]] and (()). The former is sort-of a bash built-in and the"
echo "latter is specialized for arithmetic."

# ---------------------------------------------------------------------------- #
echo "Number comparisons"
if [ $NUMBER1 -eq 1 ]; then
		echo "$NUMBER1 is equal to 1"
else
		echo "$NUMBER1 is not equal to 1"
fi
if [ $NUMBER1 -ne 1 ]
then
	echo "$NUMBER1 is not equal to 1"
else
	echo "$NUMBER1 is equal to 1"
fi
if [ $NUMBER2 -gt -1 ]; then
	echo "$NUMBER2 is greater than -1"
else
	echo "$NUMBER1 is not greater than -1"
fi
if [ $NUMBER1 -lt 255 ]; then
	echo "$NUMBER1 is less than 255"
fi
# ---------------------------------------------------------------------------- #
# And, Or, Not
echo "And &&, Or ||, Not !"
echo "&& and || are the normal Bash operators. ! is for test (within []) only."
if [ $NUMBER1 -eq 1 ] && test $NUMBER2 -eq 2; then
		echo "$NUMBER1 is equal to 1"
		echo "$NUMBER2 is equal to 2"
fi
if [ $NUMBER1 -eq 2 ] || test $NUMBER2 -eq 2; then
		echo "$NUMBER1 is equal to 1 or"
		echo "$NUMBER2 is equal to 2"
fi
if [ ! $NUMBER1 -eq 2 ] ; then
		echo "$NUMBER1 is not equal to 2"
fi

## End
exit 0 # 0 = success

