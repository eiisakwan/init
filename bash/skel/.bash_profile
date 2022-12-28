# ~/.bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# ensures programs know to use 256-colours
if [[ $TERM == "xterm" ]]; then
    export TERM="xterm-256color"
elif [[ $TERM == "screen" ]]; then
    export TERM="screen-256color"
fi

# enable bash_completion if available
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion

elif  [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# User specific environment and startup programs
PATH=$HOME/bin:$PATH
export PATH=$HOME/Scripts:$PATH
export PATH=/opt/local/libexec/gnubin:$PATH

### environmental variables ###
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth
# ignore simple, repetitive commands
export HISTIGNORE="&:ls:ll:la:cd:exit:clear"
# set VIM as my default text editor
export EDITOR='nano'
# set bash as shell
export SHELL=/bin/bash

### WPCLI  FUNCTIONS ###
export WP_CLI_CONFIG_PATH=~/.wp-cli/config.yml
export WP_CLI_PROJECT_CONFIG_PATH=~/www/wp-cli.yml

### SSH AGENT #### setup ssh-agent
SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
   /usr/sbin/sshd
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# PORT
if [[ $OSTYPE == darwin* ]]; then
	export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

# LESS
# set options for less
export LESS='-RiF --mouse --wheel-lines=3 --quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --window=-4'
# or the short version
# export LESS='-F -i -J -M -R -W -x4 -X -z-4'

# allow mouse scrolling
# export LESS='--mouse'
# Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# macpref
if [[ "$OSTYPE" == "darwin"* ]]; then 
	defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
	defaults write com.apple.dock autohide -bool true
fi
