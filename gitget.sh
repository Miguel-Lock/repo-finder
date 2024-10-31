#Miguel Lock
#SFE-128-A
#Scripting2

#!/bin/bash

show_path=1
show_branch=0

while getopts 'bhqt' OPTION; do
	case "$OPTION" in
	b)
		show_branch=1
		;;
	h)
		cat << EOF
Usage: gitget [OPTION]... [DIRECTORY]...

  -b	prints the branch of the file
  -h	displays this menu
  -q	does not show path
  -t	describes core operation used in script

Default directory: PWD
EOF
	exit 0
	;;
	q)
		show_path=0
		;;
	t)
		cat << EOF
while getopts 'bhqt'
	if flag b: show_branch=1
	if flag h: print help menu, terminates program
	if flag q: show_path=0
	if flag t: show this alorithm summary, terminates program
	if flag <anything else>: Show error message, terminates program

main()
	For every directory in input:
		show path if show_path=1
		echo url from config file
		show branch if show_branch=1

setArray()
	sets list to user-specified path variable
	if user did not specify path vaiable, pretend the user entered the PWD

Call method setArray()

for every directory the user entered:
	echo: In: (directory)
		main()
EOF
	exit 0	
	;;
	?)  #if option is invalid/unrecognized
		echo Invalid input. Use [getgit -h] to see options.
		exit 1
		;;
esac
done
shift "$(($OPTIND -1))"

main () {
    list=$@
    for i in ${list}; do  #for each directory in the list
        
	if [[ $show_path -eq 1 ]] #shows path if no flag [-q]
	then
		echo -e -n "$i\t"  #echos path info
	fi

	grep url "$i/config" | cut -c 8- | tr -d '\n' #echos URL

	if [[ $show_branch -eq 1 ]] #shows branch if user specifies [-b]
	then
		echo -e -n "\t"
		grep branch "$i/config" | cut -c 10- | rev | cut -c 3- | rev
	else
		echo ""
	fi

    done
}

setArray () {
	list=("$@")
	if [[ -z $list ]]  #if user does not specify arguments
	then
		array=("$PWD")	#set array to to PWD
	else
		array=$@  #set array to user's arguments (directories)
	fi
}

setArray $@  #Passes user arguments into set array

for arg in $array ; do 
	echo In: $arg
		main $(find $arg -type d -name ".git")
done
