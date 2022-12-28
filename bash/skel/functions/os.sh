#!/usr/bin/env bash

## OS ##
os()
{
  case "$OSTYPE" in
    "darwin"*)
        : "mac"
    ;;
  
    "linux")
        : "linux"
    ;;
  
    "linux-musl"*)
        : "ish"
    ;;
  
    "cygwin" | "msys" | "win32")
        : "Windows"
    ;;
  
    *)
        printf '%s\n' "Unknown OS detected, aborting..." >&2
        exit 1
    ;;
  esac
  
  # Finally, set the variable.
  os="$_"
}
os

# OS SPECIFIC FUNCTIONS
if [ -f ~/.${os}_functions ]; then
  source ~/.${os}_functions
fi

# OS SPECIFIC ALIASES
if [ -f ~/.${os}_aliases ]; then
  source ~/.${os}_aliases
fi
