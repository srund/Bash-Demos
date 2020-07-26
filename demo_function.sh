#!/bin/bash
################################################################################
#
#	Demo to test functions
# 
################################################################################

# Demo 1 -----------------------------------------------------------------------
echo 'Demo 1: ()-format:'
my_echo_function (){
	echo "My echo function"
	# Implicit EXIT_SUCCESS / 0
}
my_echo_function
echo "Return value was $?"

# Demo 2 -----------------------------------------------------------------------
echo 'Demo 2 function-format:'
function my_other_echo_function { # Note space after function name
	echo "My other echo function"
	return -1 # Simulate a failure.
}
my_other_echo_function
echo "Return value was $?"

# Demo 3 -----------------------------------------------------------------------
echo 'Demo 3 With input:'
my_echo_function (){
	echo "Functions take inputs in the same way scripts do it."
	nbr_of_args=$#
	arg1=$1
	arg2=$2

	if [ $nbr_of_args -ne 0 ]
	then
		echo "There are arguments to the function. Continuing."
	else
		echo "Nbr of inputs is 0. Exit failure."
		return 1
	fi

	echo "Number of args: $nbr_of_args"
	echo "arg1: $arg1"
	echo "arg2: $arg2"
	# Implicit EXIT_SUCCESS / 0
}
my_echo_function
my_echo_function arg1 arg2 arg3
my_echo_function arg1

# Exit -------------------------------------------------------------------------
return 0 # EXIT_SUCCESS
