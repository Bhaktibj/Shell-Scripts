#!/bin/bash -x
echo "Welcome to Tic tac toe Game"
declare -a board # initalize board array
#constants
HEAD=1;
TAIL=0;
GAMESTATUS=1
NUMBEROFROWS=3;
NUMBEROFCOLUMNS=3;
BOARD_POSITION=10;
playerTurn=false
winner=false
turn=0
player=''
computer=''
nonEmptyCount=1
computerP=0
playerP=0
compWinMove=false
function boardInitialize(){   # This method is used to intialize the board

	for (( i=1 ; i<=$BOARD_POSITION; i++ ))  # for loop started by 1
	do
		board[$i]=0   # board of i assign 0
	done
}

function  printBoard(){  # this function is used to print the board
	echo " -------------"
	echo " | "${board[1]}" | "${board[2]}" | "${board[3]}" | "
	echo " -------------"
	echo " | "${board[4]}" | "${board[5]}" | "${board[6]}" | "
	echo " -------------"
	echo " | "${board[7]}" | "${board[8]}" | "${board[9]}" | "
	echo " -------------"

}

function cornerCheck()   # this method is used to corner check
{
	 if [ $compWinMove = false ]   # assign computer win move equal to false and check is it false or not
   then
		for((i=1; i<=BOARD_POSITION; i=$(($i+2)) ))   # loop start from 1  i less than board position
		do
		if [ ${board[$i]} == '-' ] #  check board of i is equal to -
		then    # then
			computerP=$i   # assign computer player = $ i
            	board[$computerP]=$computer   # assign board of computer = computer
            	compWinMove=true   # assign computer move = True
            break   # break
				fi  # close loop
				if [ $i -eq 3 ]  # again check $i is equal to 3 if yes
				then
					i=$(($i+2))   # i = i+2
				fi
		done
	fi
}

function middleCheck()    # this function is used to check middel
{
	middle=5   # middle = 5
	if [[ $compWinMove = false ]] && [[ ${board[$middle]} == '-' ]] # assign Computer win move = false and board of middle == '-'
	then
		computerP=$middle   # then computer player equal middle
               board[$computerP]=$computer # board of cuomputer player = computer
               compWinMove=true # computer win move equal True
   fi

}

function randomCheck(){    # this function is used to check random input
	 if [ $compWinMove = false ]   # computer win move assign false if it True
	 then
                for((i=2; i<=BOARD_POSITION; i=$(($i+2)) )) # Then i = 0 and check i <= Board position or not increament i+2
                do
                if [ ${board[$i]} == '-' ]  # board[i] = '-'
                then                  # then
                        computerP=$i # computer player assign = i
                board[$computerP]=$computer # board of computer = computer
                compWinMove=true # computer win move equal to true
                break   # break
                 fi   # if close
                  if [ $i -eq 3 ] || [ $i -eq 6 ] # i is equal to 3 or i is equal to 6
                  then
                          i=$(($i+1))  # then i is equal to i is increament by 1
                  fi    # close if
                done   #
        fi


}


function checkHorizontalCase(){   # This method is used to check horizontal case

	numberOfRows=3  # number of rows is 3
	position=1  # position = 1
	counter=1  # counter = 1
	while [ $counter -le 3 ]  # check coutnter is until less than or equal to 3
	do
		if [[ ${board[$position]} == ${board[$position+1]} ]] && [[ ${board[$position+1]} == ${board[$position+2]} ]] && [[ ${board[$position+2]} == $1 ]]
		then
			printBoard
			echo "$1 wins"   # print boards
			winner=true  # winner equal to true
			break  # break
		else
			position=$(( $position+$numberOfRows ))   # position equal to postion + number of rows
		fi   # close if
	counter=$(( $counter+1 ))   # counter = counter increament by 1
	done
}

