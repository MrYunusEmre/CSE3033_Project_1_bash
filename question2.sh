	
	if [[ -z $1 ]]
	then
		echo "Please run the program again with parameters"
		exit 1
	fi
	
	fName=$1
	#Checks if string includes non-letter char or not
	for ((i = 0; i < ${#fName}; i++))
	do
		printf -v num %d "'${fName:i:1}"
		if [[ $num -gt 96 ]] && [[ $num -lt 123 ]]
		then
		continue
		else
			echo "Your letters must be in between a-z"
			echo "Please run the program again.."
			return 1
		fi
	done
	
	number=$2
	#Checks the number is positive or not
	for ((i = 0 ; i < ${#number} ; i++))
	do
		printf -v num %d "'${number:i:1}"
		if [[ $num -gt 47 ]] && [[ $num -lt 58 ]]
		then
		continue
		else
			echo "Your number must be positive !!"
			echo "Please run the program again.."
			exit 1
		fi
	done
	#Checks the length of the number and string are equal or not
	if [ ${#fName} -ne ${#number} ] && [ ${#number} -ne 1 ]
	then
		echo "Wrong input format !!"
		echo "Please start the program again.."
		exit 1
	fi
	
	#Traverse all chars of string
	for ((i = 0; i < ${#fName}; i++))
	do
	if [ ${#number} -eq 1 ]
	then
		printf -v num %d "'${fName:i:1}"
		if [ `expr $num + $number` -gt 122 ]
		then
			num=`expr 96 +  $num + $number - 122`
		else
		(( num += $number))
		fi
		printf -v newchar \\$(printf '%03o' "$num")
		echo -n "$newchar"
	else
		printf -v num %d "'${fName:i:1}"
		printf -v numOfNumber %d "'${number:i:1}"
		printf -v newNumOfNumber \\$(printf '%03o' "$numOfNumber")
		if [ ` expr $num + $newNumOfNumber ` -gt 122 ]
		then
		num=`expr 96 +  $num + $newNumOfNumber - 122`
		else
		(( num += $newNumOfNumber ))
		fi
		printf -v newchar \\$(printf '%03o' "$num")
		echo -n "$newchar"
	fi
	done
echo ""	
