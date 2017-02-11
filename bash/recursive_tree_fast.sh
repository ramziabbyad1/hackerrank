#!/bin/bash
NROWS=63
NCOLS=100

ansString=''
updateIndices()
{
	#declare -a colIndexNew
	L=${#colIndex[@]}
	#colIndexNewK=0
	#local colIndexSecond=0
		#printf "before loop\n"
		#printf "%s\n" ${colIndex[@]}
	local startIndex=0
	for ((colIndexK=0; colIndexK < L; colIndexK+=1))
	do
		((startIndex=2*colIndexK+1))
		colIndex=("${colIndex[@]:0:2*$colIndexK}" "$(( colIndex[2*colIndexK] - 1))" "$(( colIndex[2*colIndexK] + 1))" "${colIndex[@]:$startIndex}")
		#printf "next itr\n"
		#printf "%s\n" ${colIndex[@]}
		#colIndex[$colIndexNewK]=$((  $colIndexOld - 1 ))
		#colIndex[$(( $colIndexNewK+1 ))]=$((  + 1 ))
		#((colIndexNewK+=2))
	done
	#colIndex=("${colIndexNew[@]}")
	#printf "updated indices to: \n"
	#printf "%s\n" ${colIndex[@]}
}

adjustIndices()
{
	L=${#colIndex[@]}
	for ((colIndexK=0; colIndexK < L; colIndexK+=2))
	do
		colIndex[$colIndexK]=$(( ${colIndex[$colIndexK]} - 1))
		colIndex[$(( $colIndexK+1 ))]=$(( ${colIndex[$colIndexK+1]} + 1))
	done
	#printf "adjusted indices to: \n"
	#printf "%s\n" ${colIndex[@]}

}

recursiveTreePrint()
{
	local SIZE=$1
	local ITER=$2
	local CURR_ROW=$3
	#if [[ $CURR_ROW == $(($NROWS - 1)) ]]; then
	#	return
	#fi
	#printf "size = %i\n" $SIZE
	for ((printIndex=0; printIndex < SIZE; printIndex++))
	do
	#	echo 
		printRow
	done
	updateIndices
	for ((printIndex=0; printIndex < SIZE; printIndex++))
	do
		printRow
		adjustIndices
	done
	if [[ $ITER > 1 ]]; then
		((SIZE/=2))
		recursiveTreePrint $SIZE $(($ITER-1)) $(($CURR_ROW + $SIZE*4))
	else
		local colString='____________________________________________________________________________________________________\n'
		for ((rowi=CURR_ROW; rowi < 63; rowi++ ))
		do
			ansString="$colString$ansString"
		done
	fi
	#if [[ $ITER == 1 ]]; then
	#	echo "last row again"
	#	printRow
	#fi
	#	updateIndices ${colIndex[@]} 
	#	printRow ${colIndex[@]} $NCOLS
	#	recursiveTreePrint $((CURR_ROW+1)) $SIZE $PREVIOUS_SPLIT ${colIndex[@]}
	
	
}

printRow()
{
	#printf "printing row based on following colindices\n"
	#printf "%s\n" ${colIndex[@]}
	local L=${#colIndex[@]}
	local colString='____________________________________________________________________________________________________\n'
	for ((coli=0; coli < L; coli++ ))
	do
		colString=`echo $colString | sed s/./1/${colIndex[$coli]}`
		#colString[${colIndex[$coli]}]=1
	done
	#printf "%s\n" $colString
	ansString="$colString""$ansString"
	#printf $ansString
}
printRowOld()
{
	local k=0
	#printf "printing row based on following colindices\n"
	#printf "%s\n" ${colIndex[@]}
	#local L=${#colIndex[@]}
	for ((coli=0; coli < 100; coli++ ))
	do
		printf "colIndexK = %i\n" $k
		printf "#colIndex[@] = %i\n" ${#colIndex[@]}
		printf "colIndex[colIndexK] = %i\n" ${colIndex[$k]}
		printf "coli = %i\n" $coli

		if [[ ($k < ${#colIndex[@]}) && (${colIndex[$k]} = $coli)  ]]; then
			printf "%i" 1 
			((k++))
		else	
			printf "%s" '_'
		fi
	done
	printf "\n"
}

declare -ag colIndex
colIndexK=0
colIndex[0]=49
firstSize=16
#printf "before updateIndices\n"
#printf "%s \n" ${colIndex[@]}
#updateIndices
#adjustIndices
#adjustIndices
#adjustIndices
#adjustIndices
#updateIndices
#adjustIndices
#adjustIndices
#adjustIndices
#updateIndices
#adjustIndices
#adjustIndices
#adjustIndices
#adjustIndices
#updateIndices
#printRow
#printf "after updateIndices\n"
#printf "%s \n" ${colIndex[@]}
recursiveTreePrint 16 5 0
echo -e "$ansString"
#printRow

