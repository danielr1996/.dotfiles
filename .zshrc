#Screenfetch
screenfetch -p -E -c41,25 -A 'Arch Linux'   
setopt histignorealldups sharehistory
bindkey -v
autoload -U colors; colors
autoload -U promptinit;promptinit
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

#All
alias lad="ls -lhFA --color | grep -E '^[d]'"
alias lal="ls -lhFA --color | grep -E '^[l]'"
alias laf="ls -lhFA --color | grep -E '^[-]'"

#Visible
alias lvd="ls -lhF --color | grep -E '^[d]'"
alias lvl="ls -lhF --color | grep -E '^[l]'"
alias lvf="ls -lhF --color | grep -E '^[-]'"

#Hidden
alias lhd="ls -lhFAd --color .* | grep -E '^[d]'"
alias lhl="ls -lhFAd --color .* | grep -E '^[l]'"
alias lhf="ls -lhFAd --color .* | grep -E '^[-]'"

#Rest
alias la="lvd; lhd; lvf; lhf;lvl;lhl"
alias lv="lvd; lvf;lvl"
alias lh="lhd; lhf; lhl"
alias rm="rm -r"
alias cp="cp -r"

function c {
	if [[ $1 == 'r' ]];then
		echo -n $reset_color
	fi
	echo -n "%{$fg[$1]%}"
}

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
	elif [[ $git_status == *"nothing to commit"* ]] || [[ $git_status == *"nichts zu comitten"* ]];then
		echo -ne "$(c green)"
	elif [[ $git_status == *"untracked files"* ]];then
		echo -ne $c_red
	else
		echo -ne $c_gray
	fi
}

#git_branch function to return the current branch //TODO display ref id when in detached head state
function git_branch {
	echo -e "±[$(git rev-parse --abbrev-ref HEAD)]"
}
precmd () {
	#RPS1="$(git_prompt)"
	PROMPT="$(c cyan)%n$(c r)@$(c blue)%m$(c r): $(c green)%~ $(c red)
%(!.#.$) "
	RPROMPT="%(?,$(c green)✔,$(c red)%? ✘) $(c white) $(git_prompt) $(c white)"
}
