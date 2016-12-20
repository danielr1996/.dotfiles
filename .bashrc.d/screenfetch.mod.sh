if [[ -n $(which screenfetch) ]]; then 
	screenfetch | egrep -v '\[\['
fi
