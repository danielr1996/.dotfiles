if [[ -n $(which screenfetch 2>/dev/null) ]]; then 
	screenfetch | egrep -v '\[\['
fi
