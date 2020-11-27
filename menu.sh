question1()
{	
	echo -n "Enter File Name : "
	read filename
	./question1.sh $filename
}	

question2()
{
	echo -n "Enter string : "
	read fName
	echo -n "Enter number : "
	read number
	./question2.sh $fName $number
}

# Delete Oldest Program #
#-> user can give pathname like:
#	*file1/file2/
#	*file1
question3()
{
	echo -n "Will you give specific file name or path name ? (y / N )"
	read userParameterChoice
	pFlag="0"
	if [[ "$userParameterChoice" == y ]] || [[ "$userParameterChoice" == yes ]] || [[ "$userParameterChoice" == Y ]]
	then
		pFlag="1"
	fi
	#pFlag==0 means there will be no parameter
	if [[ "$pFlag" == 0 ]] 
	then
		./question3.sh
	else
		echo -n "Enter the file name or its path : "
		read path
		fullPath="${path}"
		./question3.sh $fullPath
	fi	
}

#change the numbers to text
question4()
{
	echo -n "Enter file name : "
	#read filename from user
	read filename
	./question4.sh $filename
}


# Question 5 -->>>

question5()
{	
	echo "Please make your choice: "
	echo "	Non-Recursive -> 0"
	echo "	Recursive     -> 1"
	echo -n "	Choice : "
	read userRChoice
	echo -n "Please give the file format : "
	read fileFormat
	#non-recursive case
	if [[ "$userRChoice" == 0 ]]
	then
		./question5.sh $fileFormat
	#recursive case
	elif [[ "$userRChoice" == 1 ]];
	then
		./question5.sh -R $fileFormat
	fi
}

	
# MAIN MENU
	
 while :
  do
     clear
     echo "-------------------------------------"
     echo " Main Menu "
     echo "-------------------------------------"
     echo "[1] Create histogram"
     echo "[2] Encryption"
     echo "[3] Delete oldest"
     echo "[4] Convert numbers"
     echo "[5] Organized files"
     echo "[6] Exit"
     echo "======================="
     echo -n "Enter your menu choice [1-6]: "
     read yourch
     case $yourch in
        1) question1 ; echo "Press a key. . ." ; read ;;
		2) question2 ; echo "Press a key. . ." ; read ;;
		3) question3 ; echo "Press a key. . ." ; read ;;
		4) question4 ; echo "Press a key. . ." ; read ;;
		5) question5 ; echo "Press a key. . ." ; read ;;
		6) exit 0 ;;
		*) echo "Opps!!! Please select choice 1,2,3,4,5 or 6";
		echo "Press a key. . ." ; read ;;
     esac
  done
