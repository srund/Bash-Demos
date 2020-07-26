#!/bin/bash
################################################################################
#
#	Demo to test if the script is run as root or not.
# 
################################################################################

echo "Testing if the script is run as root."
echo "The root user on POSIX systems have User ID 0 which is easy to test."
if [ $UID -eq 0 ]
	then
		echo "User ID is $UID <-> the script is run as root."
	else
		echo "User ID is $UID <-> the script is not run as root." 
fi
exit
