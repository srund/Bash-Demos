#!/bin/bash
################################################################################
#
#   BASH-file intended to be a template for quickly getting started with a
#   script.
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
#exit

## Script params
FILENAME=""

## Parse input
SHORT_ARGS='af:d::h'
LONG_ARGS='a-long,file:,d-long::,help' # Comma separated

# We put the parsed options in a variable for now since we want to check getopts
# return value. Using getopt together with set would have removed the return val
options=$(getopt -o "$SHORT_ARGS" --long "$LONG_ARGS" -- "$@")

if [ $? -ne 0 ]; then
	echo 'getopt could not parse input. Terminating...' >&2
	exit 1
fi
eval set -- "$options" # Changing positional params to getopt filtered version of them.
unset options # We don't need the options any more.

# consume 1-2 positional params as flags at the time until there are no more.
while true
do
	case "$1" in
		'-a' | '--a-long' )
			echo "A-option gotten"
			shift
			continue
			;;
		'-f' | '--file' )
			echo "F-option gotten"
			FILENAME=$2
			shift 2 # b has a mandatory option
			continue
			;;
		'-d' | '--d-long' )	# Note that optional options need to be
					# written after the option with =
					# instead of space
					
			case "$2" in
				'')
					echo "D-option gotten without arg"
				;;
				*)
					echo "D-option gotten with arg: $2"
				;;
			esac
			shift 2 # Need to shift 2 regardless of case for d
			continue
			;;
		'--') # End of flagged params
			shift
			break # Break while loop
			;; # Put here because it doesn't feel right to remove it
		*)
			echo "We shouldn't get here. Terminating ..." >&2
			exit 1
	esac
done
echo "Positional parameters:"
for arg in "$@"
do
	echo $arg
done
## Verify input
if [ -z "$FILENAME" ]; then
	echo "Error filename not defined. Terminating..." >&2
fi
## Program Proper

## End
exit 0 # 0 = success
