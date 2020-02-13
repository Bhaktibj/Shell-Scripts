# perform airthmatic operations and find min and max result
echo "Enter the first number"
read num1
echo "Enter the second number"
read num2
echo "Enter the third number"
read num3
echo "first operation: (num1 + num2 * num3)"
result1=$(( $num1 + $num2 * $num3 ))
echo $result1 
echo "second opeartion: (num1 % num2 +num3)"
result2=$(( $num1 % $num2 + $num3 ))
echo $result2
echo "third operation: (num3 + num1 / num2)"
result3=$(( $num3 + $num1 / $num2 ))
echo $result3
echo "fourth operation: (num1 * num2 + num3)"
result4=$(( $num1 * $num2 + $num3))
echo $result4
count=0
min=0
max=0
results[ (( count++ )) ]=$result1
results[ (( count++ )) ]=$result2
results[ (( count++ )) ]=$result3
results[ (( count++ )) ]=$result4
echo "results is: " ${results[@]}
for result in ${results[@]}; do
    if (( $result > $max )); then max=$result; fi;
    if (( $result < $max )); then min=$result; fi;
done
echo "maximum result is :" $max
echo "minimum result is :" $min

