#!/bin/bash
#
#  █████                       █████
# ░░███                       ░░███
#  ░███████   ██████    █████  ░███████   ████████   ██████
#  ░███░░███ ░░░░░███  ███░░   ░███░░███ ░░███░░███ ███░░███
#  ░███ ░███  ███████ ░░█████  ░███ ░███  ░███ ░░░ ░███ ░░░
#  ░███ ░███ ███░░███  ░░░░███ ░███ ░███  ░███     ░███  ███
#  ████████ ░░████████ ██████  ████ █████ █████    ░░██████
# ░░░░░░░░   ░░░░░░░░ ░░░░░░  ░░░░ ░░░░░ ░░░░░      ░░░░░░
#
# =============================================================================
# Source Additional Configurations
# =============================================================================

if [ -f ~/.bash_functions ]; then
  source "$HOME/.bash_functions"
fi

if [ -f ~/.bash_aliases ]; then
  source "$HOME/.bash_aliases"
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

# =============================================================================
# History
# =============================================================================

# Append to history, don't overwrite it
shopt -s histappend

HISTFILE="$HOME/.bash_history"
HISTSIZE=1000
HISTFILESIZE=100000
HISTTIMEFORMAT="%Y-%m-%d (%H:%M:%S) "
HISTIGNORE="q:c:ls:l:la:ll:lt:ld:lm:lb:le:cow:wto"
HISTCONTROL=ignoreboth      # Ignore duplicates and commands starting with a space
PROMPT_COMMAND='history -a' # Append to history file immediately

# =============================================================================
# Shell Features
# =============================================================================

# Directory Colors
if [ -x /usr/bin/dircolors ]; then
  test -r "$HOME/.dircolors" && eval "$(dircolors -b "$HOME/.dircolors")"
else
  eval "$(dircolors -b)"
fi

if [ -s $HOME/bin/bash/lscolors.sh ]; then
  source $HOME/bin/bash/lscolors.sh
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
eval "$(oh-my-posh init bash --config ~/.config/ohmyposh/idk-hul10.omp.json)"
eval "$(zoxide init bash)"

# =============================================================================
# Main Execution
# =============================================================================

# Display custom header in terminal
# terminal-header.sh
