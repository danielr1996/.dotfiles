#define colors
gray='\033[1;30m'
test='\[\033[0;31m\]'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
r='\[\033[0m\]'

#define dir colors
LS_COLORS='di=32:fi=33:ex=35'
export LS_COLORS

#define the prompt
PS1="$green\u $r@ $red\h $r: $yellow\W \!$r \$(git_prompt) \n$yellow\$ $r"

#git_prompt function to assemble the git prompt
function git_prompt {
	git rev-parse --abbrev-ref HEAD &> /dev/null
	if [ $? -eq 0 ];then
		if [ -d "$(pwd)/.git" ] && [ $? -eq 0 ];then
			git_color;git_branch
		fi
	fi
	echo ""	
}

#git_color function to set the color depending on git status //TODO make this independent from locals
function git_color {
	git_status="$(git status 2> /dev/null)"
	if [[ $git_status == *"Changes to be committed"* ]];then
		echo -ne $c_yellow
	elif [[ $git_status == *"nothing to commit, working directory clean"* ]];then
		echo -ne $c_green
	elif [[ $git_status == *"untracked files"* ]];then
		echo -ne $c_red
	else
		echo -ne $c_gray
	fi
}

#git_branch function to return the current branch //TODO display ref id when in detached head state
function git_branch {
	echo -e "/$(git rev-parse --abbrev-ref HEAD)/"
}
