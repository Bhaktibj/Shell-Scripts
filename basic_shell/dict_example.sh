#!/bin/bash -x
# dictionary  opeartions like add key value pair, delete 
echo "List of the dict operations: "
echo "1. Declare dictionary"
echo "2. insert values in dict"
echo "3. insert values in single line"
echo "4. display dictionary key and values"
echo "5. delete key"
echo "6. get all keys"
echo "7. get all values"

read -p "Enter your choice: " ch

if (( $ch == 1 )); then
	function declare_array()
    	{
    		echo "declare array"
    		declare -A array
    	}
    	declare_array
elif (($ch == 2 )); then
    	function insert_values()
    	{
    		declare -A array
    		array[1]="one"
    		array[2]="two"
    		array[3]="three"
    		array[4]="four"
    		array[5]="five"
   		echo "Insert values in dict" 
   	}
   	insert_values
elif (($ch == 3)); then
   	function insert_values_single_line()
   	{
     		echo "insert values in single line: "
     		array1=([key1]=1 [key2]=2 [key3]=3 [key4]=5)
     		echo ${array1[@]}
   	}
   	insert_values_single_line

elif (($ch == 4)); then
   	function display_dict_values()
   	{
     		declare -A array
     		array[1]="one"
     		array[2]="two"
     		array[3]="three"

    		echo "display dictionary: " 
   		for i in ${!array[@]}; do
       			echo $i ${array[$i]}
   		done
   	}
   	display_dict_values

elif (($ch == 5)); then

    	function delete_key()
    	{
    		declare -A array
		array[1]="one"
		array[2]="two"
		array[3]="three"
		echo "display dictionary: " 
		for i in ${!array[@]}; do
  			echo $i ${array[$i]}
		done

		echo "delete key value: "
		unset array[1]
		echo "deleted key is: " array[1]
    	}
        delete_key

elif (($ch == 6)); then

	function get_all_keys()
	{
		declare -A array
		array[1]="one"
		array[2]="two"
		array[3]="three"
		array[4]="four"
		array[5]="five"
		echo "display dictionary: " 
		for i in ${!array[@]}; do
  			echo $i ${array[$i]}
		done
		echo "get all keys"
		echo ${!array[*]}
	}
        get_all_keys

elif (($ch == 7)); then

	function get_all_values()
	{
		declare -A array
		array[1]="one"
		array[2]="two"
		array[3]="three"
		array[4]="four"
		array[5]="five"

		echo "display dictionary: " 
		for i in ${!array[@]}; do
  			echo $i ${array[$i]}
		done
		echo "get all values"
		echo ${array[*]}
	}
       get_all_values
fi
