#!/bin/bash
# ~/.bash_aliases

########################################
## USER SPECIFIC ALIASES ##
########################################

######  User specific aliases and functions ######
# alias mnt="mount | awk -F??? ??? ???{ printf \"%s\t%s\n\",\$1,\$3; }??? | column -t | egrep ^/dev/ | sort"
alias rmr='rm *-100x100.*  *-32x32*   *-324x324.* *-416x416.* *-1536x1536.* *-1024x1024.* *-150x150.* *-300x300.* *-1.* **-2* *-2-2* *-416x166.* *-994x1024.* *-416x419.* *-1536x1534.* *-416x415.* *-1024x410.*'
alias ..='cd ..'
alias ....="cd ../../"
alias ......='cd ../../../'

# --- BASH --- #
# bashrc
alias b="source ~/.bashrc"
alias bd="nano ~/.bashrc"
alias bls="cat ~/.bashrc"

# bash aliases
alias ba="nano ~/.bash_aliases"
alias bwa="nano ~/.wp_aliases"
alias bma="nano ~/.mac_aliases"
alias badd="bashalias_add"
alias bals="cat ~/.bash_aliases"
alias bmals="cat ~/.mac_aliases"

# bash functions
alias bf='nano ~/.bash_functions'
alias bmf="nano ~/.mac_functions"
alias bfls="cat ~/.bash_functions"
alias bmfls="cat ~/.mac_functions"

# bash Profile
alias bp="nano ~/.bash_profile"
alias bpd="source ~/.bash_profile"
alias bpls="cat ~/.bash_profile"

# --- UTIL --- #
alias server-check="cat /etc/resolv.conf"
alias server-host="nano /etc/hosts"
alias server-hostname="nano /etc/hostname"
alias lii="find . -print | cut -d/ -f-2 | sort | uniq -c | sort -rn"
alias lt="ls --human-readable --size -1 -S --classify"
alias lsr='du -sh *'
alias r="fc -s" # show previous command
alias arrfile="IFS=$'n' read -d "" -ra filedata <"

# --- SHORTCUT -- #
alias projects="cd ~/Projects"
alias shdir="cd ~/Scripts"
alias condir="cd ~/.config"
alias dl="cd ~/Downloads"
alias www="cd ~/www"
alias home="cd ~/"

# ---  SSH --- #
alias sshrestart="sudo service sshd restart; /usr/sbin/sshd"
alias sshdd="nano  ~/.ssh/config"
alias sshls="cat ~/.ssh/config"
alias sshcopyid="ssh-copy-id -i ~/.ssh/id_rsa.pub"
alias sshrm="ssh-keygen -R"
alias sshadd="chmod 600 ~/.ssh/*; ssh-add ~/.ssh/*"

# --- LINK --- #
alias nolink="find . -xtype l | wc -l"
alias rmnolink="find . -xtype l -exec rm {} \;"

# --- ls --- #
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable color prompt base on os system
if [[ "$OSTYPE" == "linux"* ]]; then # all linux type
    alias ls="ls --color=always"
    alias ll="ls -la --color=always"
    alias lt='ls --human-readable --size -1 -S --classify --color=always'
elif [[ "$OSTYPE" == "darwin"* ]]; then # MACOSX
    alias ls="ls -a -G"
    alias ll="ls -la -G"
elif
    [[ "$OSTYPE" == "linux-musl"* ]]; then # Arch Linux
    alias la=exa
fi

# ls
alias l="ls -a"
alias ll="ls -la"

# --- CAT --- #
if hash pygmentize 2>/dev/null; 
then
    alias cats="pygmentize -g"
else
    if hash highlight 2>/dev/null; 
    then
        alias c="highlight -O ansi --force"
    fi
fi

# --- MISC --- #
alias tops="top -stats pid,pstate,command,cpu,time,th -o state"
alias kill="kill -9"
alias M="mount"
alias m='mount | grep "by $USER"'
alias umnt="umount"
alias s="du -sh"
