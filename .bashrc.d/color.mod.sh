###
# Gibt den ANSI Farbcode zurück
#
# @param1 Farbe
# @param2 Dicke
# @return ANSI Farbcode
###
function color(){
	COLOR="";
	STRENGTH="";
	
# Set Strength
	case $2 in
		"light")STRENGTH="[1";;
		*)STRENGTH="[0";;
	esac

	# Set color
	case $1 in
		"black")COLOR="30";;
		"red")COLOR="31";;
		"green")COLOR="32";;
		"yellow")COLOR="33";;
		"blue")COLOR="34";;
		"purple")COLOR="35";;
		"cyan")COLOR="36";;
		"white")COLOR="37";;
		*)COLOR="0"
	esac

	echo "\[\033"$STRENGTH";"$COLOR"m\]" 
}