#!/bin/bash
# temperature conversion  using funtion and switch cases
read -p "Enter the temperature  "  temp
function  temp_con_cel()
{
   degC=$(( ($temp - 32) * 5 / 9 ))
   echo "The temperature in" $degC "degrees." 
}

function  temp_con_fara()   
{
   degF=$(( ($temp * 9/5) + 32 ))
   echo "The temperature in" $degF "degrees."
}

echo "F. Fahrenheit"
echo "C. Celsius"
read ch
case $ch in
   F)temp_con_fara 
   ;;
   C)temp_con_cel
   ;;
esac  
