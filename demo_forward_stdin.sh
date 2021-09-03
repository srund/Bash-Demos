#!/bin/bash
################################################################################
#
#   Demo script demonstrating a way to forward stdin to programs within the
#   script.
#
################################################################################

# Anti-climatically simple.
# Test: bash demo_forward_sdtin.sh
grep -i "success"

# Grep should have consumed all stdin data and nothing will happen.
cat 

## End
exit 0 # 0 = success

