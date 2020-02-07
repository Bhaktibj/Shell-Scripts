# Take a range from 0 – 100, find the digits that are repeated twice like 33, 77, etc and store them in an array
count=0
for i in {0..100};
do
array1[ (( count++ )) ]=$i
done

array2=( 1 11 22 33 44 55 66 77 88 99 )

array3=()
for i in ${array1[@]}; do
   for j in ${array2[@]}; do
       if (( $i == $j )); then
           array3[ (( count++ )) ]=$i
       fi
   done
done
echo "repeated twice numbers like 33 ,11: " ${array3[@]}
