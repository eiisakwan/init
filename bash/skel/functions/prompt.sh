#!/bin/sh
# color_prompt.sh

# Standard Colors - use with echo
Black='\033[0;30m'		# Black
White='\033[0;37m'		# White
Red='\033[0;31m'		# Red
Green='\033[0;32m'		# Green
Yellow='\033[0;33m'		# Yellow
Blue='\033[0;34m'		# Blue
Purple='\033[0;35m'		# Purple
Cyan='\033[0;36m'		# Cyan
Reset='\033[m'			# Reset
Bold="\033[1m"			# Bold

# Bold Colors - use with printf
red="\e[1;31m"			# Red
green="\e[1;32m"		# Green 
yellow="\e[1;33m"		# Yellow
blue="\e[1;34m"			# Blue
pink="\e[1;35m"			# Pink
cyan="\e[1;36m"			# Cyan
white="\e[1;37m"		# White
lavender="\e[1;0m"

# Italic Colors
ired="\e[1;31m"			# Italic Red
igreen="\e[3;32m" 		# Italic Green
iyellow="\e[3;33m" 		# Italic Yellow
iblue="\e[3;34m" 		# Italic Blue
ipink="\e[3;35m" 		# Italic Pink
icyan="\e[3;36m" 		# Italic Cyan

# Text Style
bold="\e[1m"			# Bold
faint="\e[2m"			# Faint text.
italic="\e[3m"			# Italic
underline="\e[4m"		# Underline text.
bi="\e[5m"				# Blink
highlight="\e[7m"		# Highlighted text.
hidden="\e[8m"			# Hidden text.
strike="\e[9m"			# Strike-through text.
ec="\e[m"				# Reset text formatting and colors.

# Usage: oploop "Hello!"
# result: |---> Hello! 
oploop() { 
	for v in $*; do 
		[[ $1 == "" ]] || printf "$pink|-$yellow-$white-$cyan> $iyellow$1$ec \n" 
		shift 1
	done 
}

# Usage: op "Hello!"
# Result: |---> Hello!
# op() { printf "\e[1;33m|\e[1;36m------\e[1;35m> \e[m\e[3;33m$1\e[m \n"; }
op() {
	printf "$yellow|$cyan------$pink> $ec$iyellow$1$ec \n"
}

# Usage: ops "Hello!" "How are you" "hi"
# result: |---<<
#		  |---| Hello! |---| 
#		  |---> How are you
#		  |---> Hi
#		  |---<<
ops() { 
	local
	printf "$white$bold|--------------------------<<$ec \n"; 
	printf "$pink|---$ec| $bi$1$ec |$pink---|$ec \n"; 
	shift 1
	for v in $*; do
		[[ $1 == "" ]] || printf "$yellow|$cyan------$pink> $ec$iyellow$1$ec \n"
		shift 1
	done
	printf "$white$bold|--------------------------<<$ec \n" 
}

# Usage: OP "Hello!"
# result: |---<<
# 		  |---> Hello! 
# 		  |---<<
# OP() { printf "\e[1;35m|\e[1;34m------\e[1;33m------\e[1;37m------\e[1;35m<<\e[m \n"; for v in $*; do [[ $1 == "" ]] || printf "\e[1;35m|-\e[1;33m-\e[1;37m-\e[1;36m> \e[3;33m$1\e[m \n"; shift 1; done; printf "\e[1;35m|\e[1;34m------\e[1;33m------\e[1;37m------\e[1;35m<<\e[m \n"; } 
OP() { 
	printf "$pink|$blue------$yellow------$white------$pink<<$ec \n"
	for v in $*; do 
		[[ $1 == "" ]] || printf "$pink|-$yellow-$white-$cyan> $iyellow$1$ec \n" 
		shift 1
	done 
	printf "$pink|$blue------$yellow------$white------$pink<<$ec \n"
} 

# Usage: output "Hello!" "How are you" "hi"
output() {
	printf "$bold$white------------------------------------------$ec \n" 
	printf "$bold$white- $? --- $yellow$1 $bold$white--- $2 $3     \n"
	printf "$bold$white------------------------------------------$ec \n"
}

prompt()
{
	echo "$bold here is all the prompt option"
	# op
	echo "----- Standard Prompt: op------$ec"
	echo "Usage: op "Hello!""
	echo "Result:"
	echo "|---> Hello!"

	# ops
	echo "$bold----- Multiple Prompt: OP ------$ec"
	echo "Usage: op "Hello!" "How are you" "hi""
	echo "Result:"
	echo "|---<<"
	echo "|---| Hello! |---|"
	echo "|---> How are you"
	echo "|---> Hi"
	echo "|---<<"

	# OP
	echo "$bold----- Bold Prompt: OP ------$ec"
	echo "Usage: OP "Hello!""
	echo "Result:"
	echo "|---<<"
	echo "|---> Hello!"
	echo "|---<<"

	# oploop
	echo "$bold----- Loop Prompt: oploop ------$ec"
	echo "Usage: OP "Hello!""
	echo "Result:"
	echo "|---<<"

	# output
	echo "$bold----- Statement Prompt: output ------$ec"
	echo "Usage: oploop "Hello!" "hi" "
	echo "|---> Hello!"
	echo "|---> Hi"
}
