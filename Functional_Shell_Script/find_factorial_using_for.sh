#!/bin/bash -x
# find factorial using for loop
read -p "Enter a number: " num
fact=1
for((i=2;i<=num;i++))
{
    fact=$((fact * i))  #fact = fact * i
}
echo $num "factorial is: " $fact