function checkVerticalCase(){   #  This method is used to check the vertical case
	numberOfRows=3  # number of rows
	position=1  # postion is 1
	counter=1  # counter started by 1
	while [ $counter -le 3 ]  # while loop -- counter is less than or equal to 3
	do
	  # check board of position is equal to board of postion 3 and so on
		if [[ ${board[$position]} == ${board[$position+3]} ]] && [[ ${board[$position+3]}  ==  ${board[$position+6]} ]] && [[ ${board[$position+6]} == $1 ]]
		then
			printBoard
			echo "$1 Wins"  # print board
			winner=true # and winner equal to true
			break  # break
		else   # else
			position=$(( $position+1 ))  # else position assign position increament by 1
		fi   # close if loop
	counter=$(( $counter+1 ))  # assign counter
	done
}

function checkDiagonalCase()  # This method is used to check diagnol case
{
	position=1 # position is assign 1
	counter=1  # counter is assign 1
	while [ $counter -le 2 ]  # check in while counter is less than or equal to 2
	do
	  # check  if board of position is equal to board of position 4 and position 4 is equal to position 8 so on..
		if [[ ${board[$position]} == ${board[$position+4]} ]] && [[ ${board[$position+4]}  ==  ${board[$position+8]} ]] && [[ ${board[$position+8]} == $1 ]]
		then # then
			printBoard
			echo " $1 wins "  # print wins
			winner=true # winner = true
			break  # break
			# else if check board of position increament by 2 is equal to position increament by 4
		elif [[ ${board[$position+2]} == ${board[$position+4]} ]] && [[  ${board[$position+4]}  ==  ${board[$position+6]} ]] && [[ ${board[$position+6]} == $1 ]]
		then  #  print  Board
			printBoard
			echo " $1 wins "
			winner=true
			break
		fi
		counter=$(($counter+1))
	done
}

function checkTieCase(){  # this method is used check the game is tie

	while [ ${board[$nonEmptyCount]} != 0 ] # check while board of non empty count is not equal to 0
	do
		if [ $nonEmptyCount -eq 9 ]   # check non empty count is equal to 9
		then
			printBoard   # then printBoard
			echo "Game Is Tie"  # game is tie
			winner=true   # assign winner equal to True
			break     # braek
		else
			nonEmptyCount=$(($nonEmptyCount+1))  # else assign non Empty count equal to non empty count + 1
		fi
	done

}

function checkWinningMoveComputer(){  # This method is used to check Winning Move
	counter=1  # counter is equal to 1
	winMove=false  # Win move equal to false

	for (( i=1; i<=3; i++ ))  # for i = 1 and i< = 3
	do   # check borad of counter is equal to board of counter + $1 + $1
		if [[ ${board[$counter]} == ${board[$counter+$1+$1]} ]] && [[ ${board[$counter+$1]} == 0 ]] &&[[ ${board[$counter]} == $computer ]]
		then
			computerP=$(( $counter+$1 )) # check computer player equal to counter + 1
			echo " winning move is " $computerP # winning move is computer
			board[$computerP]=$computer # board of computer player equal to computer
			winMove=true # win move is equal to True
			break  # break
			# else if check borad of counter == board of counter + 1  and board of counter + $1 + $1 is equal to 0
		elif [[ ${board[$counter]} == ${board[$counter+$1]} ]] && [[ ${board[$counter+$1+$1]} == 0 ]] && [[ ${board[$counter]} == $computer ]]
		then
			computerP=$(( $counter+$1+$1 )) # assign computer player equal to counter increament by counter + $1 + $1
			echo "winning move is " $computerP  # winner is computer
			board[$computerP]=$computer  # assign board of  computer equal to computer
			winMove=true  # win move equal to True
			break
		elif [[ ${board[$counter+$1]} == ${board[$counter+$1+$1]} ]] && [[ ${board[$counter]} == '-' ]] && [[ ${board[$counter+$1]} == $computer ]]
		then
			computerP=$counter
			echo "winning move is " $computerP
			board[$computerP]=$computer
			winMove=true
			break
		fi
	counter=$(( $counter+$2 ))
	done
}

