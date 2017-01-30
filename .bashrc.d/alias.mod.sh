alias rm="rm -r"
alias cp="cp -r"
alias ls="ls --color"
alias g="git"
###
# List all directories 
# 
# @1 Directory
###
function lad(){
	DIR="$1"
	if [ -z ${1+x} ];then
		DIR="."
	fi

	ls -lhFA --color "$DIR" | grep -E '^[d]'	
}

###
# List all links
# 
# @ Directory
###
function lal(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhFA --color "$DIR" | grep -E '^[l]'
}

###
# List all files
#
# @ Directory
###
function laf(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhFA --color "$DIR" | grep -E '^[-]'
}

###
# List visible directories
#
# @ Directory
###
function  lvd(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhF --color "$DIR" | grep -E '^[d]'
}

###
# List
#
# @ Directory
###
function lal(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhFA --color "$DIR" | grep -E '^[l]'
}

###
# List
#
# @ Directory
###
function laf(){
	DIR="$1"
	if [ -z ${1+x} ];then
		DIR="."
		echo "no param"
	fi
	ls -lhFA --color "$DIR" | grep -E '^[-]'
}

###
# List
#
# @ Directory
###
function lvd(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhF --color "$DIR" | grep -E '^[d]'
}

###
# List
#
# @ Directory
###
function lvl(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhF --color "$DIR" | grep -E '^[l]'
}

###
# List
#
# @ Directory
###
function lvf(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhF --color "$DIR" | grep -E '^[-]'
}

###
# List
#
# @ Directory
###
function lhd(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhFA --color "$DIR" | egrep '^d' |egrep '\..*$'
}

###
# List
#
# @ Directory
###
function lhl(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhFA --color "$DIR" | egrep '^l' |egrep '\..*-+>+.*$'
}

###
# List
#
# @ Directory
###
function lhf(){
DIR="$1"
if [ -z ${1+x} ];then
DIR="."
fi
	ls -lhFA --color "$DIR" | egrep '^-' |egrep '\s\..*$'
}

###
# List
#
# @ Directory
###
function la(){
	DIR="$1"
	if [ -z ${1+x} ];then
		DIR="."
	fi
	lvd "$DIR"; lhd "$DIR"; lvf "$DIR"; lhf "$DIR"; lvl "$DIR"; lhl "$DIR"
}

###
# List
#
# @ Directory
###
function lv(){
	DIR="$1"
	if [ -z ${1+x} ];then
		DIR="."
	fi
	lvd "$DIR"; lvf "$DIR"; lvl "$DIR"
}

###
# List
#
# @ Directory
###
function lh(){
	DIR="$1"
	if [ -z ${1+x} ];then
		DIR="."
	fi
	lhd "$DIR"; lhf "$DIR"; lhl "$DIR"
}

