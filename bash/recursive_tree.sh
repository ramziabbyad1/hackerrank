#!/bin/bash
NROWS=63
NCOLS=100

getIndex()
{
	I=$1
	J=$2
	echo "$(($NCOLS*$I + $J))"
}

drawStem() 
{
	local START_ROW=$1
	local START_COL=$2
	local SIZE=$3
	MATRIX="$@"
	local LIMIT=$(($START_ROW+$SIZE))
	for ((rowi=$START_ROW; rowi<$LIMIT; rowi++))
	do
		MATRIX[$(getIndex $rowi $START_COL)]=true
	done
}

drawBranch() 
{
	local START_ROW=$1
	local START_COL=$2
	local SIZE=$3
	local LR=$4
	MATRIX="$@"

	for ((i=0; i<$SIZE; i++ ))
	do
		if [[ $LR = 'left' ]]; then
			let "COL=$START_COL+$i"
		else
			let "COL=$START_COL-$i"
		fi
		row=$(($START_ROW+$i))
		MATRIX[$( getIndex $row $COL )]=true
	done
}

fillY()
{
	local START_ROW=$1
	local START_COL=$2
	local SIZE=$3
	local COUNT=$4
	MATRIX="$@"
	printf "%s\n" "${MATRIX[@]}"
	drawStem $START_ROW $START_COL $SIZE ${MATRIX[@]}
	drawBranch $(( $START_ROW + $SIZE )) $(( $START_COL + 1 )) $SIZE "left" ${MATRIX[@]}
	drawBranch $(( $START_ROW + $SIZE )) $(( $START_COL - 1 )) $SIZE "right" ${MATRIX[@]}
	COUNT=$(($COUNT-1))
	if [[ $COUNT > 0 ]]
	then
		fillY $(( $START_ROW + 2*$SIZE )) $(($START_COL - $SIZE)) $(($SIZE >> 1)) $COUNT ${MATRIX[@]}
		fillY $(( $START_ROW + 2*$SIZE )) $(($START_COL + $SIZE)) $(($SIZE >> 1)) $COUNT ${MATRIX[@]}
	fi
		
}

printMatrix()
{
	MATRIX="$@"
	for ((rowi=$(($NROWS-1)); rowi>=0; rowi--))
	do
		for ((coli=0; coli<$NCOLS; coli++))
			do
				local index=$( getIndex $rowi $coli )
				if [[ ${MATRIX[$index]} = true ]]; then
					printf "1"
				else
					printf "_"
				fi
			done
			printf "\n"
	done
	
}

declare -a MATRIX
START_ROW=0
START_COL=49
SIZE=16
read COUNTER

fillY $START_ROW $START_COL $SIZE $COUNTER ${MATRIX[@]}
#printMatrix ${MATRIX[@]}
