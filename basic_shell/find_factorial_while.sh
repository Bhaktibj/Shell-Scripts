#!/bin/bash -x
# take input from user and find the number of fact
read -p "Enter the number: " num
fact=1
while [ $num -gt 1 ]
do
  fact=$((fact * num))  #fact = fact * num
  num=$((num - 1))      #num = num - 1
done

echo $num "factorial is: " $fact
