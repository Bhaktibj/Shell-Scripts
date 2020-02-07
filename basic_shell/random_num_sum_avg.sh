count=0
sum=0
for i in {1..5};
do
random_number=$(( $RANDOM % 99 + 1 ))
random_num[ (( count++ )) ]=$random_number
done
echo "random numbers " ${random_num[@]}
for num in ${random_num[@]}; do
    sum=$(( $sum + num ))
done
avg=`echo "scale=2; $sum / 5" | bc` 
echo "sum 5 random number is: " $sum
echo "avg of random number is: " $avg

