# prints the nth harmonic number
read -p "Enter the number: " num
res=0.0
i=1
while [ $i -le $num ]; do
echo "1/" $i "=" 
res=`echo "scale=2; $res + 1 / $i" | bc`
(( i++ ))
echo "the sum is : " $res
done
