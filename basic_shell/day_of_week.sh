#!/bin/bash -x
# read day, month , year input from user and print day of the week using if and elif
read -p "Enter the day: " day
read -p "Enter the month: " month
read -p "Enter the year: " year

year_0=$(( $year - (14 - $month) / 12 ))
x=$(( $year_0 + $year_0 / 4 - $year_0 / 100 + $year_0 / 400 ))
month_0=$(( $month + 12 * ((14 - $month) / 12 ) - 2 ))
day_0=$(( ( $day + $x + 31 * $month_0 / 12 ) % 7 ))
echo $day_0
if [ 0 == $day_0 ] 
then 
       echo "Sunday"
elif [ 1 == $day_0 ]
then  
    # Print the value 
    echo "Monday"
elif [ 2 == $day_0 ]
then
   echo "Tuesday"
elif [ 3 == $day_0 ]
then
    echo "Wendsday"
elif [ 4 == $day_0 ]
then
    echo "Thursaday"
elif [ 5 == $day_0 ]
then
    echo "Friday"
elif [ 6 == $day ]
then
    echo "Saturday"
fi

