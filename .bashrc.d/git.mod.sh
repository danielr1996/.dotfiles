function git_prompt(){
	###
	# Set Symbols to do display
	##ä
	local PREFIX="$(color white)[";
	local AHEAD="$(color green)↑";
	local BEHIND="$(color red)↓";
	local MERGE="$(color purple)#";
	local STAGED="$(color green)+";
	local MODIFIED="$(color yellow)+";
	local UNTRACKED="$(color red)+";
	local SUFFIX="$(color white)]";
	
	###
	# Determinte AHEAD/BEHIND commits and branch name
	##
	local NAHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
	local NBEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l |tr -d ' ')"
	local BRANCH="$((git symbolic-ref -q --short HEAD || git describe --tags --exact-match)2>/dev/null)"
	
	# If BRANCH is empty (i.e. we are not in a git repo)
	if [[ -n $BRANCH ]];then
		###
		# Fetch everytime to see behind commits
		# Comment this out if your repo is really big and prompt generation takes to long
		###
		#git fetch

		# Print Prefix
		echo -n $PREFIX
		
		# If you are commits behind, display how many	
		if [ "$NAHEAD" -gt 0 ]; then
			echo -n $AHEAD$NAHEAD" "
		fi
		
		# If you are commits ahead, display how many
		if [ "$NBEHIND" -gt 0 ]; then
			echo -n $BEHIND$NBEHIND" "
		fi
		
		# If .git/MERGE_HEAD we're in merge mode
		if test -r $(git rev-parse --git-dir 2>/dev/null)/MERGE_HEAD;then
			echo -n $MERGE" " 
		fi
		
		# If There are Staged files display it
		if ! git diff --cached --quiet 2> /dev/null; then
			echo -n $STAGED" "
		fi

		# If there are Modified files display it
		if ! git diff --quiet 2> /dev/null; then
			echo -n $MODIFIED" "
		fi

		# If there are Untracked files display it
		if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
			echo -n $UNTRACKED" "
		fi
		
		# Display branch name
		echo -n "$(color cyan)$BRANCH"
		
		# Print Suffix
		echo -n $SUFFIX 
	fi
}
