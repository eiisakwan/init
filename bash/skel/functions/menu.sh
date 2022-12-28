#!/usr/bin/env bash
# Script: menu.sh
## BASH SELECT MENU ##
menu () {
select item; 
do
# Check the slected menu item number
[ 1 -le "$REPLY" ] || [ "$REPLY" -le $# ] && 
	echo "Selected item: ($REPLY) $item "
	break;
done
}

## DECLARE THE ARRAY ##
# e.g COMMANDS=(x y z)

# Call the subroutine to create the menu
# e.g menu_select "${COMMANDS[@]}"
