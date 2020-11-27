current=""
fName=""
firstTime=0
#This function finds the oldest by using stat -c %Y $file"
deleteFunc()
{
	for file in *
	do
		if [ $firstTime -eq 0 ] && [[ "$file" == *.txt ]]
		then
			current=` stat -c %Y $file `
			fName=$file
			firstTime=1
		else
			temp=` stat -c  %Y $file `
			if [[ "$current" > "$temp" ]] && [[ "$file" == *.txt ]]
			then
				current=$temp
				fName=$file
			fi
		fi
		
	done
}

currentPath=$(cd `dirname ${0}`; pwd)

if [[ -z $1 ]]
then
	deleteFunc
#with parameter
else
	cd "$1"
	deleteFunc
fi
goExec="1"
if [[ "$fName" == "" ]]
then
	echo "There is not any txt file to delete!"
	goExec="0"
fi
if [[ "$goExec" == 1 ]] 
then
	echo -n "Do you want to delete $fName? (y/n)"
	read userChoice
	if [ $userChoice == "y" ] || [ $userChoice == "Y" ] || [ $userChoice == "yes" ] || [ $userChoice == "YES" ]
	then
	#delete txt
	rm $fName
	echo "The $fName is successfully deleted!"
	else
		echo "The $fName is not deleted."
	fi
fi
current=""
fName=""
firstTime=0
cd ${currentPath//\"}
