function git_prompt(){
	local AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
	local BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l |tr -d ' ')"
	echo -n "$(color purple)*["
	echo -n "$(color green)↑"$AHEAD"A"
	echo -n "$(color red)↓"$BEHIND"B "
	echo -n "$(color purple)# "
	echo -n "$(color green)*"
	echo -n "$(color yellow)*"
	echo -n "$(color red)* "
	echo -n "$(color cyan)master"
	echo -n "$(color purple)]$(color)"
}
