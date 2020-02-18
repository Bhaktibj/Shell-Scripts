#!/bin/bash -x
# read input from user and perform basic aithmatic operations using switch case
read -p "Enter first number: " a
read -p "Enter second number: " b
echo "Enter the choice: "
echo "1. Addition"
echo "2. Substraction"
echo "3. Mutiplication"
echo "4. Division"
read ch
case $ch in
   1)res=`echo $a + $b | bc` 
   ;; 
   2)res=`echo $a - $b | bc`
   ;;
   3)res=`echo $a * $b | bc`
   ;;
   4)res=`echo $a / $b | bc`

esac
echo "Result : $res"