function checkWinningMovePlayer(){  # This method is used to check Winning move player
        counterPlayer=1  # counter player is equal to 1
        winMovePlayer=false
        for (( i=1; i<=3; i++ )) # for loop i = 1 and i < =3
        do
                if [[ ${board[$counterPlayer]} == ${board[$counterPlayer+$1+$1]} ]] && [[ ${board[$counterPlayer+$1]} == 0 ]] &&[[ ${board[$counterPlayer]} == $player ]]
                then
                        playerP=$(( $counterPlayer+$1 ))
                        echo "player winning move is " $playerP
                        board[$playerP]=$player
                        winMovePlayer=true
                        break
                elif [[ ${board[$counterPlayer]} == ${board[$counterPlayer+$1]} ]] && [[ ${board[$counterPlayer+$1+$1]} == 0 ]] && [[ ${board[$counterPlayer]} == $player ]]
                then
                        playerP=$(( $counterPlayer+$1+$1 ))
                        echo "player winning move is " $playerP
                        board[$playerP]=$player
                        winMovePlayer=true
                        break
                elif [[ ${board[$counterPlayer+$1]} == ${board[$counterPlayer+$1+$1]} ]] && [[ ${board[$counterPlayer]} == '-' ]] && [[ ${board[$counterPlayer+$1]} == $player ]]
                then
                        playerP=$counter
                        echo "player winning move is " $playerP
                        board[$playerP]=$player
                        winMovePlayer=true
                        break
                fi
        counterPlayer=$(( $counterPlayer+$2 ))
        done
}

function userInput() {   # This method is used to user input
	row=1    # row equal to 1
	column=3  # column equal to 3
	winMovePlayer=false  # player win move = false
	read -p "Enter you position in between 1 to 9: " POSITION  # enter the position
	checkWinningMovePlayer $row $column    # check winning move  player in row and column
        checkWinningMovePlayer $column $row
	if [ $winMovePlayer == false ] # if win move player equal to false
	then   # then
		if [ ${board[$POSITION]} -eq $TAIL ]   # check if board of postion equal to TAIL
		then    # then
			echo "player turn"
			board[$POSITION]=$player   # board of position = player
			printBoard   # print board
			turn=$(( $turn + 1 ))  # turn = turn increament by 1
		else
			echo "Invalid input"   # invalid input
			userInput # user input
		fi
	fi
		playerTurn=false  # player turn equal to false

}


function computerInput(){   # This method is used to check computer input
	row=1  # row equal to 1
	column=3  # column equal to 3
	winMove=false  # win move equal to False

	echo "Computer is Playing"   # computer is playing
	checkWinningMoveComputer $row $column   # call winning move computer
	checkWinningMoveComputer $column $row  # call winning move computer
	cornerCheck # call corner check
	middleCheck # call middle check function
	randomCheck  # call random check function
	POSITION=$((RANDOM%9+1))  # position equal to random 9+1

	if [ $winMove == false ]  # check win move equal to false
	then   # then
		if [ ${board[$POSITION]} == $TAIL ]  # check board of position equal to tail
		then   # then
			board[$POSITION]=$computer   # board of position assign computer
		else
			echo "Wrong move "
			computerInput  # wrong computer input
		fi
	fi
		playerTurn=true # player turn equal to true
}


function ticTacToe(){    # This method is used toe tictact

	checkingToss=$((RANDOM%2))  # assign checktoss eqaual to Random%2
	if [[ $checkingToss -eq $HEAD ]]  # check if chekingtoss is equal to HEAD means 1
	then
		playerTurn=true  # then player turn assign true
		player='X'  # player X
		computer='O' # and computer 'o'
		echo "Player play first"
		printBoard  # call printboard
	else
		player='X'  # else player = 'X'
		computer='O'  # else player 'O'
		echo "computer play first"
	fi
}

boardInitialize # call board initialize funstion
ticTacToe # call tictactoe

while [ $winner == false ]  # while winner equal to false
do

		printBoard # print board
		if [ $playerTurn == true ]  # check if playerTurn == True
		then  # then
			userInput  # call user input
			checkHorizontalCase $player   # check horizontal case and pass player input
			checkVerticalCase $player # check Vertical case and pass player input
			checkDiagonalCase $player # pass player input and check
			checkTieCase $player # check tie case
		else  # else
			computerInput  # computer input
			checkHorizontalCase $computer  # pass computer input and check horizontal case
      checkVerticalCase $computer # pass computer input and  check Vertical case
      checkDiagonalCase $computer # pass computer input and check Diagonal case
			checkTieCase $computer  # pass computer input and check Tie case
		fi
done