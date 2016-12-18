main(){
##############
# Global Vars #
###############
GIT_PROMPT_SYMBOL="$(c magenta)±$(c white)"
GIT_PROMPT_PREFIX="$(c magenta)[$(c white)"
GIT_PROMPT_SUFFIX="$(c magenta)]$(c white)"
GIT_PROMPT_AHEAD="$(c blue)↗NUM$(c white)"
GIT_PROMPT_BEHIND="$(c cyan)↘NUM$(c white)"
GIT_PROMPT_MERGING="$(c red)⚡︎$(c white)"
GIT_PROMPT_UNTRACKED="$(c red)●$(c white)"
GIT_PROMPT_MODIFIED="$(c yellow)●$(c white)"
GIT_PROMPT_STAGED="$(c green)●$(c white)"
PROMPT_COMMAND=set_prompt
###########
# Aliases #
###########
alias lad="ls -lhFA --color | grep -E '^[d]'"
alias lal="ls -lhFA --color | grep -E '^[l]'"
alias laf="ls -lhFA --color | grep -E '^[-]'"
alias lvd="ls -lhF --color | grep -E '^[d]'"
alias lvl="ls -lhF --color | grep -E '^[l]'"
alias lvf="ls -lhF --color | grep -E '^[-]'"
alias lhd="ls -lhFAd --color .* | grep -E '^[d]'"
alias lhl="ls -lhFAd --color .* | grep -E '^[l]'"
alias lhf="ls -lhFAd --color .* | grep -E '^[-]'"
alias la="lvd; lhd; lvf; lhf;lvl;lhl"
alias lv="lvd; lvf;lvl"
alias lh="lhd; lhf; lhl"
alias rm="rm -r"
alias cp="cp -r"
}
#Screenfetch
#screenfetch -p -E -c41,25 -A 'Arch Linux'   
function set_prompt {
PS1="$(c red)\u$reset_color@$(c green)\h$reset_color: $(c yellow)\W $(c cyan) "
PS1+="$(git_prompt_string)$(c white) \$$(c white)\n"
}

####################
# Global Functions #
####################
function c {
	color="y"	
	if [[ $color == "y" ]]; then
		case $1 in
              "red")echo -en "\[\033[31m\]";;
              "lightred")echo -en "\[\033[1;31m\]";;
              "green")echo -en "\[\033[32m\]";;
              "lightgreen")echo -en "\[\033[1;32m\]";;
              "yellow")echo -en "\[\033[33m\]";;
              "lightyellow")echo -en "\[\033[1;33m\]";;
              "blue")echo -en "\[\033[34m\]";;
              "lightblue")echo -en "\[\033[1;34m\]";;
              "purple")echo -en "\[\033[35m\]";;
              "lightpurple")echo -en "\[\033[1;35m\]";;
              "cyan")echo -en "\[\033[36m\]";;
              "lightcyan")echo -en "\[\033[1;36m\]";;
              "white")echo -en "\[\033[37m\]";;
              "lightwhite")echo -en "\033[1;37m\]";;
		esac	
	fi
}

function parse_git_branch {
	(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

function parse_git_state {
	local GIT_STATE="$GIT_PROMPT_PREFIX "
	
	#Ahead
 	local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
 	if [ "$NUM_AHEAD" -gt 0 ]; then 
		GIT_STATE="$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}"
	fi
 	
	#Behind
 	local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
 	if [ "$NUM_BEHIND" -gt 0 ]; then 
		GIT_STATE="$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}"
	fi
 	
	#Merge Conflict
 	local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
 	if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then 
		GIT_STATE="$GIT_STATE$GIT_PROMPT_MERGING"
	fi
 	#Untracked
 	if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then 
 		GIT_STATE="$GIT_STATE$GIT_PROMPT_UNTRACKED"
	fi
 	
	#Modified
  	if ! git diff --quiet 2> /dev/null; then 
		GIT_STATE="$GIT_STATE$GIT_PROMPT_MODIFIED"
	fi
  	
	#Staged
  	if ! git diff --cached --quiet 2> /dev/null; then 
		GIT_STATE="$GIT_STATE$GIT_PROMPT_STAGED" 
	fi
  	
	#Else
  	if [[ -n $GIT_STATE ]]; then 
		echo "$GIT_STATE " 
	fi
}

function git_prompt_string {
	local git_where="$(parse_git_branch)"
	local git_br="$(echo $git_where | cut -d / -f3)"
  	[ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$(c yellow)$git_br$(c white)$GIT_PROMPT_SUFFIX"
}
main
