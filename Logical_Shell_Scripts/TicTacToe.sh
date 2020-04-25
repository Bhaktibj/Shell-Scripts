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

