#!/bin/bash

# ----------------------------------------------------------------------------------
# 4. Functions. 
# Extract the arithmetic operations from previous tasks to a function. 
# Place the function to external file. 
# Combine 2 and 3 so that arguments can be given as parameters or read interactively.
#
# Usage example: sh sh4_Arith_func.sh 6 2
#                sh sh4_Arith_func.sh 5
#		 sh sh4_Arith_func.sh
# ----------------------------------------------------------------------------------

# load the arithmetic operations function from another file
. ./calcfunction

# get the arguments, and do calculation
if [ "$#" -eq 0 ]; then

	# ask for two integers from the user with a prompt, and save them to variables
	read -p "Enter two integers: " Input1 Input2

	# extract number part from the inputs
	NUM1=$(echo "$Input1" | egrep -o '[0-9]+')
	NUM2=$(echo "$Input2" | egrep -o '[0-9]+')

	# ask again if the inputs are not integers or empty
	while [ "$NUM1" != "$Input1" ] || [ "$Input1" = "" ] || [ "$NUM2" != "$Input2" ] || [ "$Input2" = "" ]
	do
		read -p "Invalid input.Please give Two Integers: " Input1 Input2
		NUM1=$(echo "$Input1" | egrep -o '[0-9]+')
		NUM2=$(echo "$Input2" | egrep -o '[0-9]+')
	done
	# ********************
        Calc "$NUM1" "$NUM2"

elif [ "$#" -eq 1 ]; then

	NUM1=$(echo "$1" | egrep -o '[0-9]+')

	# if the first parameter is a number:
	if [ "$NUM1" = "$1" ]; then
		# 2) ask for the second number from user input
		read -p "Please enter another number: " Input2
		# extract number part from the inputs
		NUM2=$(echo "$Input2" | egrep -o '[0-9]+')
		# ask again if the input is not an integer or empty
		while [ "$NUM2" != "$Input2" ] || [ "$Input2" = "" ] 
		do
			read -p "Invalid input.Please give An Integer: " Input2
			NUM2=$(echo "$Input2" | egrep -o '[0-9]+')
		done

		# ********************
		Calc "$NUM1" "$NUM2"
	else
		echo "Please give INTEGER as parameter."
	fi


elif [ "$#" -eq 2 ]; then

	NUM1=$(echo "$1" | egrep -o '[0-9]+')
	NUM2=$(echo "$2" | egrep -o '[0-9]+')

	# if both parameters are numbers:
	if [ "$NUM1" = "$1" ] && [ "$NUM2" = "$2" ]; then
	        NUM1=$(echo "$1" | egrep -o '[0-9]+')		
	        NUM2=$(echo "$2" | egrep -o '[0-9]+')
	 	# ********************
		Calc "$NUM1" "$NUM2"
        else		
		echo "Please give INTEGER as parameter."
	fi

else
	echo "Too many parameters.Please try again."
fi
