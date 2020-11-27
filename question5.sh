#This method is used for the current directory
fileCopied()
{
	p1="$1"

	haveCopied="0"
	for file in *
	do
		if [[ "$file" == copied ]]
		then
			haveCopied="1"
		fi
	done
	
	haveCFile="0"
	for files in *
	do
		if [[ "$files" == ${p1//\"} ]]
		then
			haveCFile="1"
		fi
	done
	
	if [[ "$haveCopied" == 0 ]] && [[ "$haveCFile" == 1 ]]
	then
		mkdir copied
	fi
	haveCopied="0"
	
	for file in *
	do
		if [[ "$file" == ${p1//\"} ]]
		then
			cp $file copied
		fi
	done
	return 0
}

#This method is used by recursive part 
copyIntoFile()
{
		p1="$1"
		p2="$2"
		p3="$3"
		cd ${p1//\"}
		haveCopied="0"
		for files in *
		do
			if [[ "$files" == copied ]]
			then
				haveCopied="1"		
			fi
		done
		haveCFile="0"
		for files in *
		do
			if [[ "$files" == ${p3//\"} ]]
			then
				haveCFile="1"
			fi
		done
		
		if [[ "$haveCopied" == "0" ]] && [[ "$haveCFile" == "1" ]]
		then
			mkdir copied
		fi
		
		for files in *
		do
			if [[ "$files" == ${p3//\"} ]]
			then
				cp $files copied
			fi
		done
			
		haveCopied="0"
		haveCFile="0"
		cd ${p2//\"}
}

#non recursive case
if [[ -z $2 ]];
then
	fileCopied "$1"
#recursive
elif [[ "$1" == "-R" ]];
then
	p3="$2"
	currentPath=$(cd `dirname ${0}`; pwd)
	fileCopied "$p3"
	
	#Recursive Call
	shopt -s globstar
	for i in ./**/*
	do
		if [ -d "$i" ];
		then		
			if [[ ${i##*/} == copied ]]
			then
			continue
			fi
			copyIntoFile "$i" "$currentPath" "$p3"
		fi
	done
else
	echo "Please check your parameters!!"
fi
