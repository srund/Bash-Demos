#!/bin/bash
################################################################################
# Demo of the eval bash built-in
# The eval built in takes input and executes it as a command in the current
# shell.
#
# Useful for when commands or variables otherwise would be interpreted too
# literally, otherwise not correctly, or simply when a command will constructed
# programmetically.
#
# Sample usage: bash demo_builtin_eval.sh
################################################################################

acommand="ls -la | grep -iE 'demo_builtin*'"

echo "Demo 1 -------------------------------------------------------------------"
echo "Eval can be used to construct construct commands and make them be interpreted correctly"
echo "Writing a command into the shell: $acommand"
$acommand
echo "It should have failed."

echo "Writing a command into the shell with eval: eval $acommand"
eval $acommand
echo "It should run properly."

echo "Demo 2 -------------------------------------------------------------------"
echo "Eval can be used to construct variable names."
echo "Defining variable: myvar1=\"MyVar\""
myvar1="MyVar"
echo "Defining new variable: myvar2$myvar1=\"MyVar2\" # It will fail."
myvar2$myvar1="MyVar2" # Will fail.

echo "Defining new variable: eval myvar2$myvar1=\"MyVar2\" # It will succeed."
eval myvar2$myvar1="MyVar2"
echo "Printing variable myvar2MyVar: "$myvar2MyVar # Expected output MyVar2

echo "Demo 3 -------------------------------------------------------------------"
# From: https://www.unix.com/man-page/posix/1posix/eval/
echo "Defining variables: foo=10 x=foo y='$'\$x"
foo=10
x=foo
y='$'$x
echo "Evaluating y with and without eval"
echo "Without - Expected: \$foo Actual: " $y
eval y='$'$x
echo "With    - Expected: 10    Actual: " $y

## End
exit 0 # 0 = success

