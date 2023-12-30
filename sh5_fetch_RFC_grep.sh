#!/bin/bash

# --------------------------------------------------------------
# 5. Fetch N random (N from command line argument)  RFC files, 
# print out the title of the RFCs and number of lines in the RFC.
# (https://www.rfc-editor.org/rfc-index.txt)

# Usage example: sh sh5_fetch_RFC_grep.sh 1208 1217
# --------------------------------------------------------------

if [ "$#" -eq 2 ]; then

	num1=$(echo "$1" | egrep -o '[0-9]+')
	num2=$(echo "$2" | egrep -o '[0-9]+')

	# if both parameters are numbers:
	if [ "$num1" = "$1" ] && [ "$num2" = "$2" ]; then

		if [ "$1" -lt "$2" ]; then
			start=$1; end=$2
		else
			start="$2"; end="$1"   # swap variables if not in order
		fi

		echo "Fetching $(($end-$start+1)) RFC files to /tmp/ ..."
		echo "File		| Number of lines | Title of RFC file"

		i=$start
		while [ $i -le $end ]
		do						
			# store the RFC to /tmp
			curl -s -o /tmp/rfc"$i"-tmp.txt https://www.ietf.org/rfc/rfc"$i".txt

			# `title=$(egrep "^RFC $i " /tmp/rfc"$i"-tmp.txt| head -1)` only works for part of the RFCs, greater than 1100 and smaller than 8650					
			# `title=$( curl -s https://www.rfc-editor.org/rfc-index.txt | egrep ^0{0,3}"$i " | cut -d'.' -f1 | egrep -o [^0-9]+)` doesn't work well if the title is too long(no dot) or there is any dot inside the title.
			# I haven't found a better way to extract the title.				
			title=$( curl -s https://www.rfc-editor.org/rfc-index.txt | egrep ^0{0,3}"$i " | cut -d'.' -f1 | egrep -o [^0-9]+)

			if [ -z "$title" ]; then
				# inform the user that file not found
				echo "rfc"$i".txt\t FILE NOT FOUND"
				rm /tmp/rfc"$i"-tmp.txt
			else			
				num_lines=$(cat /tmp/rfc"$i"-tmp.txt | wc -l)
				# print out the title and number of lines
				echo "rfc"$i"-tmp.txt\t $num_lines\t\t    $title"
			fi
			
			i=$(($i+1))
		done	

	else
		echo "Please give two INTEGERs as parameters.\nI will print out the title of the RFCs and number of lines in the RFC."
	fi
else
	echo "Please specify TWO integers(1100~8649) as parameters.\nI will print out the title of the RFCs and number of lines in the RFC."
fi
