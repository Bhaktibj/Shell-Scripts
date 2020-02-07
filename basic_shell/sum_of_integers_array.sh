#sum of integers
read -p "enter the first number: " num1
read -p "enter the second number: " num2
read -p "enter the third number: " num3

count=0
sum=0
numbers[ (( count++ )) ]=$num1
numbers[ (( count++ )) ]=$num2
numbers[ (( count++ )) ]=$num3
echo "numbers " ${numbers[@]}
for num in ${numbers[@]}; do
    sum=`echo "scale=2; $sum + $num" | bc`
done
echo "sum of integers is: " $sum
