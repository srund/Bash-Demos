#!/bin/bash
################################################################################
# Demo script that concatenates two strings.
################################################################################

#
VAR1="Just some text"
VAR2=" to concatenate."
# Don't even have to use a +. The + if added would be the symbol not the operator.
VAR3=$VAR1$VAR2

#
# It doesn't really matter if the space is in our outside the ""
echo "String 1: "$VAR1
echo "String 2:" $VAR2
echo "The new string is:"
echo $VAR3

## End
exit 0 # 0 = success

