#!/bin/bash
NROWS=63
NCOLS=100

updateIndices()
{
	#declare -a colIndexNew
	L=${#colIndex[@]}
	#colIndexNewK=0
	#local colIndexSecond=0
		printf "before loop\n"
		printf "%s\n" ${colIndex[@]}
	local startIndex=1
	for ((colIndexK=0; colIndexK < L; colIndexK+=1))
	do
		((startIndex=2*colIndexK+1))
		colIndex=("$(( colIndex[2*colIndexK] - 1))" "$(( colIndex[2*colIndexK] + 1))" "${colIndex[@]:$startIndex}")
		printf "next itr\n"
		printf "%s\n" ${colIndex[@]}
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
	#if [[ $CURR_ROW == $(($NROWS - 1)) ]]; then
	#	return
	#fi
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
	((SIZE/=2))
	if [[ $ITER > 1 ]]; then
		recursiveTreePrint $SIZE $(($ITER-1))
	fi
	#	updateIndices ${colIndex[@]} 
	#	printRow ${colIndex[@]} $NCOLS
	#	recursiveTreePrint $((CURR_ROW+1)) $SIZE $PREVIOUS_SPLIT ${colIndex[@]}
	
	
}

printRow()
{
	local colIndexK=0
	#printf "printing row based on following colindices\n"
	#printf "%s\n" ${colIndex[@]}
	#local L=${#colIndex[@]}
	for ((coli=0; coli < $NCOLS; coli++ ))
	do
		#printf "colIndexK = %i\n" $colIndexK
		#printf "#colIndex[@] = %i\n" $L
		#printf "colIndex[colIndexK] = %i\n" ${colIndex[$colIndexK]}
		#printf "coli = %i\n" $coli
		if [[ ($colIndexK < ${#colIndex[@]}) && (${colIndex[$colIndexK]} = $coli)  ]]; then
			printf "%i" 1 
			((colIndexK++))
		else	
			printf "%s" '_'
		fi
	done
	printf "\n"
}

declare -ag colIndex
colIndexK=0
colIndex[$colIndexK]=49
firstSize=16
#printf "before updateIndices\n"
#printf "%s \n" ${colIndex[@]}
updateIndices
updateIndices
#printf "after updateIndices\n"
#printf "%s \n" ${colIndex[@]}
#recursiveTreePrint 0 $firstSize 4

