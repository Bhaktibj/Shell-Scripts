#!/bin/bash -x
# basic airthmatic operations
x=200;
y=100;
z=$(( $x + $y ))
echo "$x + $y =" $z
echo "*****************"
echo "read input from user"
read -p "Enter first number: " a
read -p "Enter second number: " b
sum=$(( $a + $b ))
sub=$(( $a - $b ))
mul=$(( $a * $b ))
div=$(( $a / $b ))
echo "Sum is: " $sum
echo "Sub is: " $sub
echo "Mul is: " $mul
echo "Div is: " $div

