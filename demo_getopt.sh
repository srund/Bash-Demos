#!/bin/bash
################################################################################
#
# Test of getopt
#
# bash demo_getopt.sh pos1 -abb-argument -d pos2 -c c-arg pos3 pos4
# bash demo_getopt.sh pos1 -abb-argument -dd-arg -c c-arg pos2 pos3
################################################################################


## Introduction message:
echo "This is a test of getopt using minimal flags of getopt itself."
echo "For more functionality consult the man-page or other sources."
echo "On Debian there might be some examples already installed at:\n/usr/share/doc/util-linux"
echo "This guide tries to follow one of examples in question.\n"
echo "A single line example of getopt could be:"
echo 'getopt -o "ab:c:d::" -- -abb-param "pos param1" -c c-param pos-param2 -dd-param'
getopt -o "ab:c:d::" -- -abb-param "pos param1" -c c-param pos-param2 -dd-param
echo 'getopt -o "ab:c:d::" -- -abb-param "pos param1" -c c-param pos-param2 -d pos-param3'
getopt -o "ab:c:d::" -- -abb-param "pos param1" -c c-param pos-param2 -d pos-param3
echo "Note the difference between the -d flag of the two parameters"

SHORT_ARGS='ab:c:d::'
LONG_ARGS='a-long,b-long:,c-long:,d-long::' # Comma separated
echo "Short arguments defined as\"$SHORT_ARGS\""
echo "Long arguments defined as\"$LONG_ARGS\""

# CONTINUE FROM HERE!
# https://www.unix.com/unix-for-beginners-questions-and-answers/270738-eval-set-more.html
# The post from corona688 pretty much explain what the example is doing.

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
		'-a' | 'a-long' )
			echo "A-option gotten"
			shift
			;;
		'-b' | 'b-long' )
			echo "B-option gotten with arg: $2"
			shift 2 # b has a mandatory option
			;;
		'-c' | 'c-long' )
			echo "C-option gotten with arg: $2"
			shift 2 #
			;;
		'-d' | 'd-long' )
			if [ -n $2]
			then
				echo "D-option gotten with arg: $2"
				shift 2
			else
				echo "D-option gotten without arg"
				shift
			fi
			;;
		'--') # End of flagged params
			shift
			break # Break while loop
			;; # Put here because it doesn't feel right to remove it
		*)
			echo "We shouldn't get here. Terminating ..."
			exit 1
	esac
done
echo "Positional parameters:"
for arg in "$@"
do
	echo $arg
done




## End
exit 0 # 0 = success
