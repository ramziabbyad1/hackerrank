#!/bin/bash
NROWS=63
NCOLS=100

updateIndices
{
	colIndexOld=("")
}

recursiveTreePrint()
{
	colIndex=("$@")
	local CURR_ROW=${colIndex[0]}
	local SIZE=${colIndex[1]}
	local COLINDEX_K=${colIndex[2]}
	unset colIndex[0]
	unset colIndex[1]
	unset colIndex[2]
	#printf "%s\n" "${colIndex[@]}"
	#printf "%s\n" "$CURR_ROW"
	#printf "%s\n" "$SIZE"
	if [[ $CURR_ROW = $SIZE ]]; then
		printf "%s\n" 'perform split'
		updateIndices ${colIndex[@]} ${colIndex[@]} 
	else 
		printRow ${colIndex[@]} $COLINDEX_K $NCOLS
		recursiveTreePrint $((CURR_ROW+1)) $SIZE $COLINDEX_K ${colIndex[@]}
	fi
	
}

printRow()
{
	colIndex=("$@")
	((last_idx=${#colIndex[@]}-1 ))
	local NCOLS=${colIndex[last_idx]}
	unset colIndex[last_idx]
	((last_idx--))
	local colIndexK=${colIndex[last_idx]}
	unset colIndex[last_idx]

	for ((coli=0; coli < $NCOLS; coli++ ))
	do
		if [[ ${colIndex[$colIndexK]} = $coli ]]; then
			printf "%i " 1 
			((colIndexK++))
		else	
			printf "%s " '-'
		fi
	done
	printf "\n"
}

declare -a colIndex
colIndexK=0
colIndex[$colIndexK]=49
firstSize=16
recursiveTreePrint 0 $firstSize $colIndexK ${colIndex[@]}
#printRow "${colIndex[@]}" "$colIndexK" "$NCOLS" 

#START_ROW=0
#START_COL=49
#SIZE=16
#read COUNTER

#fillY $START_ROW $START_COL $SIZE $COUNTER ${MATRIX[@]}
