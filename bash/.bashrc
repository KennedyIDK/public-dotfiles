#!/bin/bash

#    █████                      █████
#   ░░███                      ░░███
#    ░███████   ██████    █████  ░███████   ████████   ██████
#    ░███░░███ ░░░░░███  ███░░   ░███░░███ ░░███░░███ ███░░███
#    ░███ ░███  ███████ ░░█████  ░███ ░███  ░███ ░░░  ░███ ░░░
#    ░███ ░███ ███░░███  ░░░░███ ░███ ░███  ░███     ░███  ███
# ██ █████████ ░░████████ ██████  █████ █████ █████    ░░██████
# ░░ ░░░░░░░░░   ░░░░░░░░ ░░░░░░  ░░░░░ ░░░░░ ░░░░░      ░░░░░░

# =============================================================================
# Source Additional Configurations
# =============================================================================

if [ -f ~/.bash_aliases ]; then
  source "$HOME/.bash_aliases"
fi

if [ -f ~/.bash_functions ]; then
  source "$HOME/.bash_functions"
fi

# =============================================================================
# Shell Behavior
# =============================================================================

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Default Prompt
PS1='\[\e[1m\]\u\[\e[3m\]@\h\[\e[0m\] [\j][\[\e[1m\]\!\[\e[0m\]] 📁 \w\n\$ '

# Update window size after command
shopt -s checkwinsize

# "**" will match all files and zero or more directories and subdirectories
shopt -s globstar

# Append to history, don't overwrite it
shopt -s histappend

# =============================================================================
# History
# =============================================================================

HISTFILE="$HOME/.bash_history"
HISTSIZE=1000
HISTFILESIZE=100000
HISTTIMEFORMAT="%Y-%m-%d (%H:%M:%S) "
HISTIGNORE="q:c:ls:l:la:ll:lt:ld:lm:lb:le:cow:wto"
HISTCONTROL=ignoreboth      # Ignore duplicates and commands starting with a space
PROMPT_COMMAND='history -a' # Append to history file immediately

# =============================================================================
# Environment Variables
# =============================================================================

# Ensure PATH includes local and user bin directories
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Default Editor
export EDITOR=nvim
export VISUAL=nvim

# Screenshot Directory
export GRIM_DEFAULT_DIR="$HOME/screenshots"

# Age Keys
export AGE_PUBKEY="age15gtuse8y5ctrscevnd3n5fzljez07dv23du2lf0ekq2snj5c7ufscgyqku"
export AGE_SECKEY="$HOME/.config/age/age-keys.txt.age"

# Flatpak Configuration
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/iain/.local/share/flatpak/exports/share

# Ranger Configuration
export RANGER_LOAD_DEFAULT_RC=FALSE

# Bat Theme
export BAT_THEME="1337"

# GCC Colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# =============================================================================
# Shell Features
# =============================================================================

# Directory Colors
if [ -x /usr/bin/dircolors ]; then
  test -r "$HOME/.dircolors" && eval "$(dircolors -b "$HOME/.dircolors")"
else
  eval "$(dircolors -b)"
fi

# Autocompletion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# Enable lesspipe for non-text files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Initialize oh-my-posh, fzf, and zoxide
eval "$(fzf --bash)"
eval "$(oh-my-posh init bash --config ~/appdata/ohmyposh/idk-hul10.omp.json)"
eval "$(zoxide init bash)"

# =============================================================================
# Main Execution
# =============================================================================

# Display custom header in terminal
terminal-header
