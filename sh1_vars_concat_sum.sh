#!/bin/bash

# -------------------------------------------------------------
# 1. Variables experiments script.
# Define 3 static variables. Print them out.
# Try out creating a new variable that joins variables together.
# Try out calculating the sum of the variables.
# -------------------------------------------------------------

# define 3 static variables
Var1=2
Var2=78
Var3=164
# print the varibales out
echo Here are three variables: "$Var1  $Var2  $Var3"

# create a new varibale that joins variables together
Concat=$Var1+$Var2+$Var3
# calculate the sum of the variables
Sum=$(($Var1+$Var2+$Var3))

# print the result
echo
echo Sum of the variables: "$Concat=$Sum"
