#!/bin/bash
################################################################################
#
# Demo to demonstrate how variables are "inherited" bash.
#
################################################################################

echo "Part 1"
PART1VAR1="HelloWorld!"
echo $PART1VAR1
PART1VAR2="Exported var!"

export PART1VAR2 # Note no $ in front

source demo_variable_scope_prequel.sh
echo "$?"
echo "Got variable $PREQVAR1 and $PREQVAR2 from the prequel script."


echo "Starting part 2"
bash demo_variable_scope_part2.sh

echo "Trying to print variable PART2VAR1 from part 2:"
echo $PART2VAR1
echo "It should not succeed as the exported variable life span ends with its Shell"

echo "Starting part 3"
sudo bash demo_variable_scope_part3.sh

## End
exit 0 # 0 = success
