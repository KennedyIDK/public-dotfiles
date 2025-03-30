#!/bin/bash

#           $$\ $$\
#           $$ |\__|
#  $$$$$$\  $$ |$$\  $$$$$$\   $$$$$$$\  $$$$$$\   $$$$$$$\
#  \____$$\ $$ |$$ | \____$$\ $$  _____|$$  __$$\ $$  _____|
#  $$$$$$$ |$$ |$$ | $$$$$$$ |\$$$$$$\  $$$$$$$$ |\$$$$$$\
# $$  __$$ |$$ |$$ |$$  __$$ | \____$$\ $$   ____| \____$$\
# \$$$$$$$ |$$ |$$ |\$$$$$$$ |$$$$$$$  |\$$$$$$$\ $$$$$$$  |
#  \_______|\__|\__| \_______|\_______/  \_______|\_______/

alias ali="bat --style=numbers --paging=never ~/.bash_aliases" # Show this file

# =============================================================================
# Terminal shortcuts
# =============================================================================

alias c="clear"
alias q="exit"
alias h="__fzf_history__"

alias uex="chmod u+x"

alias duf="duf --only local"

if command -v ranger &>/dev/null; then
  alias r="ranger"
fi

if command -v kitty &>/dev/null; then
  alias icat="kitty +kitten icat"
  alias diff="kitty +kitten diff"
fi

# =============================================================================
# ls (lsd)
# =============================================================================

if command -v lsd &>/dev/null; then
  alias ls="lsd"
fi

alias l="ls --long"
alias la="ls --long --all"
alias ll="ls --long --hyperlink always"
alias lm="ls --long --all --timesort"
alias lb="ls --long --all --sizesort"
alias le="ls --long --all --extensionsort"
alias lt="ls --long --all --tree"
alias ld="ls --long --all --tree --directory-only"

# =============================================================================
# cd & zoxide
# =============================================================================

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias zd="cd ~/Downloads"
alias zp="z -"

# =============================================================================
# cp/mv/mkdir
# =============================================================================

alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"

# =============================================================================
# Fuzzy finder
# =============================================================================

alias fzp='fzf --layout=reverse --preview="bat --color=always --style=numbers --line-range=:500 {}"'
alias fze='fzf --exact --layout=reverse --preview="bat --color=always --style=numbers --line-range=:500 {}"'
alias fzm='fzf --multi --layout=reverse --preview="bat --color=always --style=numbers --line-range=:500 {}"'
alias fzf='fzf --layout=reverse'

# =============================================================================
# Vim/Neovim
# =============================================================================

if command -v nvim &>/dev/null; then
  alias vi="nvim"
  alias vim="nvim"
fi

alias fnv='vim "$(fzf --layout=reverse --preview="bat --color=always --style=numbers --line-range=:500 {}")"'

alias eali="vim ~/.bash_aliases"                # edit this file
alias ebrc="vim ~/.bashrc"                      # edit bashrc
alias esway="vim ~/.config/sway/config"         # edit sway config
alias ewayb="vim ~/.config/waybar/config.jsonc" # edit waybar config

# =============================================================================
# VPN
# =============================================================================

alias vpn="nordvpn"
alias vpns="nordvpn status"
alias vpnc="nordvpn c"
alias vpnd="nordvpn d"
alias vpnnuk="nordvpn connect uk"

# =============================================================================
# Package management
# =============================================================================

alias nalu="sudo nala update"
alias nals="sudo nala search"
alias nali="sudo nala install"

alias dnfu="sudo dnf update"
alias dnfs="sudo dnf search"
alias dnfi="sudo dnf install"

alias fpl="flatpak list"
alias fpi="flatpak install"
alias fpu="flatpak update"

# =============================================================================
# colour auto/always
# =============================================================================

alias bat="bat --color=always"
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# =============================================================================
# Device specific aliases
# =============================================================================

if [ "$(hostname)" = "spring-terrace" ]; then
  alias bakcloud="laptop-bakcloud"
  alias bakhome="laptop-bakhome"
fi

# =============================================================================
# Random
# =============================================================================

alias cow="fortune | cowsay"     # Fortune telling cow
alias wto="curl wttr.in/toronto" # Weather in Toronto
alias pdvd="mpv dvd://"          # Play DVD
