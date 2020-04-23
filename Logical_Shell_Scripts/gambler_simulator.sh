#!/bin/bash -x
var="Welcome to Gambler simulator program" # print it
echo "$var" # Another way of printing it

INITIAL_STAKE=100; # initial stake
DAY=30;  # number of days
BET=1; # inialize bet
WIN=1; # inialize win = 1
LOSS=0; # inializze loss = 0
PERCENTAGE_STAKE=50; # percentage of stake 50
winCount=0; # inialize win count =0
finalDailyAmount=0; # filnal  daily amount = 0
windailyAmount=0;   # win daily amount
lossdailyAmount=0; # daily loss amount
lossCount=0;  # loss count
winningCondition=$(( $INITIAL_STAKE + $(( $INITIAL_STAKE / 100 * $PERCENTAGE_STAKE )) ))  # calculate winning condition
loosingCondition=$(( $INITIAL_STAKE - $(( $INITIAL_STAKE / 100 * $PERCENTAGE_STAKE )) )) # calculate lossing condition
declare -A gamblerAmount   # diclare gambler amount
declare -A gamblerSimulator  # declare gambler simulator
function gamblerFunction(){   # define gambler function
while [ $finalDailyAmount -ge $LOSS ]  # check till final daily amount is greater than loss
do
	for (( dayCount=1; dayCount<=DAY; dayCount++ )) # start for loop with 1
	do
		finalStake=$INITIAL_STAKE; # assign  finalstake == initial stake

		while [ $finalStake -lt $winningCondition ] && [ $finalStake -gt $loosingCondition ] # check final stake is less than winning
		# condition and final stake is greater than loosing condition
		do
			randomBitCheck=$((RANDOM%2))  # check randomBit  check
			if [[ $randomBitCheck -eq $1 ]] # check if random bit is equal to 1
			then
				finalStake=$(( $finalStake + $BET )) # then finalstake = finalstake + BET value
			else
				finalStake=$(( $finalStake - $BET )) # else finalstake = finalstake - BET value
			fi   # close if loop
		done  # close done loop
		dailyAmount=$(( $finalStake - $INITIAL_STAKE ))  # calculate daily amount
		finalDailyAmount=$(( $finalDailyAmount + $dailyAmount )) # calculate final daily amount
		gamblerAmount[$dayCount]=$dailyAmount # calculate gamblerAmount
		gamblerSimulator[$dayCount]=$finalDailyAmount
		totalGamblerAmount=$(( $totalGamblerAmount + $dailyAmount )) # calculate total gambler amount
	done # done while loop

	echo "gambler resigned for the day"

	for data in "${!gamblerAmount[@]}"   # for data in gambler amount
	do
		if [[ ${gamblerAmount[$data]} -lt $LOSS ]] # check if gambler amount[data] is less than LOSS
		then
			lossCount=$(( $lossCount + 1 ))   # then lossCount = lossCount + 1
			lossdailyAmount=$(( $lossdailyAmount + ${gamblerAmount[$data]} )) # and daily loss amount == loss daily amt + gambler amt of [data]
		else  # else
			winCount=$(( $winCount + 1 )); # wincount = wincount + 1
			windailyAmount=$(( $windailyAmount + ${gamblerAmount[$data]} )) # daily win amount = daily win amt + gambler[data]

		fi # close if loop
	done  # close for loop
		luckiestValue=$( printf "%s\n" ${gamblerSimulator[@]} | sort -nr | head -1 )
		# calculate luckiest values using  array or sort or head = -1
		unluckiestValue=$( printf "%s\n" ${gamblerSimulator[@]} | sort -nr | tail -1 )

	findDayOfLuckyAndUnlucky "$luckiestValue" "$unluckiestValue"  # find of lucky or unlucky day
done
}

function findDayOfLuckyAndUnlucky(){     # this method is used to find the lucky and unlucky day
		for data in "${!gamblerSimulator[@]}"  # find data in gamblerSimulator array
    do
      if [[ ${gamblerSimulator[$data]} -eq $1 ]] # if gamblerSimulator of data is equal to 1
      then
        echo "lucky Day" $data # then it is lucky day
      elif [[ ${gamblerSimulator[$data]} -eq $2 ]]   # if gamblerSimulator of data is equal to 2
      then
        echo "unlucky Day" $data # then it is unlucky day

      fi # close if loop
    done # close  for loop
}

gamblerFunction $(($WIN))  # call gambler function and pass WIN variable