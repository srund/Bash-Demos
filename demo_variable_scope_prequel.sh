#!/bin/bash
################################################################################
#
# Demo to demonstrate how variables are "inherited" bash.
# This script is intended to be run run from part1 with the source command
# instead of being run as a shell.
#
################################################################################

echo "Prequel part"
PREQVAR1="PREQVAR1"
export PREQVAR2="PREQVAR2"
echo "End of prequel."

# Can not end with exit since that would end the calling shell. Assuming it
# called this file with source. Which we do not want.
