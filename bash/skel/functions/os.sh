#!/usr/bin/env bash

## OS ##
os()
{ # Modified snippet from Neofetch.
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
printf '%s\n' os: $os
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
}
