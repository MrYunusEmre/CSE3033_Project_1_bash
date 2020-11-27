	#read filename from user
	filename=$1
	if [[ ! -f $1 ]]
	then
		echo "There is no text file named as ' $1 '"
		exit 1
	fi
	
	# after this part , the program looks all 0's in the text and change all of
	# them with zero and write it to new text file named as f1.txt , after that
	# program looks all 1's in f1.txt and change all of them with 'one' and write
	# it to f2.txt and delete f1.txt and go on like that to 9 .
	awk '{gsub(0,"zero",$0);print $0}' $filename > f1.txt
	awk '{gsub(1,"one",$0);print $0}' f1.txt > f2.txt
	rm f1.txt
	awk '{gsub(2,"two",$0);print $0}' f2.txt > f3.txt
	rm f2.txt
	awk '{gsub(3,"three",$0);print $0}' f3.txt > f4.txt
	rm f3.txt
	awk '{gsub(4,"four",$0);print $0}' f4.txt > f5.txt
	rm f4.txt
	awk '{gsub(5,"five",$0);print $0}' f5.txt > f6.txt
	rm f5.txt
	awk '{gsub(6,"six",$0);print $0}' f6.txt > f7.txt
	rm f6.txt
	awk '{gsub(7,"seven",$0);print $0}' f7.txt > f8.txt
	rm f7.txt
	awk '{gsub(8,"eight",$0);print $0}' f8.txt > f9.txt
	rm f8.txt
	awk '{gsub(9,"nine",$0);print $0}' f9.txt > f10.txt
	rm f9.txt
	cp f10.txt $filename
	rm f10.txt
