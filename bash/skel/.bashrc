# ~/.bashrc
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# USER SPECIFIC SETTING AND FUNCTIONS
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

if [ -f ~/.${USER}_functions ]; then
	. ~/.${USER}_functions
fi

# USER PATH
export PATH=$HOME/bin:$PATH

# load profile config
if [ -d /etc/profile.d ]; then
	for script in /etc/profile.d/*.sh; do
		. $script
	done
fi