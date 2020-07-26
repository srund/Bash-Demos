#!bin/bash

# A match:
uname -a | grep -i "x86_64"
echo "grep exit for a match is : $?"
# No match
uname -a | grep -i "No match for this string hopefully. It would be weird."
echo "grep exit for no match is : $?"

exit
