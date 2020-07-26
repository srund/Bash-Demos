#!/bin/bash
################################################################################
# Print its own absolute directory regardless of the directory the user calls it
# from.
################################################################################
SCRIPT=$(readlink -f $0)	# Full path to (and including) the script file
SCRIPTPATH=$(dirname "$SCRIPT") # Full path to (and excluding) the script file
echo $SCRIPTPATH
