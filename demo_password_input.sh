#!/bin/bash
################################################################################
# Demo script asking for a users password for something. In other words the
# script:
#   1. Reads a hidden input twice with read
#   2. Compares the two inputs
#   3. Unsets the variables containing the passwords.
#
################################################################################

# ---------------------------------------------------------------------------- #
# Get strings
# >Note: s in front of p which makes the input silent. The s flag can't be after
# the p one.
read -sp "Enter password: " PWD1
echo # For newline
read -sp "Retype password: " PWD2
echo # For newline

# ---------------------------------------------------------------------------- #
# Compare strings
if [ "$PWD1" == "$PWD2" ]
then
	echo "Equal!"
	echo "PWD1: $PWD1 : PWD2: '$PWD2'"
else
	echo "Not equal..."
	echo "PWD1: '$PWD1' : PWD2: '$PWD2'"
fi
# ---------------------------------------------------------------------------- #
# Unset strings. Should be done as soon as the passwords are not needed anymore.
unset PWD1
unset PWD2

echo "Password containing variables unset"
echo "PWD1: '$PWD1' : PWD2: '$PWD2'"

# ---------------------------------------------------------------------------- #

## End
exit 0 # 0 = success

