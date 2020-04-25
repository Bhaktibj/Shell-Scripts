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




