#!/bin/bash -x
read -p "Enter the x value:" x
read -p "Enter the y value:" y
var=$(( $x * $x  + $y * $y ))
dist=$(( $var * $var ))
echo "distance is:" $dist
