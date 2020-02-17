#!/bin/bash -x
echo "Enter the value"
read value
echo "conversion is feet"
feet=`echo "scale=2; $value / 12" | bc` 
inch=`echo "scale=2; $feet * 12" | bc`
meter=`echo "scale=2; $feet /3.2808" | bc`
echo "conversion of inch into feet:(inch/12) " $feet "feet"
echo "conversion of feet into inch: (feet*12) " $inch "inch"
echo "conversion of feet into meter: (feet/3.3808) " $meter "meter"
