#!/bin/bash
################################################################################
#
# Demo of running parts of as script with sudo.
#
################################################################################

echo "Running whoami alternating between using sudo and not."
echo "The second time sudo is invoced it should not ask for a password."

whoami
sudo whoami
whoami
sudo whoami

## End
exit 0 # 0 = success
