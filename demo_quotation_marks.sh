#!/bin/bash
################################################################################
#
# Simeple demo to show the difference between double and single quotation marks.
#
################################################################################

VAR1="Hej hopp!!!"

echo "Hejsan, $VAR1"
echo 'Hejsan, $VAR1'
echo "Hejsan, '$VAR1'"
echo 'Hejsan, "$VAR1"'

## End
exit 0 # 0 = success
