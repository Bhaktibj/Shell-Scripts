count=0
first_max=0
second_max=0

for i in {1..10};
do
random_number=$(( $RANDOM % 999 + 100 ))
random_num[ (( count++ )) ]=$random_number
done
echo "random numbers " ${random_num[@]}
for num in ${random_num[@]}; do
    if (( $num > $first_max )); then 
        second_max=$first_max;
        first_max=$num;
    elif (( $num > $second_max )) && (( $num -ne $first_max ));
        then
        second=$num
       break
    fi
done
echo "first largest number is: " $first_max
echo "second largest number is: " $second_max
