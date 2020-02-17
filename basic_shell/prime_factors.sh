#!/bin/bash -x
# find prime factors using while and for loop
read -p "enter the input :" num
for((i=2;i<=num;i++)); do
  while [ $(($num % i)) -eq 0 ];
  do
  	echo $i
  num=$(( $num / i ))
  done
done
echo " "
