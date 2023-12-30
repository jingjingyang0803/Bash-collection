#!/bin/bash

# ------------------------------------------------------------------------------------
# 2. Command line arguments script. 
# Two parameters.Print out the sum, difference and product and division of the numbers.

# Usage Example: sh sh2_cli_args_Ops.sh 34 8
# ------------------------------------------------------------------------------------

# test if the arguments are given correctly:
# TWO arguments, and must be integers
if [ "$#" -eq 2 ]
then

	num1=$(echo "$1" | egrep -o '[0-9]+')
	num2=$(echo "$2" | egrep -o '[0-9]+')

	# if both parameters are numbers:
	if [ "$num1" = "$1" ] && [ "$num2" = "$2" ]
	then

		# 1) print out the two given parameters
		echo "You gave two numbers: $1 and $2"

		# 2) calculate and store the operations
		Sum=$(($1+$2))
		Diff=$(($1-$2))
		Prod=$(($1*$2))
		if [ $2 -eq 0 ]
		then
			Div="Undefined(division by zero)"
		else
			Div=$(($1/$2))
		fi

		# 3) print out the result
		echo "
The calculation result is shown below:
Sum         $Sum
Difference  $Diff
Product     $Prod
Division    $Div
"

	else
		echo "Please give INTEGER as parameter."
	fi
else
	echo "Please give TWO parameters."
fi
