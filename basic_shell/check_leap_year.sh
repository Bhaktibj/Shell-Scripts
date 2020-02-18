#!/bin/bash -x
# check given year is leap or not

isleap="false"
read -p "Enter year: " year

if [ $((year % 4)) -ne 0 ] ; then
   echo "it is not leap year"
elif [ $((year % 400)) -eq 0 ] ; then
   isleap="true"
else
   # it is a leap year
   isleap="true"
fi
if [ "$isleap" == "true" ];
   then
      echo "$year is leap year"
else
   echo "$year is NOT leap year"
fi
