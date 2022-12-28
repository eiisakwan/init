#!/bin/bash 
# ~/.bash_functions
DATE=$(date +"%Y-%m-%d"); date=$(date +"%Y%m%d")
NOW=$(date +"%Y-%m-%d-%H:%M"); now=$(date +"%Y%m%d%H%M")
bfunc=${BASH_SOURCE[0]}
while [ -L "$bfunc" ]; do bpath=$(readlink "$bfunc"); [[ $bpath == /* ]] && bfunc=$bpath || { bdir=$( dirname "$bfunc" ); bfunc=$bdir/$bpath; }; done

## BASH DIR & BASH FUNCTIONS DIR
BDIR=$( cd -- "$( dirname -- "$bfunc" )" &> /dev/null && pwd )
BFUNC=$BDIR/functions
for scripts in $BDIR/functions/*.sh; do
    if [ -r $scripts ] && [[ $scripts != .* ]]; then
        . $scripts
    fi
done
unset scripts

# USER SPECIFIC BASH FUNCTIONS & BASH ALIASES
for i in $HOME/{.[!.]*,*}; do 
  i=${i##*/}
  [[ $i != .* ]] || [[ $i != *_functions ]] || [[ $i == .bash_functions ]] || { source $HOME/$i; bash_functions=$i; }
  [[ $i != .* ]] || [[ $i != *_aliases ]] || { source $HOME/$i;  bash_aliases=$i; }
done

t()
{
  if type $1 2>/dev/null; then
    [[ $(type $1) != *shell* ]] || which $1
    [[ $(type $1) != *function* ]] || shopt -s extdebug && t="$(declare -F $1 | awk '{print $3}')"
    [[ $(type $1) != *alias* ]] || t="$(grep "alias $1" $(ls ~/.**_aliases))" && t="${t%%:*}"
    [ -z $t ] || { sorc=$t; echo sorc: $sorc; }
  else
    type $1
  fi
}

# get innodes
inod() { find $1 printf "%h\n" | cut -d/ -f-2 | sort | uniq -c | sort -rn; }

# check if program exit, 0=installed, 1=no installed
check() { [[ $(type $1 2>/dev/null) == "" ]] && echo "not found" || echo "found"; }

# Count. Usage: count /path/to/dir/*, count /path/to/dir/*/
count() { printf '%s\n' "$#"; }
