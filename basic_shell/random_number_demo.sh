# print single digit random number
#!/bin/bash
echo "display random numbers:" $(($RANDOM % 20))
echo $RANDOM

echo "display random number between 1 to 6:"
random_number=$(($RANDOM % (1 - 6 + 1) + 1))
echo "random number is:" $random_number




