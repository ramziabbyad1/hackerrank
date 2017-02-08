#!/bin/bash
NROWS=63
NCOLS=100

updateIndices()
{
	declare -a colIndexNew
	L=${#colIndex[@]}
	colIndexNewK=0
	for ((colIndexK=0; colIndexK < L; colIndexK++))
	do
		colIndexNew[$colIndexNewK]=$(( ${colIndex[$colIndexK]} - 1 ))
		colIndexNew[$colIndexNewK+1]=$(( ${colIndex[$colIndexK]} + 1 ))
		((colIndexNewK+=2))
	done
	colIndex=("${colIndexNew[@]}")
}

adjustIndices()
{
	L=${#colIndex[@]}
	for ((colIndexK=0; colIndexK < L; colIndexK+=2))
	do
		colIndex[$colIndexK]=$(( ${colIndex[$colIndexK]} - 1))
		colIndex[$colIndexK+1]=$(( ${colIndex[$colIndexK+1]} + 1))
	done

}

recursiveTreePrint()
{
	local CURR_ROW=$1
	local SIZE=$2
	local ITER=$3
	if [[ $CURR_ROW == $(($NROWS - 1)) ]]; then
		return
	fi
	for ((printIndex=0; printIndex < SIZE; printIndex++))
	do
		printRow $NCOLS
	done
	updateIndices
	for ((printIndex=0; printIndex < SIZE; printIndex++))
	do
		printRow $NCOLS
		adjustIndices
	done
	((SIZE/=2))
	if [[ $ITER > 1 ]]; then
		recursiveTreePrint $(($CURR_ROW+1)) $SIZE $(($ITER-1))
	fi
	#	updateIndices ${colIndex[@]} 
	#	printRow ${colIndex[@]} $NCOLS
	#	recursiveTreePrint $((CURR_ROW+1)) $SIZE $PREVIOUS_SPLIT ${colIndex[@]}
	
	
}

printRow()
{
	local NCOLS=$1
	local colIndexK=0
	#printf "%s\n" ${colIndex[@]}
	for ((coli=0; coli < $NCOLS; coli++ ))
	do
		if [[ $colIndexK < ${#colIndex[@]} && ${colIndex[$colIndexK]} = $coli  ]]; then
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
#updateIndices ${colIndex[@]}
#printf "after updateIndices\n"
#printf "%s \n" ${colIndex[@]}
recursiveTreePrint 0 $firstSize 5

