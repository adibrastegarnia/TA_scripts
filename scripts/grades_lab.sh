#!/bin/bash

grades_file="lab1_grades.tsv"
#grades_dir="/homes/rkarandi/TA/summer17/cs240/grades/tmp_grades/"
grades_dir="/u/data/u3/park/pub/cs240/grades/"

i=0
while read -r line
do
	i=`expr $i + 1`

	if [ $i -eq 1 ]
	then
		continue
	fi

	cat $grades_file | head -n ${i} | tail -1 > tfile

	student=`cat tfile | gawk 'BEGIN { FS = "\t" } ; { print $1 }'`
	echo $student

	#mkdir -p tmp_grades/${student}/
	#echo $student > tmp_grades/${student}/lab1.rpt
	#continue

	echo -e "\nGrade for lab1" >> ${grades_dir}/${student}/lab1.rpt

	cat tfile | gawk 'BEGIN {FS = "\t"} ; {

		printf "\nProblem 1: %d/20\n", $2
		if ($3 != "")
			printf "Comment: %s\n", $3
		printf "Graded by: Varshali Kumar (kumar261@purdue.edu)\n"

		printf "\nProblem 2: %d/20\n", $4
		if ($5 != "")
			printf "Comment: %s\n", $5
		printf "Graded by Varshali Kumar (kumar261@purdue.edu)\n"

		printf "\nProblem 3: %d/30\n", $6
		if ($7 != "")
			printf "Comment: %s\n", $7
		printf "Graded by Adib Rastegarnia (arastega@purdue.edu)\n"

		printf "\nProblem 4: %d/20\n", $8
		if($9 != "")
			printf "Comment: %s\n", $9
		printf "Graded by Adib Rastegarnia (arastega@purdue.edu)\n"

		printf "\nProblem 5: %d/40\n", $10
		if($11 != "")
			printf "Comment: %s\n", $11
		printf "Graded by Adib Rastegarnia (arastega@purdue.edu)\n"

		printf "\nProblem 6: %d/15\n", $12
		if($13 != "")
			printf "Comment: %s\n", $13
		printf "Graded by Rajas Karandikar (rkarandi@purdue.edu)\n"

		printf "\nBonus: %d/15\n", $14
		if ($15 != "")
			printf "Comment: %s\n", $15
		printf "Graded by Rajas Karandikar (rkarandi@purdue.edu)\n"

		printf "\nTotal: %d/145\n", $16

		printf "\nTotal (with early submission credit): %.1f/145", $18

	}' >> ${grades_dir}/${student}/lab1.rpt

done < $grades_file

echo "Total: $i"
