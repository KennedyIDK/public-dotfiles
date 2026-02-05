#!/bin/bash

_DESKTOP_HOSTNAME="sandy-bay"
[[ "${HOSTNAME}" == "${_DESKTOP_HOSTNAME}" ]] && {
  alias vpnc='sudo ~/bin/wgconnect'
  alias vpnd='sudo ~/bin/wgdisconnect'
}

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias c='clear'
alias q='exit'
alias :q='exit'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias uex='chmod u+x'
alias dir='vdir --color=auto'
alias adir='dir --all'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pdown='systemctl poweroff'
alias rboot='systemctl reboot'
alias refresh-fonts='fc-cache -f -v'

command -v ranger &>/dev/null && alias r='ranger'
command -v fastfetch &>/dev/null && alias fastfetch='fastfetch --logo none'
command -v lazygit &>/dev/null && alias lg='lazygit'

# VIM/NEOVIM
command -v nvim &>/dev/null && alias vim='nvim'
alias line='vim +'
alias eali='vim ~/.bash_aliases'
alias ebrc='vim ~/.bashrc'
alias esway='vim ~/.config/sway'
alias ewayb='vim ~/.config/waybar'
alias ebind='vim ~/.config/sway/keybinds'

# CURL
command -v curl &>/dev/null && {
  alias wto='curl v2d.wttr.in/Toronto'
  alias wedi='curl v2d.wttr.in/Edinburgh'
  alias wlon='curl v2d.wttr.in/London'
  alias vpns='curl https://am.i.mullvad.net/connected'
  alias dadjoke='curl https://icanhazdadjoke.com'
}

# LS
command -v lsd &>/dev/null && {
  alias ls='lsd'
  alias l='ls --long'
  alias la='l --all'
  alias ll='la --hyperlink always'
  alias lma='la --timesort'
  alias lm1='la --timesort | head --lines 10'
  alias lm2='la --timesort | head --lines 20'
  alias lb='la --sizesort'
  alias le='la --extensionsort'
  alias lt='la --tree'
  alias ld='lt --directory-only'
}

# ZOXIDE
command -v zoxide &>/dev/null && {
  alias cd='z'
  alias cdp='z -'
  alias cdown='cd ~/Downloads'
  alias cdot='cd ~/dotfiles'
}

# BAT
command -v bat &>/dev/null && {
  alias cat='bat --plain'
  alias bat='bat --style=numbers'
  alias gitbat='bat --diff --diff-context 3'
}
# CAT QUICK VIEWING
alias vali='cat ~/.bash_aliases'

# FD
command -v fd &>/dev/null && {
  alias fdf='fd --type f'
  alias fdd='fd --type d'
  alias fdg='fd --glob'
  alias fde='fd --extension'
  alias fda='fd --hidden'
}

# RIPGREP
command -v rg &>/dev/null && {
  alias rg='rg --smart-case'
  alias rge='rg --case-sensitive'
  alias rga='rg --hidden'
  alias rgz='rg --search-zip'
  alias rgv='rg --vimgrep'
  alias rgm='rg --sort=modified'
  alias rgo='rg --invert-match'
  alias rgc='rg --count'
}

# FUZZY FIND
command -v fzf &>/dev/null && {
  alias h='__fzf_history__'
  alias fzf='fzf --layout=reverse --height 40%'
  alias fzd='find * -type d | fzf > selected'
  alias fzs='fzf --query'
  alias fzp='fzf --preview="bat --line-range=:500 {}"'
  alias fze='fzp --exact'
  alias fzm='fzp --multi'
  alias fzv='fzp --print0 | xargs -0 -o nvim'
  alias pzf='ps aux | fzf'
}

# KITTY
command -v kitty &>/dev/null && {
  alias icat='kitty +kitten icat'
  alias diff='kitty +kitten diff'
}

# MPV
command -v mpv &>/dev/null && {
  alias mpao='mpv --no-video'
  alias pdvd='mpv dvd://'
}

# Package management
# =============================================================================

# APT
command -v apt &>/dev/null && {
  alias apt='sudo apt'
  alias aptu='apt update'
  alias apts='apt search'
  alias apti='apt install'
}

# NALA
command -v nala &>/dev/null && {
  alias nala='sudo nala'
  alias nalu='nala update'
  alias nals='nala search'
  alias nali='nala install'
}

# DNF
command -v dnf &>/dev/null && {
  alias dnf='sudo dnf'
  alias dnfu='dnf update'
  alias dnfs='dnf search'
  alias dnfi='dnf install'
}

# FLATPAK
command -v flatpak &>/dev/null && {
  alias fpl='flatpak list'
  alias fpi='flatpak install'
  alias fpu='flatpak update'
}

# PACMAN
command -v pacman &>/dev/null && {
  alias pacm='sudo pacman'
  alias pacu='pacm -Syu'
  alias pacs='pacm -Ss'
  alias paci='pacm -S'
}

# Other
# =============================================================================

# FORTUNE TELLING COW
if command -v fortune &>/dev/null && command -v cowsay &>/dev/null; then
  alias cow='fortune | cowsay'
fi
