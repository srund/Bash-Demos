#!/bin/bash
################################################################################
#
#	Demo to test if the OS is bionic
#	Should work on any Debian-like Linux-systems
# 
################################################################################

OSTEST=bionic
echo "Testing OS is $OSTEST"

cat /etc/os-release | grep -i "$OSTEST"
if [ $? -eq 0 ]
	then
		echo "OS version is $OSTEST"
	else
		echo "OS version is not $OSTEST" 
fi
exit
