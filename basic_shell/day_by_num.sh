#!/bin/bash
# take the input number from user and print day
read -p "Enter the number between 0 to 6: " input
if [ $input == 0 ]; then
  echo "Sunday"
elif [ $input == 1  ]; then
  echo "Monday"
elif [ $input == 2 ]; then  
  echo "Tuesday" 
elif [ $input == 3 ]; then  
  echo "Wednsday" 
elif [ $input == 4 ]; then  
  echo "Thursday" 
elif [ $input == 5 ]; then  
  echo "Friday" 
elif [ $input == 6 ]; then  
  echo "Saturday"
else 
  echo "Invalid number" 
fi

