	filename=$1
	
	if [[ ! -f $1 ]]
	then
		echo "There is no text file named as ' $1 '"
		exit 1
	fi
	
	sayi=0
	sayi0=0
	sayi1=0
	sayi2=0
	sayi3=0
	sayi4=0
	sayi5=0
	sayi6=0
	sayi7=0
	sayi8=0
	sayi9=0
	sayac=0
	hata=0
	for(( i = 0 ; i <= 9 ; i++ ))
	do
		
		while read line ; 
		do
		# reading each line
		
			if [ ${#line} == 1 ]
			then
				printf -v num %d "'${line:0:1}"
				if [[ $num -gt 47 ]] && [[ $num -lt 58 ]]
				then
					if [[ $line -eq 0 ]] && [[ $line -eq $sayi ]]
					then
						sayi0=`expr $sayi0 + 1`
					elif [[ $line -eq 1 ]] && [[ $line -eq $sayi ]]
					then
						sayi1=`expr $sayi1 + 1`
					elif [[ $line -eq 2 ]] && [[ $line -eq $sayi ]]
					then			
						sayi2=`expr $sayi2 + 1`
					elif [[ $line -eq 3 ]] && [[ $line -eq $sayi ]]
					then			
						sayi3=`expr $sayi3 + 1`
					elif [[ $line -eq 4 ]] && [[ $line -eq $sayi ]]
					then
						sayi4=`expr $sayi4 + 1`
					elif [[ $line -eq 5 ]] && [[ $line -eq $sayi ]]		
					then
						sayi5=`expr $sayi5 + 1`
					elif [[ $line -eq 6 ]] && [[ $line -eq $sayi ]]
					then
						sayi6=`expr $sayi6 + 1`
					elif [[ $line -eq 7 ]] && [[ $line -eq $sayi ]]
					then
						sayi7=`expr $sayi7 + 1`
					elif [[ $line -eq 8 ]] && [[ $line -eq $sayi ]]
					then	
						sayi8=`expr $sayi8 + 1`		
					elif [[ $line -eq 9 ]] && [[ $line -eq $sayi ]]
					then			
						sayi9=`expr $sayi9 + 1`
					else
						continue
					fi
				elif [[ i -eq 0 ]]
				then
					echo -n "Error "
					echo $line
				fi
			elif [[ i -eq 0 ]]
			then
				echo -n "Error "
				echo $line
			fi
		
		done < ${filename//\"}
		sayi=`expr $sayi + 1`
	done
	
	echo ""
	
	echo -n "0"
	for (( i = 0 ; i < $sayi0 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "1"
	for (( i = 0 ; i < $sayi1 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "2"
	for (( i = 0 ; i < $sayi2 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "3"
	for (( i = 0 ; i < $sayi3 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "4"
	for (( i = 0 ; i < $sayi4 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "5"
	for (( i = 0 ; i < $sayi5 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "6"
	for (( i = 0 ; i < $sayi6 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "7"
	for (( i = 0 ; i < $sayi7 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "8"
	for (( i = 0 ; i < $sayi8 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
	echo -n "9"
	for (( i = 0 ; i < $sayi9 ; i++ ))
	do 
		echo -n "*"
	done
	echo ""
