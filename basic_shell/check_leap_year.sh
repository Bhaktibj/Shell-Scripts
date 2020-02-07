# check given year is leap or not
#!/bin/bash

isleap="false"
read -p "Enter year: " year

if [ $((year % 4)) -ne 0 ] ; then
   : #  not a leap year : means do nothing and use old value of isleap
elif [ $((year % 400)) -eq 0 ] ; then
   # yes, it's a leap year
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
