tail=0
head=0
count=1
read -p "enter the flip value" flip

if (( $flip > 0 ))
then
    while [ $count  <  $flip ];
    do
      random_number=$(( $RANDOM % 0 + 1 ))
      if (( $random_number -lt 0.5 )); then
         (( tail++ ))
      else
         (( head++ ))
      (( count++ ))
      fi
    done
else
   echo "check number is positive or not"
fi
headper=`echo "scale=2; $head * 100 / $flip" | bc`
tailper=`echo "scale=2; $tail * 100 / $flip" | bc`
echo "head:" $headper
echo "tail:" $tailper

