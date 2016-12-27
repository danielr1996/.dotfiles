#!/bin/bash
#Shell script to install .dotfiles (i.e. link files)
#usage: coming-home.sh -f 
	# -f: use the -f flag to override existing files (overrides every existing file)

#dir to install the .dotfiles, usually this is the home dir(~)
install_dir="$HOME/"

#dir to install from, usually this is the same as this script(.)
files_dir="$(dirname $(readlink -f $0))/"

#files or dirs to ignore
ignore=".|..|.git|.gitignore|$(basename $0)|"

#Iterate every file
for f in $files_dir{.,}*; do
	# current file
	f=$(basename $f)

	# File is not in ignore	
	if [[ ! "$ignore" == *"$f|"* ]]; then
		#If file exists
		if [[ -e $install_dir$f ]]; then
			#check if file shoud be overriden
			if [[ $@ == "-f" ]]; then
				ln -sf $files_dir$f $install_dir$f
			fi	
		else
			ln -s $files_dir$f $install_dir$f
		fi
	fi	
done
