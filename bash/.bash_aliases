#!/bin/bash
#
#            ████   ███
#           ░░███  ░░░
#   ██████   ░███  ████   ██████    █████   ██████   █████
#  ░░░░░███  ░███ ░░███  ░░░░░███  ███░░   ███░░███ ███░░
#   ███████  ░███  ░███   ███████ ░░█████ ░███████ ░░█████
#  ███░░███  ░███  ░███  ███░░███  ░░░░███░███░░░   ░░░░███
# ░░████████ █████ █████░░████████ ██████ ░░██████  ██████
#  ░░░░░░░░ ░░░░░ ░░░░░  ░░░░░░░░ ░░░░░░   ░░░░░░  ░░░░░░
#

alias c='clear'
alias q='exit'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias uex='chmod u+x'

# LSD (LS)
if command -v lsd &>/dev/null; then
  alias ls='lsd'
fi
# LS
alias l='ls --long'
alias la='l --all'
alias ll='la --hyperlink always'
alias lm='la --timesort'
alias lb='la --sizesort'
alias le='la --extensionsort'
alias lt='la --tree'
alias ld='lt --directory-only'

# ZOXIDE (CD)
if command -v zoxide &>/dev/null; then
  alias cd='z'
  alias zp='z -'
  alias zd='cd ~/Downloads'
fi
# CD
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# NEOVIM (VIM)
if command -v nvim &>/dev/null; then
  alias vim='nvim'
fi
# VIM
alias v='vim'
alias line='v +'
alias eali='v ~/.bash_aliases'
alias ebrc='v ~/.bashrc'
alias esway='v ~/.config/sway/config'
alias ewayb='v ~/.config/waybar/config.jsonc'

# DUF (DU)
if command -v duf &>/dev/null; then
  alias du='duf'
  alias dul='duf --only local'
fi

# BAT (CAT)
if command -v bat &>/dev/null; then
  alias cat='bat --plain'
  alias bat='bat --style=numbers'
  alias gitbat='bat --diff --diff-context 3'
fi
# CAT
alias ali='cat ~/.bash_aliases' # Show this file

# VDIR (DIR)
alias dir='vdir --color=auto'
alias adir='dir --all'

# FD
if command -v fd &>/dev/null; then
  alias fdf='fd --type f'
  alias fdd='fd --type d'
  alias fdg='fd --glob'
  alias fde='fd --extension'
  alias fda='fd --hidden'
fi

# GREP
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# RIPGREP
if command -v rg &>/dev/null; then
  alias rg='rg --smart-case'
  alias rge='rg --case-sensitive'
  alias rga='rg --hidden'
  alias rgz='rg --search-zip'
  alias rgv='rg --vimgrep'
  alias rgm='rg --sort=modified'
  alias rgo='rg --invert-match'
  alias rgc='rg --count'
fi

# WTTR
alias wto='curl v2d.wttr.in/Toronto'
alias wedi='curl v2d.wttr.in/Edinburgh'

# RANGER
if command -v ranger &>/dev/null; then
  alias r='ranger'
fi

# FUZZY FIND
if command -v fzf &>/dev/null; then
  alias h='__fzf_history__'
  alias fzf='fzf --layout=reverse --height 40%'
  alias fzd='find * -type d | fzf > selected'
  alias fzs='fzf --query'
  alias fzp='fzf --preview="bat --line-range=:500 {}"'
  alias fze='fzp --exact'
  alias fzm='fzp --multi'
  alias fzv='fzp --print0 | xargs -0 -o nvim'
  alias pzf='ps aux | fzf'
fi

# KITTY
if command -v kitty &>/dev/null; then
  alias icat='kitty +kitten icat'
  alias diff='kitty +kitten diff'
fi

# MPV
if command -v mpv &>/dev/null; then
  alias mpao='mpv --no-video'
  alias pdvd='mpv dvd://'
  alias ptsn='play_this_song_now' # Function
fi

# VPN
if command -v nordvpn &>/dev/null; then
  alias vpn='nordvpn'
  alias vpns='vpn status'
  alias vpnc='vpn connect'
  alias vpnd='vpn disconnect'
fi

# =============================================================================
# System Control
# =============================================================================

alias pdown='systemctl poweroff'
alias rboot='systemctl reboot'

# =============================================================================
# Package management
# =============================================================================

# APT
if command -v apt &>/dev/null; then
  alias apt='sudo apt'
  alias aptu='apt update'
  alias apts='apt search'
  alias apti='apt install'
fi

# NALA
if command -v nala &>/dev/null; then
  alias nala='sudo nala'
  alias nalu='nala update'
  alias nals='nala search'
  alias nali='nala install'
fi

# DNF
if command -v dnf &>/dev/null; then
  alias dnf='sudo dnf'
  alias dnfu='dnf update'
  alias dnfs='dnf search'
  alias dnfi='dnf install'
fi

# FLATPAK
if command -v flatpak &>/dev/null; then
  alias fpl='flatpak list'
  alias fpi='flatpak install'
  alias fpu='flatpak update'
fi

# =============================================================================
# Device specific aliases
# =============================================================================

if [ "$(hostname)" = "spring-terrace" ]; then
  alias bakcloud='laptop-bakcloud'
  alias bakhome='laptop-bakhome'
fi

# =============================================================================
# Random/fun/temporary
# =============================================================================

# FORTUNE TELLING COW
if command -v fortune &>/dev/null && command -v cowsay &>/dev/null; then
  alias cow='fortune | cowsay'
fi
