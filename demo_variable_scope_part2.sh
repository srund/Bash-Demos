#!/bin/bash
################################################################################
#
# Demo to demonstrate how variables are "inherited" bash.
#
################################################################################

echo "Part 2 subshell"

echo "Trying to print variable PART1VAR1 from part 1:"
echo $PART1VAR1
echo "It should not succeed."

echo "Trying to print variable PART1VAR2 from part 1:"
echo $PART1VAR2
echo "It should succeed."

#
echo "Exporting a variable in part 2."
PART2VAR1="Export Part2"

export PART2VAR1

echo "Trying to print variable PREQVAR1 from part 1:"
echo $PREQVAR1
echo "It should not succeed."

echo "Trying to print variable PREQVAR2 from part 1:"
echo $PREQVAR2
echo "It should succeed."


## End
exit 0 # 0 = success
