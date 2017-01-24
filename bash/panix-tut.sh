#!/bin/bash
echo "if construct example"
X=3
Y=4
empty_string=""
if [ $X -lt $Y ]
then
				echo "\$X=${X}, which is smaller than \$Y=${Y}"
fi

if [ -n "$empty_string" ]; then
				echo "empty string is non_empty"
fi

if [ -e "${HOME}/.fvwmrc" ]; then #exists
				echo "you have a .fvwmrc file"
				if [ -L "${HOME}/.fvwmrc" ]; then #symbolic link
								echo "it's a symbolic link"
				elif [ -f "${HOME}/.fvwmrc" ]; then #is reg file
								echo "it's a regular file"
				fi
else
				echo "you have no .fvwmrc file"
fi

echo "if pitfalls"

if [ l=2 ]; then
				echo "hello"
fi

X="-n"
Y=""

if [ $X = $Y]; then
				echo "X=Y"
fi

echo "for practice"

for X in red green blue
do
				echo $X
done

echo "for preserving spaces in variables"

colour1="red"
colour2="light blue"
colour3="dark green"
for X in "$colour1" "$colour2" "$colour3"
do
				echo $X
done

echo "globbing in for loops"

echo *

echo *.jpg

echo ${HOME}/public_html/*.jpg
