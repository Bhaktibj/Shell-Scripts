#!/bin/bash -x
# take input from user and find 2^n
read -p "Enter the number: " num
pow=1
i=0
if [ $num -ge 0 ] && [ $num -lt 31 ];
then
   while [ $i -le $num ];
   do 
      echo "2^" $i "=" $pow
      pow=$(( 2 * $pow ))
      i=$(( $i + 1 ))
   done
else
echo "Enter number in  range"
fi

