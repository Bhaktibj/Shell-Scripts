#!/bin/bash
#Generate 5 randoms 5 digit and print min and max
count=0
max=0
min=0
for i in {1..5};
   do
      random_number=$(( $RANDOM % 99 + 1 ))
      random_num[ (( count++ )) ]=$random_number
done
echo "random numbers " ${random_num[@]}
for num in ${random_num[@]}; do
   if (( $num > $max )); then max=$num; fi;
   if (( $num < $max )); then min=$num; fi; 
done
echo "max number is: " $max
echo "min number is: " $min

