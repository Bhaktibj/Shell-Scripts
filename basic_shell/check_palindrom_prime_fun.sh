#!/bin/bash -x
function check_prime()
{  
   count=0
   for((i=2; i<=num/2; i++))
      do
         if [ $((num%i)) -eq 0 ]
            then
               echo "Number is prime"
               break
         else
             echo "number is not prime"
             break
         fi
   done
}
read -p "Enter the number " num
check_prime "$num"

function check_palindrom()
{
   rem=0 
   rev=""
   temp=$num 
   while [ $num -gt 0 ] 
      do
         s=$(( $num % 10 ))   
         num=$(( $num / 10 ))   
         rev=$( echo ${rev}${s} )  
   done
   if [ $temp -eq $rev ]; 
      then
         echo "Number is palindrome"
   else
       echo "Number is NOT palindrome"
   fi
}

check_palindrom "$num"
