#!/bin/bash
################################################################################
# Demo of taking user input during script execution and branching on result
#
# It is basically a test of read. See read --help (Note that: man read describes
# the wrong program/function)
################################################################################

# ---------------------------------------------------------------------------- #
echo "Single letters test"

read -p "Please enter answer yes or no [YyNn]:" -n 1
echo # For a newline. read will end before any enter-stroke is made.
# Doing a regex comparison on the string:
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "User entered Yes as" $REPLY
elif [[ $REPLY =~ ^[Nn]$ ]]
then
	echo "User entered No as" $REPLY
else
	echo "User entered unknown input as" $REPLY
fi

# ---------------------------------------------------------------------------- #
echo "Yes/No test"

read -p "Please enter answer yes or no [YyNn]:"
# Doing a regex comparison on the string:
if [[ $REPLY =~ ^[Yy][EeSs]*$ ]]
then
	echo "User entered Yes as" $REPLY
elif [[ $REPLY =~ ^[Nn][Oo]*$ ]]
then
	echo "User entered No as" $REPLY
else
	echo "User entered unknown input as" $REPLY
fi

# ---------------------------------------------------------------------------- #
echo "Silent unput test	"
echo "read can read into any desired variable, not only REPLY, and it can read\
input silently. See demo_password_input.sh."

read -sp "Enter hidden input: " MYVAR
echo "Input was: $MYVAR"


# ---------------------------------------------------------------------------- #
## End
exit 0 # 0 = success

