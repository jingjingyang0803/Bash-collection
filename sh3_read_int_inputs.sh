#!/bin/bash

# ---------------------------------------------------
# Interactive input.
# Ask for two integers interactively. 
# Test if the values are integers. If not, ask again. 
# Repeat the same operations(+, -, *, /) as in previous task.
# ---------------------------------------------------

# ****************************************************************************
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


# ***********************************************
# calculate and store the operation result
Sum=$(($NUM1+$NUM2))
Diff=$(($NUM1-$NUM2))
Prod=$(($NUM1*$NUM2))
if [ $NUM2 -eq 0 ]
then
       Div="Undefined(division by zero)"
else
       Div=$(($NUM1/$NUM2))
fi

# print out the result
echo "
Here are the calculation result for $NUM1 and $NUM2:
Sum         $Sum
Difference  $Diff
Product     $Prod
Division    $Div
"
