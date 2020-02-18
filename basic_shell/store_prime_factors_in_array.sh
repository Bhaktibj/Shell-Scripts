#!/bin/bash -x
# find prime factors and store in array
read -p "enter the input :" num
count=0
declare -a  prime_array=()
for((i=2;i<=num;i++)); do
   while [ $(($num % i)) -eq 0 ];
      do
         prime_array[ ((count++)) ]=$i
         num=$(( $num / i ))
   done
done
echo "prime factors in array: "${prime_array[@]}
echo " "

